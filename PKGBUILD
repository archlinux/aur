# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: drakkan <nicola.murino at gmail dot com>

_android_arch=aarch64

pkgname=android-${_android_arch}-libnghttp2
pkgver=1.58.0
pkgrel=2
arch=('any')
pkgdesc='Framing layer of HTTP/2 is implemented as a reusable C library (android)'
url='https://nghttp2.org/'
license=('MIT')
depends=('android-ndk')
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/nghttp2/nghttp2/releases/download/v$pkgver/nghttp2-$pkgver.tar.xz")
sha256sums=('4a68a3040da92fd9872c056d0f6b0cd60de8410de10b578f8ade9ecc14d297e0')

build() {
    cd "${srcdir}/nghttp2-$pkgver"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --disable-examples \
        --enable-lib-only
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/nghttp2-$pkgver"
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}/doc"
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}/man"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
