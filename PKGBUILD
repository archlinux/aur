# Maintainer: ivanich
pkgname=kodi-addon-inputstream-adaptive-any
pkgver=20.3.16
pkgrel=2
pkgdesc="Inputstream adaptive without kodi-dev dependency, so it can be built on any architecture"
_koditarget=Nexus
_gitname=inputstream.adaptive
_kodiver=20.3
arch=('any')
url="https://github.com/xbmc/${_gitname}"
license=('GPL')
groups=('kodi')
makedepends=('cmake' 'git' 'patch')
provides=('kodi-addon-inputstream-adaptive')
conflicts=('kodi-addon-inputstream-adaptive' 'kodi-addon-inputstream-adaptive-19');
depends=('kodi')
source=("https://github.com/xbmc/${_gitname}/archive/${pkgver}-${_koditarget}.tar.gz"
        "https://github.com/xbmc/xbmc/archive/${_kodiver}-${_koditarget}.tar.gz"
)

sha256sums=('4651c022395f92906be40e8c923c9f90c3e9190d9dafee9e229ca1846605c5c5'
            '1dbf1d9f4d5eeeb6aa2593813703343a8a377e88a00c68226354e4d67467f64d')

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
