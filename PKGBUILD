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
source=("${_pkgname}::git+https://github.com/Yggdroot/LeaderF.git")
sha256sums=('SKIP')
makedepends=('git'
             'python')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    bash install.sh
}

package_vim-leaderf-git() {
    depends=('vim' 'python')
    provides=('vim-leaderf')
    conflicts=('vim-leaderf')
    _packdir="usr/share/vim/vimfiles/pack/${_pkgname}/start/${_pkgname}"
    _variant='vim'

    cd "${srcdir}/${_pkgname}"
    vim -es --cmd ":helptags doc" --cmd ":q"
    find autoload doc plugin syntax -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/${_packdir}/{}" \;
    install -Dm 644 "${srcdir}/${_pkgname}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_neovim-leaderf-git() {
    depends=('neovim' 'python-pynvim')
    provides=('neovim-leaderf')
    conflicts=('neovim-leaderf')
    _packdir="usr/local/share/nvim/site/pack/${_pkgname}/start/${_pkgname}"
    _variant='neovim'

    cd "${srcdir}/${_pkgname}"
    nvim -es --cmd ":helptags doc" --cmd ":q"
    find autoload doc plugin syntax -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/${_packdir}/{}" \;
    install -Dm 644 "${srcdir}/${_pkgname}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
