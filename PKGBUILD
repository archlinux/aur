# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Andrew Sun <adsun701 at gmail dot com>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-libassuan
pkgver=3.0.0
pkgrel=1
arch=('any')
pkgdesc="IPC library used by some GnuPG related software (Android ${_android_arch})"
url="http://www.gnupg.org/related_software/libassuan/"
license=('GPL')
groups=('android-libassuan')
depends=("android-${_android_arch}-libgpg-error")
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://gnupg.org/ftp/gcrypt/libassuan/libassuan-${pkgver}.tar.bz2")
md5sums=('b7f42a82a4864fb275c290a155cd1b8a')

prepare() {
    cd "${srcdir}/libassuan-${pkgver}"
    source android-env ${_android_arch}

    autoreconf -fi
}

build() {
    cd "${srcdir}/libassuan-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --with-libgpg-error-prefix="${ANDROID_PREFIX}"
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/libassuan-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
