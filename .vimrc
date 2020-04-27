" setting
if has('vim_starting')
    set nocompatible
endif

if !filereadable(expand('~/.vim/autoload/plug.vim'))
    if !executable("curl")
        echoerr "You have to install curl or first install vim-plug yourself!"
        execute "q!"
    endif
    echo "Installing Vim-Plug..."
    echo ""
    silent !\curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let g:not_finish_vimplug = "yes"
    autocmd VimEnter * PlugInstall
endif

" Plug
call plug#begin('~/.vim/plugged')

Plug 'mattn/vim-starwars'

"nerdtree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'jistr/vim-nerdtree-tabs'

"fzf
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

"ag
Plug 'rking/ag.vim'

"java plugin
Plug 'xuhdev/indent-java.vim'

"Vim alignment plugin
Plug 'junegunn/vim-easy-align'

"Aligning
Plug 'godlygeek/tabular'

"git status
Plug 'airblade/vim-gitgutter'

"search
Plug 'haya14busa/incsearch.vim'
Plug 'justinmk/vim-sneak'


Plug 'tpope/vim-surround'

"インデントを可視化
Plug 'nathanaelkane/vim-indent-guides'

Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

"Python の関数名や変数の補完する。
Plug 'davidhalter/jedi-vim'

"" space + qr -> exec script
Plug 'thinca/vim-quickrun'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}

call plug#end()
filetype plugin indent on    " required


"" auto-format
au BufWrite * :Autoformat

"autocmd VimEnter * NERDTree
let NERDTreeQuitOnOpen = 1
let NERDChristmasTree=1
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 30
let NERDTreeShowHidden=1
map <F1> :NERDTreeToggle<CR>
autocmd BufWritePre * :FixWhitespace
augroup NERD
    au!
    autocmd VimEnter * NERDTree
    autocmd VimEnter * wincmd p
augroup END

"easy plugin
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"ag
let g:ag_prg="/usr/local/bin/ag --vimgrep"

" fzf
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

"" jedi-vim
let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "0"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#smart_auto_mappings = 0
let g:jedi#force_py_version = 3
autocmd FileType python setlocal completeopt-=preview

"" Remember cursor position
augroup vimrc-remember-cursor-position
    autocmd!
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"" python
augroup vimrc-python
    autocmd!
    autocmd FileType python setlocal
                \ formatoptions+=croq softtabstop=4
                \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

" shortcut leader=Space
"" save
nnoremap <Leader>w :w<CR>
nnoremap <Leader>qqq :q!<CR>
nnoremap <Leader>eee :e<CR>
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>nn :noh<CR>

"" split
nnoremap <Leader>s :<C-u>split<CR>
nnoremap <Leader>v :<C-u>vsplit<CR>

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <Leader>t :tabnew<CR>

"" move 15 words
nmap <silent> <Tab> 15<Right>
nmap <silent> <S-Tab> 15<Left>
nmap <silent> ll 15<Right>
nmap <silent> hh 15<Left>
nmap <silent> jj 15<Down>
nmap <silent> kk 15<Up>

"" base
syntax on
color desert
set vb t_vb=
set noerrorbells
set nocompatible
set number
set autoindent
set smartindent
set smarttab
set cindent
set incsearch
set showmatch
set showcmd
set hlsearch
set ruler
set nobackup
set undodir="/tmp"
set ts=4
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set background=dark
set cursorline
set foldmarker={,}
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,Shift_Jis,gb18030,big5,euc-jp,euc-kr,latin1
set fileencoding=UTF-8
set pastetoggle=<F10>
set fileformats=unix,dos,mac
set bomb
set binary
set ttyfast
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\
set mouse=a
set whichwrap=b,s,h,l,<,>,[,]
" snippet
let g:UltiSnipsSnippetDirectories=["~/vim-snippets/"]
