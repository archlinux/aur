# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: drakkan <nicola.murino at gmail dot com>
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: ant32 <antreimer at gmail dot com>

_android_arch=x86

pkgname=android-${_android_arch}-curl
pkgver=8.14.1
pkgrel=1
arch=('any')
pkgdesc="An URL retrival utility and library (Android ${_android_arch})"
url="https://curl.haxx.se"
license=('MIT')
groups=('android-curl')
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
        "0002-nghttp2-static.patch")
md5sums=('bf683fcf55bed4c5bf66ca57ab99a96b'
         '83548784e93f008c64aea899a0905a07')

prepare() {
    cd "${srcdir}/curl-${pkgver}"
    source android-env ${_android_arch}

    patch -Np1 -i ../0002-nghttp2-static.patch

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

    make DESTDIR="${pkgdir}" install
    rm -r "${pkgdir}/${ANDROID_PREFIX_BIN}/curl"
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
