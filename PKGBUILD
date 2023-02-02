# Maintainer: mhaquila <mhaquila@pharosmaris.net>
pkgname=kodi-addon-pvr-freebox
pkgver=20.3.2
pkgrel=1
pkgdesc="Freebox TV + Kodi"
_kodiversion="Nexus"
_kodirelease=20.0
_gitname=pvr.freebox
arch=('any')
url="https://github.com/aassif/${_gitname}"
license=('MIT')
groups=('kodi')
depends=('kodi')
makedepends=('cmake')
source=("${url}/archive/refs/tags/${pkgver}-${_kodiversion}.tar.gz"
        "https://github.com/xbmc/xbmc/archive/${_kodirelease}-${_kodiversion}.tar.gz"
        )
sha256sums=('8d84012d055874e703627e90351cf9889e883d72db05c4bcacf6d8fef0ba4c80'
            '4c75add8b9ea44924b6ee45f94439545676033f35f5993908871e3dded527b79'
            )

prepare() {
    mkdir -p "${srcdir}/${_gitname}-${pkgver}-${_kodiversion}/build"
    ln -fs "${srcdir}/${_gitname}-${pkgver}-${_kodiversion}" "${srcdir}/${_gitname}"
}

build() {
    cd "${srcdir}/${_gitname}-${pkgver}-${_kodiversion}/build"
    cmake \
          -DADDONS_TO_BUILD=${_gitname} \
          -DADDON_SRC_PREFIX=${srcdir} \
          -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/src \
          -DPACKAGE_ZIP=1 \
          ${srcdir}/xbmc-${_kodirelease}-${_kodiversion}/cmake/addons
    make package-addons
}

package() {
    cd "${srcdir}/${_gitname}-${pkgver}-${_kodiversion}/build"
    mkdir -p "${pkgdir}/usr/share/licenses/kodi-addon-pvr-freebox"
    cp ../LICENSE "${pkgdir}/usr/share/licenses/kodi-addon-pvr-freebox"
    install -d "${pkgdir}/usr/share/kodi/addons"
    mv .install/${_gitname} "${pkgdir}/usr/share/kodi/addons"
}
