# Maintainer: ivanich
pkgname=kodi-addon-inputstream-adaptive-any
pkgver=19.0.7
pkgrel=1
pkgdesc="Inputstream adaptive without kodi-dev dependency, so it can be built on any architecture"
_koditarget=Matrix
_gitname=inputstream.adaptive
_kodiver=19.4
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

sha256sums=('b208313fd50442cabd339a16a3beec8cfa41c1b6bf19617ffeb269144c5f65fe'
            'cc026f59fd6e37ae90f3449df50810f1cefa37da9444e1188302d910518710da')
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
