# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=x86

pkgname=android-${_android_arch}-gmp
pkgver=6.3.0
pkgrel=1
pkgdesc="A free library for arbitrary precision arithmetic (android)"
arch=('any')
url="http://gmplib.org"
license=("LGPL3")
depends=('android-ndk')
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-configure')
source=("https://gmplib.org/download/gmp/gmp-$pkgver.tar.lz")
sha256sums=('be5c908a7a836c3a9bd9d62aa58563c5e9e7fef94c43a7f42dbc35bb6d02733c')

build() {
    cd "${srcdir}"/gmp-${pkgver}
    source android-env ${_android_arch}

    export CFLAGS="${CFLAGS} -D_FORTIFY_SOURCE=2 -D__USE_FORTIFY_LEVEL=2"
    export CPPFLAGS="${CPPFLAGS} -D_FORTIFY_SOURCE=2 -D__USE_FORTIFY_LEVEL=2"

    android-${_android_arch}-configure \
        --enable-cxx
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}"/gmp-${pkgver}
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
