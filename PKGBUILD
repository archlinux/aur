# Maintainer: c4tz
pkgname=kodi-addon-inputstream-adaptive-any
pkgver=2.4.6
pkgrel=2
pkgdesc="Inputstream adaptive without kodi-dev dependency, so it can be built on any architecture"
_koditarget=Leia
_gitname=inputstream.adaptive
_kodiver=18.9
arch=('any')
url="https://github.com/peak3d/${_gitname}"
license=('GPL')
groups=('kodi')
makedepends=('cmake' 'git')
provides=('kodi-addon-inputstream-adaptive')
conflicts=('kodi-addon-inputstream-adaptive' 'kodi-addon-inputstream-adaptive-18');
depends=('kodi')
source=("https://github.com/peak3d/${_gitname}/archive/${pkgver}-${_koditarget}.tar.gz"
        "https://github.com/xbmc/xbmc/archive/${_kodiver}-${_koditarget}.tar.gz"
)
sha256sums=('222b7ad879146c62a1fc6016fc70ca1ca57b3b882882ebc54e0b772bf96482e7'
            'bdf8afa9356b1f815de9984801d3e0d2b46a719e747895b75528f20995c59d2b')

prepare() {
        cd xbmc-${_kodiver}-${_koditarget}
}

build() {
        mkdir -p "${_gitname}-${pkgver}-${_koditarget}/build"
        cd "${_gitname}-${pkgver}-${_koditarget}/build"

        cmake \
                -DCMAKE_INSTALL_PREFIX=/usr \
                -DCMAKE_INSTALL_LIBDIR=/usr/lib/kodi \
                -DCMAKE_BUILD_TYPE=Release \
                -DBUILD_SHARED_LIBS=1 \
                -DADDONS_TO_BUILD=${_gitname} \
                -DADDONS_SRC_PREFIX=../.. \
                ../../xbmc-${_kodiver}-${_koditarget}/cmake/addons
        make
}

package() {
        cd "${_gitname}-${pkgver}-${_koditarget}/build"
        install -d "${pkgdir}/usr"
        mv .install/lib "${pkgdir}/usr/"
        mv .install/share "${pkgdir}/usr/"
}
