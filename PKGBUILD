# Maintainer: c4tz
pkgname=kodi-addon-inputstream-adaptive-any
pkgver=2.4.5
pkgrel=2
pkgdesc="Inputstream adaptive without kodi-dev dependency, so it can be built on any architecture"
_koditarget=Leia
_gitname=inputstream.adaptive
_kodiver=18.8
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
        "https://github.com/xbmc/xbmc/commit/8f714dcc7f1a1dfa9b57ef18c3f4accc62cb0652.diff"
)
sha256sums=('14389878598f34c9eb931ee9c7b431ddd4ee19df7368fc718c34b8bf4b56b0a1'
            '6deb28f725880b1ab6c5920b55ef1190a79b0684ffb30b6e13b199d23a0af296'
            'c4ed6c685a3de5633387a8ca79c06141f643c47eace30c614223f9120f72a25a')

prepare() {
        cd xbmc-${_kodiver}-${_koditarget}
        patch -p1 cmake/scripts/common/HandleDepends.cmake ${srcdir}/8f714dcc7f1a1dfa9b57ef18c3f4accc62cb0652.diff
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
