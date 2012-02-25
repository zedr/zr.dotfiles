"
"
"
" Vi is dead
set nocompatible
set ttyfast

" No Help key
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" No Manual either, thanks
nnoremap K <nop>

" UTF-8
set encoding=utf-8

" Code folding
set foldmethod=indent
set foldlevel=99

" Color theme
syntax enable
set background=dark
colorscheme zr

"Higlight current line only in insert mode
"autocmd InsertLeave * set nocursorline
"autocmd InsertEnter * set cursorline

""Highlight cursor
highlight CursorLine ctermbg=8 cterm=NONE

" More comfortable switching between splits
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Better statusline
set statusline=%t       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
set statusline+=%{fugitive#statusline()} "Fugitive

" Syntax
filetype on
filetype plugin indent on

" Reselect indent for visual block
vnoremap < <gv
vnoremap > >gv

""" Paste toggle hotkey
nnoremap <F1> :set invpaste paste?<CR>
set pastetoggle=<F2>

" Line numbers
set number

" General Tab rules
set expandtab           " enter spaces when tab is pressed
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent

" HTML (tab width 2 chr, no wrapping)
autocmd FileType html set sw=2
autocmd FileType html set ts=2
autocmd FileType html set sts=2
autocmd FileType html set textwidth=0
" XHTML (tab width 2 chr, no wrapping)
autocmd FileType xhtml set sw=2
autocmd FileType xhtml set ts=2
autocmd FileType xhtml set sts=2
autocmd FileType xhtml set textwidth=0
" Python (tab width 4 chr, wrap at 79th char)
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4
autocmd FileType python set textwidth=79
" CSS (tab width 2 chr, wrap at 79th char)
autocmd FileType css set sw=2
autocmd FileType css set ts=2
autocmd FileType css set sts=2
autocmd FileType css set textwidth=79
" JavaScript (tab width 4 chr, wrap at 79th)
autocmd FileType javascript set sw=4
autocmd FileType javascript set ts=4
autocmd FileType javascript set sts=4
autocmd FileType javascript set textwidth=79

" Text width of 80
set textwidth=80

" Remap the leader
let mapleader = ","

" Better buffer management
set hidden

" Longer history
set history=1000

" Command completion
set wildmenu
set wildmode=list:longest

" Case insensitive search
set ignorecase 
set smartcase

" Hotkey for clearing matches
noremap <leader><space> :noh<cr>:call clearmatches()<cr>

" Set the terminal title
set title

" Mantain cursor context
set scrolloff=3

" Sorry, swap files suck
set noswapfile

" Highlight search terms
set hlsearch
set incsearch

" Nuke annoying prompts
set shortmess=atI
set visualbell
set novb

" Visit modeline
set modeline                " Allow vim options to be embedded in files;
set modelines=5             " they must be within the first or last 5 lines.

" Try recognizing dos, unix, and mac line endings.
set ffs=unix,dos,mac        

" Init Pathogen
call pathogen#infect()
call pathogen#helptags()

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

nnoremap <leader>R :RainbowParenthesesToggle<cr>
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16

" Clean trailing whitespace
nnoremap <leader>w :%s/\s\+$//<cr>:let @/=''<cr>

" Supertab
let g:SuperTabDefaultCompletionType = "context"

" Formatting, TextMate-style
"
" Python stuff
"
"
"" PEP8
let g:pep8_map='<leader>8'
au FileType python set omnifunc=pythoncomplete#Complete
"" Rope
"map <leader>j :RopeGotoDefinition<CR>
"map <leader>r :RopeRename<CR>


"
" JS
"
augroup ft_javascript
    au!

    au FileType javascript setlocal foldmethod=marker
    au FileType javascript setlocal foldmarker={,}

    " Make {<cr> insert a pair of brackets in such a way that the cursor is correctly
    " positioned inside of them AND the following code doesn't get unfolded.
    au Filetype javascript inoremap <buffer> {<cr> {}<left><cr><space><space><space><space>.<cr><esc>kA<bs>
augroup END
set omnifunc=javascriptcomplete#CompleteJS

"
" Quick editing
"
nnoremap <leader>ev <C-w>v<C-w>j:e $MYVIMRC<cr>

" Make vim save and load the folding of the document each time it loads

" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null
