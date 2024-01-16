# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: drakkan <nicola.murino at gmail dot com>

_android_arch=aarch64

pkgname=android-${_android_arch}-libwebp
pkgver=1.3.2
pkgrel=1
pkgdesc="WebP library and conversion tools (android)"
arch=('any')
url="https://developers.google.com/speed/webp/"
license=("BSD")
depends=("android-${_android_arch}-libjpeg-turbo"
         "android-${_android_arch}-libpng"
         "android-${_android_arch}-libtiff"
         "android-${_android_arch}-giflib")
groups=(android-libwebp)
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-configure')
source=("https://github.com/webmproject/libwebp/archive/v${pkgver}.tar.gz")
md5sums=('827d510b73c73fca3343140556dd2943')

prepare() {
    cd "$srcdir/libwebp-${pkgver}"
    source android-env ${_android_arch}

    NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd "$srcdir/libwebp-${pkgver}"
    source android-env ${_android_arch}
    unset LDFLAGS

    android-${_android_arch}-configure \
        --enable-swap-16bit-csp \
        --enable-experimental \
        --enable-libwebp{mux,demux,decoder,extras}

    make $MAKEFLAGS
}

package() {
    cd "$srcdir/libwebp-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    rm -r "${pkgdir}"/${ANDROID_PREFIX_BIN}
    rm -r "${pkgdir}"/${ANDROID_PREFIX_SHARE}
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
