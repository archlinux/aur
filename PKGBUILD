# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=riscv64

pkgname=android-${_android_arch}-gmp
pkgver=6.3.0
pkgrel=2
pkgdesc="A free library for arbitrary precision arithmetic (Android ${_android_arch})"
arch=('any')
url="http://gmplib.org"
license=("LGPL3")
groups=('android-gmp')
depends=('android-ndk')
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-configure')
source=("https://gmplib.org/download/gmp/gmp-${pkgver}.tar.lz")
md5sums=('db3f4050677df3ff2bd23422c0d3caa1')

build() {
    cd "${srcdir}/gmp-${pkgver}"
    source android-env ${_android_arch}

    export CFLAGS="${CFLAGS} -D_FORTIFY_SOURCE=2 -D__USE_FORTIFY_LEVEL=2"
    export CPPFLAGS="${CPPFLAGS} -D_FORTIFY_SOURCE=2 -D__USE_FORTIFY_LEVEL=2"

    android-${_android_arch}-configure \
        --enable-cxx
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/gmp-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
