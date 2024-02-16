# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

_android_arch=x86-64

pkgname=android-${_android_arch}-libgcrypt
pkgver=1.10.3
pkgrel=1
arch=('any')
pkgdesc="General purpose cryptographic library based on the code from GnuPG (android)"
url="https://www.gnupg.org"
license=('LGPL')
depends=("android-${_android_arch}-libgpg-error")
options=(!strip !buildflags staticlibs !emptydirs)
# https://www.gnupg.org/download/integrity_check.html
source=(https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-${pkgver}.tar.bz2{,.sig})
sha256sums=('8b0870897ac5ac67ded568dcfadf45969cfa8a6beb0fd60af2a9eadc2a3272aa'
            'SKIP')
validpgpkeys=('AC8E115BF73E2D8D47FA9908E98E9B2D19C6C8BD') # Niibe Yutaka (GnuPG Release Key)

prepare() {
    cd "$srcdir/libgcrypt-${pkgver}"
    source android-env ${_android_arch}

    # tests fail due to systemd+libseccomp preventing memory syscalls when building in chroots
    #  t-secmem: line 176: gcry_control (GCRYCTL_INIT_SECMEM, pool_size, 0) failed: General error
    #  FAIL: t-secmem
    #  t-sexp: line 1174: gcry_control (GCRYCTL_INIT_SECMEM, 16384, 0) failed: General error
    #  FAIL: t-sexp
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
