# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgbase=clap-git
pkgname=('vim-clap-git'
         'neovim-clap-git')
_pkgname=clap
pkgver=0.23.r2.gb6d82bc
pkgrel=1
pkgdesc='Modern performant generic finder and dispatcher for Vim and NeoVim'
arch=('x86_64')
url='https://github.com/liuchengxu/vim-clap'
license=('MIT')
groups=('vim-plugins')
makedepends=('git' 'rust' 'python')
source=("${_pkgname}::git+https://github.com/liuchengxu/vim-clap.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    sed -i 's,/setup_python.py,/pythonx/clap/setup_python.py,' \
        autoload/clap/filter/sync/python.vim
}

build() {
    cd "${srcdir}/${_pkgname}"
    cargo build --release --locked
    cd pythonx/clap/fuzzymatch-rs
    cargo build --release --locked
}

package_vim-clap-git() {
    depends=('vim' 'gcc-libs')
    optdepends=('python: for the Python dynamic module'
                'git: for the bcommits, commits, files, gfiles or git_files, and git_diff_files providers'
                'ctags: for the proj_tags provider'
                'ripgrep: for the files and grep providers'
                'fzf: for the fzf external filter'
                'fzy: for the fzy external filter'
                'skim: for the sk external filter')
    provides=('vim-clap')
    conflicts=('vim-clap')
    _packdir="usr/share/vim/vimfiles/pack/${_pkgname}/start/${_pkgname}"

    cd "${srcdir}/${_pkgname}"
    vim -es --cmd ":helptags doc" --cmd ":q"
    install -Dt "$pkgdir"/usr/bin target/release/maple
    install -Dm644 pythonx/clap/fuzzymatch-rs/target/release/libfuzzymatch_rs.so \
        "$pkgdir"/usr/lib/fuzzymatch_rs.so
    install -Dm644 -t "$pkgdir/$_packdir/pythonx/clap" \
        pythonx/clap/*.py setup_python.py
    ln -s /usr/lib/fuzzymatch_rs.so "$pkgdir/$_packdir/pythonx/clap"
    cp -r autoload doc ftplugin lua plugin syntax "$pkgdir/$_packdir"
    install -Dm 644 "${srcdir}/${_pkgname}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_neovim-clap-git() {
    depends=('neovim' 'gcc-libs')
    optdepends=('python-pynvim: for the Python dynamic module'
                'git: for the bcommits, commits, files, gfiles or git_files, and git_diff_files providers'
                'ctags: for the proj_tags provider'
                'ripgrep: for the files and grep providers'
                'fzf: for the fzf external filter'
                'fzy: for the fzy external filter'
                'skim: for the sk external filter')
    provides=('neovim-clap')
    conflicts=('neovim-clap')
    _packdir="usr/share/nvim/runtime/pack/${_pkgname}/start/${_pkgname}"

    cd "${srcdir}/${_pkgname}"
    nvim -es --cmd ":helptags doc" --cmd ":q"
    install -Dt "$pkgdir"/usr/bin target/release/maple
    install -Dm644 pythonx/clap/fuzzymatch-rs/target/release/libfuzzymatch_rs.so \
        "$pkgdir"/usr/lib/fuzzymatch_rs.so
    install -Dm644 -t "$pkgdir/$_packdir/pythonx/clap" \
        pythonx/clap/*.py setup_python.py
    ln -s /usr/lib/fuzzymatch_rs.so "$pkgdir/$_packdir/pythonx/clap"
    cp -r autoload doc ftplugin lua plugin syntax "$pkgdir/$_packdir"
    install -Dm 644 "${srcdir}/${_pkgname}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
