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
source=("${_pkgname}::git+https://github.com/liuchengxu/vim-clap.git"
        "${_pkgname}-vim-doc.hook"
        "${_pkgname}-neovim-doc.hook")
sha256sums=('SKIP'
            '0fe8cf209778fb3345886a43393cfda53e5c5e4a09d8b09a049e892ba9c33acf'
            '87029a9d3c0c899a6b5327c7c67f65af7644f2b6a697e84c6c01c2aa107cd4dd')
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
    touch doc/tags
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
    find autoload doc ftplugin plugin pythonx/clap/fuzzymatch_rs.so pythonx/clap/*.py syntax -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/${_packdir}/{}" \;
    install -Dm 755 "${srcdir}/${_pkgname}/target/release/maple" \
        "${pkgdir}/${_packdir}/bin/maple"
    install -Dm 644 "${srcdir}/${_pkgname}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 "${srcdir}/${_pkgname}-${_variant}-doc.hook" "${pkgdir}/usr/share/libalpm/hooks/${_pkgname}-${_variant}-doc.hook"
}

package_neovim-clap-git() {
    depends=('neovim')
    optdepends=('python-pynvim: for built-in fzy python implementation'
                'fzf: fzf external filter'
                'fzy: fzy external filter'
                'skim: skim external filter')
    provides=('neovim-clap')
    conflicts=('neovim-clap')
    _packdir="usr/share/nvim/runtime/pack/${_pkgname}/start/${_pkgname}"
    _variant='neovim'

    cd "${srcdir}/${_pkgname}"
    find autoload doc ftplugin plugin pythonx/clap/fuzzymatch_rs.so pythonx/clap/*.py syntax -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/${_packdir}/{}" \;
    install -Dm 755 "${srcdir}/${_pkgname}/target/release/maple" \
        "${pkgdir}/${_packdir}/bin/maple"
    install -Dm 644 "${srcdir}/${_pkgname}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 "${srcdir}/${_pkgname}-${_variant}-doc.hook" "${pkgdir}/usr/share/libalpm/hooks/${_pkgname}-${_variant}-doc.hook"
}
