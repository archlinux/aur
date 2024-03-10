# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-libgpg-error
pkgver=1.48
pkgrel=3
arch=('any')
pkgdesc="Support library for libgcrypt (Android, ${_android_arch})"
url="https://www.gnupg.org"
license=('LGPL')
depends=('android-ndk')
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://www.gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-${pkgver}.tar.bz2"{,.sig}
        '0001-Unversioned-libs.patch')
# https://www.gnupg.org/download/integrity_check.html
sha256sums=('89ce1ae893e122924b858de84dc4f67aae29ffa610ebf668d5aa539045663d6f'
            'SKIP'
            'd109aec757f631d3cda57d396f473338df4d74ee69d940445d474208efc38f17')
validpgpkeys=('6DAA6E64A76D2840571B4902528897B826403ADA') # Werner Koch (dist signing 2020)
validpgpkeys+=('AC8E115BF73E2D8D47FA9908E98E9B2D19C6C8BD') # Niibe Yutaka (GnuPG Release Key)

prepare() {
    cd "$srcdir/libgpg-error-${pkgver}"
    source android-env ${_android_arch}

    autoreconf -vfi
    patch -Np1 -i "../0001-Unversioned-libs.patch"
}

build() {
    cd "$srcdir/libgpg-error-${pkgver}"
    source android-env ${_android_arch}

    host=

    case "$_android_arch" in
        aarch64)
            host=aarch64-unknown-linux-gnu
            ;;
        armv7a-eabi)
            host=arm-unknown-linux-androideabi
            ;;
        x86)
            host=i686-unknown-linux-gnu
            ;;
        x86-64)
            host=x86_64-unknown-linux-gnu
            ;;
        *)
            ;;
    esac

    android-${_android_arch}-configure \
        --disable-doc \
        --disable-tests \
        --host "${host}" \
        --enable-install-gpg-error-config
    make $MAKEFLAGS
}

package() {
    cd "$srcdir/libgpg-error-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}/" install
    rm -rf "$pkgdir/${ANDROID_PREFIX_BIN}/gpg-error"
    rm -f "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so.*
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
