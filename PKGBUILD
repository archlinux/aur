# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgbase=leaderf-git
pkgname=('vim-leaderf-git'
         'neovim-leaderf-git')
_pkgname=leaderf
pkgver=v1.22.r48.g312a13b
pkgrel=1
pkgdesc='An efficient fuzzy finder that helps to locate files, buffers, mrus, gtags, etc. on the fly for both vim and neovim.'
arch=('any')
url='https://github.com/Yggdroot/LeaderF'
license=('Apache')
source=("${_pkgname}::git+https://github.com/Yggdroot/LeaderF.git"
        "${_pkgname}-vim-doc.hook"
        "${_pkgname}-neovim-doc.hook")
sha256sums=('SKIP'
            'd125b79fe4f7e6d205010a96acf78ac63814c26d98050a46f8e627993ff033ea'
            'd7a7798ed8902de98c777f8770acd034e277f89478dc13eef77e491f2e99868d')
makedepends=('git'
             'python')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    bash install.sh
    touch doc/tags
}

package_vim-leaderf-git() {
    depends=('vim' 'python')
    provides=('vim-leaderf')
    conflicts=('vim-leaderf')
    _packdir="usr/share/vim/vimfiles/pack/${_pkgname}/start/${_pkgname}"
    _variant='vim'

    cd "${srcdir}/${_pkgname}"
    find autoload doc plugin syntax -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/${_packdir}/{}" \;
    install -Dm 644 "${srcdir}/${_pkgname}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 "${srcdir}/${_pkgname}-${_variant}-doc.hook" "${pkgdir}/usr/share/libalpm/hooks/${_pkgname}-${_variant}-doc.hook"
}

package_neovim-leaderf-git() {
    depends=('neovim' 'python-pynvim')
    provides=('neovim-leaderf')
    conflicts=('neovim-leaderf')
    _packdir="usr/local/share/nvim/site/pack/${_pkgname}/start/${_pkgname}"
    _variant='neovim'

    cd "${srcdir}/${_pkgname}"
    find autoload doc plugin syntax -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/${_packdir}/{}" \;
    install -Dm 644 "${srcdir}/${_pkgname}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 "${srcdir}/${_pkgname}-${_variant}-doc.hook" "${pkgdir}/usr/share/libalpm/hooks/${_pkgname}-${_variant}-doc.hook"
}
