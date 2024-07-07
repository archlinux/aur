# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

_android_arch=x86

pkgname=android-${_android_arch}-libgcrypt
pkgver=1.11.0
pkgrel=1
arch=('any')
pkgdesc="General purpose cryptographic library based on the code from GnuPG (Android ${_android_arch})"
url="https://www.gnupg.org"
license=('LGPL')
depends=("android-${_android_arch}-libgpg-error")
makedepends=("android-configure")
options=(!strip !buildflags staticlibs !emptydirs)
# https://www.gnupg.org/download/integrity_check.html
source=("https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-${pkgver}.tar.bz2")
md5sums=('321c4975cfd6a496f0530b65a673f9a4')

prepare() {
    cd "$srcdir/libgcrypt-${pkgver}"
    source android-env ${_android_arch}

    sed -i "s:t-secmem::" tests/Makefile.am
    sed -i "s:t-sexp::" tests/Makefile.am
    autoreconf -vfi
}

build() {
    cd "$srcdir/libgcrypt-${pkgver}"
    source android-env ${_android_arch}

    unset ANDROID_CFLAGS
    unset ANDROID_CPPFLAGS
    unset ANDROID_CXXFLAGS
    unset ANDROID_LDFLAGS

    export CFLAGS="-pipe -fno-plt -fexceptions -I${ANDROID_PREFIX_INCLUDE}"
    export CPPFLAGS="-D_FORTIFY_SOURCE=2 -D__USE_FORTIFY_LEVEL=2 -I${ANDROID_PREFIX_INCLUDE}"
    export CXXFLAGS="-pipe -fno-plt -fexceptions -I${ANDROID_PREFIX_INCLUDE}"
    export LDFLAGS="-Wl,--undefined-version -Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now -L${ANDROID_PREFIX_LIB}"

    android-${_android_arch}-configure \
        --infodir="${ANDROID_PREFIX_SHARE}/info/libgcrypt" \
        --disable-optimization \
        --disable-padlock-support
    make $MAKEFLAGS
}

package() {
    cd "$srcdir/libgcrypt-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_BIN}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
