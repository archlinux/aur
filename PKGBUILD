# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: drakkan <nicola.murino at gmail dot com>
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: ant32 <antreimer at gmail dot com>

_android_arch=x86

pkgname=android-${_android_arch}-curl
pkgver=8.6.0
pkgrel=1
arch=('any')
pkgdesc="An URL retrival utility and library (Android ${_android_arch})"
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
md5sums=('4418e0d94f29d352afafdab445e37a3d'
         '08976b11b3e986c43c2ebd8eac36e2fb'
         '0d6963bab0b98f8bc7cf8f2f7311e75a'
         '98ba4e01c3545650087a4852192ce10e')

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
