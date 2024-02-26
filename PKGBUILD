# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Martchus <martchus@gmx.net>

_android_arch=x86-64

pkgname=android-${_android_arch}-gnutls
pkgver=3.8.3
pkgrel=1
arch=('any')
pkgdesc='A library which provides a secure layer over a reliable transport layer (android)'
url="https://www.gnutls.org/"
license=('GPL-3.0-or-later AND LGPL-2.1-or-later')
depends=("android-${_android_arch}-libtasn1"
         "android-${_android_arch}-readline"
         "android-${_android_arch}-zlib"
         "android-${_android_arch}-nettle"
         "android-${_android_arch}-p11-kit"
         "android-${_android_arch}-libunistring")
optdepends=("android-${_android_arch}-openssl: libgnutls-openssl")
makedepends=('android-configure' 'autogen')
options=(!strip !buildflags staticlibs !emptydirs)
source=(https://www.gnupg.org/ftp/gcrypt/gnutls/v${pkgver%.*}/gnutls-${pkgver}.tar.xz{,.sig})
sha256sums=('f74fc5954b27d4ec6dfbb11dea987888b5b124289a3703afcada0ee520f4173e'
            'SKIP')
validpgpkeys=('462225C3B46F34879FC8496CD605848ED7E69871') # "Daiki Ueno <ueno@unixuser.org>"

prepare() {
    cd "${srcdir}/gnutls-${pkgver}"
    source android-env ${_android_arch}

    autoreconf -vfi
}

build() {
    cd "${srcdir}/gnutls-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --with-idn \
        --with-brotli \
        --with-zstd \
        --with-tpm2 \
        --disable-doc \
        --enable-ktls \
        --enable-openssl-compatibility \
        --disable-srp-authentication \
        --disable-rpath \
        --disable-non-suiteb-curves \
        --disable-gtk-doc \
        --disable-full-test-suite \
        --disable-rpath \
        --disable-tools \
        --with-libiconv-prefix="${ANDROID_PREFIX}" \
        --enable-nls \
        --enable-cxx \
        --without-tpm \
        --without-tpm2
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/gnutls-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
