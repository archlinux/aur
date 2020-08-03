# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgbase=clap-git
pkgname=('vim-clap-git'
         'neovim-clap-git')
_pkgname=clap
pkgver=v0.19.r14.g91331ea
pkgrel=1
pkgdesc='Modern performant generic finder and dispatcher for Vim and NeoVim'
arch=('any')
url='https://github.com/liuchengxu/vim-clap'
license=('MIT')
source=("${_pkgname}::git+https://github.com/liuchengxu/vim-clap.git")
sha256sums=('SKIP')
makedepends=('git'
             'rustup'
             'make')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    make
}

package_vim-clap-git() {
    depends=('vim')
    optdepends=('python: for built-in fzy python implementation'
                'fzf: fzf external filter'
                'fzy: fzy external filter'
                'skim: skim external filter')
    provides=('vim-clap')
    conflicts=('vim-clap')
    _packdir="usr/share/vim/vimfiles/pack/${_pkgname}/start/${_pkgname}"
    _variant='vim'

    cd "${srcdir}/${_pkgname}"
    vim -es --cmd ":helptags doc" --cmd ":q"
    find autoload doc ftplugin plugin pythonx/clap/fuzzymatch_rs.so pythonx/clap/*.py syntax -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/${_packdir}/{}" \;
    install -Dm 755 "${srcdir}/${_pkgname}/target/release/maple" \
        "${pkgdir}/${_packdir}/bin/maple"
    install -Dm 644 "${srcdir}/${_pkgname}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_neovim-clap-git() {
    depends=('neovim')
    optdepends=('python-pynvim: for built-in fzy python implementation'
                'fzf: fzf external filter'
                'fzy: fzy external filter'
                'skim: skim external filter')
    provides=('neovim-clap')
    conflicts=('neovim-clap')
    _packdir="usr/local/share/nvim/site/pack/${_pkgname}/start/${_pkgname}"
    _variant='neovim'

    cd "${srcdir}/${_pkgname}"
    nvim -es --cmd ":helptags doc" --cmd ":q"
    find autoload doc ftplugin plugin pythonx/clap/fuzzymatch_rs.so pythonx/clap/*.py syntax -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/${_packdir}/{}" \;
    install -Dm 755 "${srcdir}/${_pkgname}/target/release/maple" \
        "${pkgdir}/${_packdir}/bin/maple"
    install -Dm 644 "${srcdir}/${_pkgname}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
