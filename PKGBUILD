# Maintainer: ivanich
pkgname=kodi-addon-inputstream-ffmpegdirect
pkgver=1.21.4
pkgrel=2
pkgdesc="Inputstream ffmpegdirect kodi plugin"
_koditarget=Matrix
_gitname=inputstream.ffmpegdirect
_kodiver=19.1
arch=('armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url="https://github.com/xbmc/${_gitname}"
license=('GPL')
groups=('kodi')
makedepends=('cmake' 'git' 'autoconf' 'automake' 'patch' 'nasm')
provides=('kodi-addon-inputstream-ffmpegdirect')
depends=('kodi')
source=("https://github.com/xbmc/${_gitname}/archive/${pkgver}-${_koditarget}.tar.gz"
        "https://github.com/xbmc/xbmc/archive/${_kodiver}-${_koditarget}.tar.gz"
)

sha256sums=('a26811689d5ada1254ab1e91d9148a7e6b4b87d227772daff2d98a4ba961bc76'
            '195a916a32057e259e6f42b49ba8f07cc6253460018851a52deb058ae938c58c')
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
