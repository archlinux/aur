# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-libgcrypt
pkgver=1.10.3
pkgrel=2
arch=('any')
pkgdesc="General purpose cryptographic library based on the code from GnuPG (Android, ${_android_arch})"
url="https://www.gnupg.org"
license=('LGPL')
depends=("android-${_android_arch}-libgpg-error")
makedepends=("android-configure")
options=(!strip !buildflags staticlibs !emptydirs)
# https://www.gnupg.org/download/integrity_check.html
source=("https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-${pkgver}.tar.bz2"{,.sig})
md5sums=('a8cada0b343e10dbee51c9e92d856a94'
         'SKIP')
validpgpkeys=('AC8E115BF73E2D8D47FA9908E98E9B2D19C6C8BD') # Niibe Yutaka (GnuPG Release Key)

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

    export LDFLAGS="-Wl,--undefined-version ${LDFLAGS}"

    android-${_android_arch}-configure \
        --infodir="${ANDROID_PREFIX_SHARE}/info/libgcrypt" \
        --disable-padlock-support
    make $MAKEFLAGS
}

package() {
    cd "$srcdir/libgcrypt-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_BIN}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
