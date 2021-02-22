# Maintainer: ivanich
pkgname=kodi-addon-inputstream-adaptive-any
pkgver=2.6.7
pkgrel=1
pkgdesc="Inputstream adaptive without kodi-dev dependency, so it can be built on any architecture"
_koditarget=Matrix
_gitname=inputstream.adaptive
_kodiver=19.0
arch=('any')
url="https://github.com/peak3d/${_gitname}"
license=('GPL')
groups=('kodi')
makedepends=('cmake' 'git')
provides=('kodi-addon-inputstream-adaptive')
conflicts=('kodi-addon-inputstream-adaptive' 'kodi-addon-inputstream-adaptive-19');
depends=('kodi')
source=("https://github.com/peak3d/${_gitname}/archive/${pkgver}-${_koditarget}.tar.gz"
        "https://github.com/xbmc/xbmc/archive/${_kodiver}-${_koditarget}.tar.gz"
)
sha256sums=('353207f5f98bf81ce8d79cec903c28da8c0227d7c7a632692c910d81e59c2dbe'
            'f7ef8a6f45862ae3b7ebfce4950d74f534be3cb4a0e67ce640963746b3f668f2')

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
