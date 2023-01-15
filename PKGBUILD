# Maintainer: ivanich
pkgname=kodi-addon-inputstream-ffmpegdirect
pkgver=20.5.0
pkgrel=1
pkgdesc="Inputstream ffmpegdirect kodi plugin"
_koditarget=Nexus
_gitname=inputstream.ffmpegdirect
_kodiver=20.0
arch=('armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url="https://github.com/xbmc/${_gitname}"
license=('GPL')
groups=('kodi')
makedepends=('cmake' 'git' 'autoconf' 'automake' 'patch' 'nasm' 'pkgconf')
provides=('kodi-addon-inputstream-ffmpegdirect')
depends=('kodi')
source=("https://github.com/xbmc/${_gitname}/archive/${pkgver}-${_koditarget}.tar.gz"
        "https://github.com/xbmc/xbmc/archive/${_kodiver}-${_koditarget}.tar.gz"
)

sha256sums=('a849b6b4d5ce740ec3552d244acc4c7a4d64792358428f5154236052473d5734'
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
