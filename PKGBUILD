# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: drakkan <nicola.murino at gmail dot com>

_android_arch=x86

pkgname=android-${_android_arch}-libwebp
pkgver=1.5.0
pkgrel=1
arch=('any')
pkgdesc="WebP library and conversion tools (Android ${_android_arch})"
url="https://developers.google.com/speed/webp/"
license=("BSD")
groups=('android-libwebp')
depends=("android-${_android_arch}-libjpeg-turbo"
         "android-${_android_arch}-libpng"
         "android-${_android_arch}-libtiff"
         "android-${_android_arch}-giflib")
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/webmproject/libwebp/archive/v${pkgver}.tar.gz")
md5sums=('4d1324c93788a4333aacc6238e0ef251')

prepare() {
    cd "$srcdir/libwebp-${pkgver}"
    source android-env ${_android_arch}

    NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd "$srcdir/libwebp-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --with-pic \
        --enable-swap-16bit-csp \
        --enable-experimental \
        --enable-libwebp{mux,demux,decoder,extras}
    make $MAKEFLAGS
}

package() {
    cd "$srcdir/libwebp-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    rm -r "${pkgdir}/${ANDROID_PREFIX_BIN}"
    rm -r "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
