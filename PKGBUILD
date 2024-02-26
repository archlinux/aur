# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Andrew Sun <adsun701 at gmail dot com>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-libassuan
pkgver=2.5.6
pkgrel=1
arch=('any')
pkgdesc="IPC library used by some GnuPG related software (android)"
url="http://www.gnupg.org/related_software/libassuan/"
license=('GPL')
depends=("android-${_android_arch}-libgpg-error")
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://gnupg.org/ftp/gcrypt/libassuan/libassuan-${pkgver}.tar.bz2")
sha256sums=('e9fd27218d5394904e4e39788f9b1742711c3e6b41689a31aa3380bd5aa4f426')

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

    make DESTDIR="$pkgdir" install
    rm -rf "${pkgdir}"/${ANDROID_PREFIX_SHARE}
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
