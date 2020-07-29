# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=vim-coc-marketplace-git
_pkgname=vim-coc-marketplace
_extname=coc-marketplace
pkgver=v1.4.0.r109.ga1ec912
pkgrel=1
pkgdesc='coc.nvim extensions marketplace'
arch=('any')
url='https://github.com/fannheyward/coc-marketplace'
depends=('vim-coc')
makedepends=('git' 'yarn' 'npm')
_packdir="usr/share/vim/vimfiles/pack/coc/start/${_extname}"
license=('')
groups=('vim-coc-extras-git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install="${pkgname}.install"
source=("${_extname}::git+${url}.git"
        "${pkgname}.install")
sha256sums=('SKIP'
            '764001d12674596f3494dd4f08ca3754ff93bf7b6ea294a96e6c4eabbbb0197b')

pkgver() {
    cd "${srcdir}/${_extname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_extname}"
    yarn install --frozen-lockfile
    yarn pack
    tar xvf *.tgz
    rm *.tgz
    cd package
    npm install --only=production --no-lockfile --ignore-scripts
}

package() {
    cd "${srcdir}/${_extname}/package"
    find . -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/${_packdir}/{}" \;
    rm -rf "${srcdir}/${_extname}/package"
}
