# Maintainer: acidicX
pkgname=kodi-addon-inputstream-adaptive-any
pkgver=21.5.26
pkgrel=1
pkgdesc="Inputstream adaptive without kodi-dev dependency, so it can be built on any architecture"
_koditarget=Omega
_gitname=inputstream.adaptive
_kodiver=21.3
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
sha256sums=('c6fca33834d6bbba70766a0a1795cf75a6e6e3a1836e67a0bbae721df3de617e'
            'a60afcb556e4a00cb19fc35b7e77758107c9a8096c6ce9b66af5f92396be31aa')

prepare() {
        cd ${_gitname}-${pkgver}-${_koditarget}
}

build() {
        mkdir -p "${_gitname}-${pkgver}-${_koditarget}/build"
        cd "${_gitname}-${pkgver}-${_koditarget}/build"

        cmake \
                -D CMAKE_POLICY_VERSION_MINIMUM=3.5 \
                -D CMAKE_INSTALL_PREFIX=/usr \
                -D CMAKE_INSTALL_LIBDIR=/usr/lib/kodi \
                -D CMAKE_BUILD_TYPE=Release \
                -D BUILD_SHARED_LIBS=1 \
                -D ADDONS_TO_BUILD=${_gitname} \
                -D ADDONS_SRC_PREFIX=../.. \
                ../../xbmc-${_kodiver}-${_koditarget}/cmake/addons
        make
}

package() {
        cd "${_gitname}-${pkgver}-${_koditarget}/build"
        install -d "${pkgdir}/usr"
        mv .install/lib "${pkgdir}/usr/"
        mv .install/share "${pkgdir}/usr/"
}
