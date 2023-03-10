# Maintainer: ivanich
pkgname=kodi-addon-inputstream-adaptive-any
pkgver=20.3.5
pkgrel=1
pkgdesc="Inputstream adaptive without kodi-dev dependency, so it can be built on any architecture"
_koditarget=Nexus
_gitname=inputstream.adaptive
_kodiver=20.0
arch=('any')
url="https://github.com/peak3d/${_gitname}"
license=('GPL')
groups=('kodi')
makedepends=('cmake' 'git' 'patch')
provides=('kodi-addon-inputstream-adaptive')
conflicts=('kodi-addon-inputstream-adaptive' 'kodi-addon-inputstream-adaptive-19');
depends=('kodi')
source=("https://github.com/peak3d/${_gitname}/archive/${pkgver}-${_koditarget}.tar.gz"
        "https://github.com/xbmc/xbmc/archive/${_kodiver}-${_koditarget}.tar.gz"
)

sha256sums=('3851e1ac48aa38681b6ff6cfb39ab2cc24156b859d1a257be63f3c4d9fd926de'
            '4c75add8b9ea44924b6ee45f94439545676033f35f5993908871e3dded527b79')

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
