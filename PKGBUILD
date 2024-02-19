# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: drakkan <nicola.murino at gmail dot com>
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: ant32 <antreimer at gmail dot com>

_android_arch=aarch64

pkgname=android-${_android_arch}-curl
pkgver=8.5.0
pkgrel=1
arch=('any')
pkgdesc="An URL retrival utility and library (android)"
url="https://curl.haxx.se"
license=("MIT")
depends=("android-${_android_arch}-brotli"
         "android-${_android_arch}-libidn2"
         "android-${_android_arch}-libnghttp2"
         "android-${_android_arch}-libnghttp3"
         "android-${_android_arch}-libpsl"
         "android-${_android_arch}-libssh2"
         "android-${_android_arch}-openssl"
         "android-${_android_arch}-zstd"
         "android-${_android_arch}-zlib")
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("${url}/download/curl-${pkgver}.tar.bz2"
        "0002-nghttp2-static.patch"
        "0003-libpsl-static-libs.patch"
        "0004-more-static-fixes.patch")
sha256sums=('ce4b6a6655431147624aaf582632a36fe1ade262d5fab385c60f78942dd8d87b'
            '3ee9c75a3046f86f91290c143170179230c9adc6eabfbb79eb26f708a165b719'
            '7492d019036b5bec251bfbc3c0b40e5f16d3dd6b2515068835e087a6c21f19ad'
            '590eb65e90e756eaad993d52a101f29091ada2c742c5a607684e88fc5c560d54')

prepare() {
    cd "${srcdir}/curl-${pkgver}"
    source android-env ${_android_arch}

    patch -Np1 -i ../0002-nghttp2-static.patch
    patch -Np1 -i ../0003-libpsl-static-libs.patch
    patch -Np1 -i ../0004-more-static-fixes.patch

    autoreconf -vfi
}

build() {
    cd "${srcdir}/curl-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --enable-static \
        --enable-shared \
        --with-openssl \
        --enable-ipv6 \
        --with-libidn2 \
        --with-libssh2 \
        --without-ca-bundle \
        --without-random \
        --with-libpsl \
        --with-brotli \
        --with-zstd
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/curl-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    rm -r "${pkgdir}/${ANDROID_PREFIX_BIN}/curl"
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
