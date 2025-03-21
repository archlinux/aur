# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_android_arch=aarch64

pkgname=android-${_android_arch}-libmp4v2
pkgver=2.1.3
pkgrel=2
arch=('any')
pkgdesc="A C/C++ library to create, modify and read MP4 files (Android ${_android_arch})"
url="https://mp4v2.org/"
license=('MPL')
groups=('android-libmp4v2')
depends=('android-ndk')
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/enzo1982/mp4v2/releases/download/v${pkgver}/mp4v2-${pkgver}.tar.bz2")
md5sums=('a54031f6071bd397ffcc7ec817cfbcdd')

build() {
    cd "${srcdir}/mp4v2-${pkgver}"
    source android-env ${_android_arch}

    export FOUND_HELP2MAN=no
    android-${_android_arch}-configure \
        --disable-util
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/mp4v2-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_BIN}"
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
