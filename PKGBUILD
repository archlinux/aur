# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Martchus <martchus@gmx.net>

_android_arch=x86-64

pkgname=android-${_android_arch}-gnutls
pkgver=3.8.9
pkgrel=1
arch=('any')
pkgdesc="A library which provides a secure layer over a reliable transport layer (Android ${_android_arch})"
url="https://www.gnutls.org/"
license=('GPL-3.0-or-later AND LGPL-2.1-or-later')
groups=('android-gnutls')
depends=("android-${_android_arch}-libtasn1"
         "android-${_android_arch}-readline"
         "android-${_android_arch}-zlib"
         "android-${_android_arch}-nettle"
         "android-${_android_arch}-p11-kit"
         "android-${_android_arch}-libunistring")
makedepends=('android-configure'
             'autogen')
optdepends=("android-${_android_arch}-openssl: libgnutls-openssl")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://www.gnupg.org/ftp/gcrypt/gnutls/v${pkgver%.*}/gnutls-${pkgver}.tar.xz")
md5sums=('33f4c800c20af2983c45223a803da865')

build() {
    cd "${srcdir}/gnutls-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --with-idn \
        --with-brotli \
        --with-zstd \
        --with-tpm2 \
        --disable-doc \
        --disable-tests \
        --disable-valgrind-tests \
        --disable-full-test-suite \
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

    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
