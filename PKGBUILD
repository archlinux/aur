# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=riscv64

pkgname=android-${_android_arch}-libiconv
pkgver=1.18
pkgrel=1
arch=('any')
pkgdesc="Provides GNU libiconv.so and libcharset.so (Android ${_android_arch})"
url="http://www.gnu.org/software/libiconv/"
license=("LGPL")
groups=('android-libiconv')
depends=('android-ndk')
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("http://ftp.gnu.org/pub/gnu/libiconv/libiconv-$pkgver.tar.gz")
md5sums=('1af69958b42981d3c3029ffb4c7ebaed')

build() {
    cd "${srcdir}/libiconv-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --disable-nls
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/libiconv-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -r "${pkgdir}/${ANDROID_PREFIX_BIN}"
    rm -r "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
