# Maintainer: mhaquila <mhaquila@pharosmaris.net>
pkgname=kodi-addon-pvr-freebox
pkgver=21.0.0
pkgrel=1
pkgdesc="Freebox TV + Kodi"
_kodiversion="Omega"
_kodirelease=21.0
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
sha256sums=('d309e3d073d7dbfc387ae8498f4d0b974785d4d5621e79bd83058c8e73de67f2'
            '7f54c1fd8456ac46221fbc85e447362bdc209163c6cb19fca98d106560071b7c'
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
