# Maintainer: Daniil Kovalev <daniil at kovalev dot website>

_target_arch=aarch64

pkgname=${_target_arch}-zlib
pkgver=1.3.1
pkgrel=1
pkgdesc="A compression/decompression Library (aarch64)"
arch=('any')
url="https://www.zlib.net/"
license=('custom:zlib')
options=(!buildflags staticlibs !emptydirs)
makedepends=('aarch64-linux-gnu-gcc')
source=("https://zlib.net/zlib-${pkgver}.tar.gz")
sha256sums=('9a93b2b7dfdac77ceba5a558a580e74667dd6fede4585b91eefb60f03b72df23')

prepare() {
    cd "${srcdir}"/zlib-${pkgver}

    export CC=${_target_arch}-linux-gnu-gcc
    export CXX=${_target_arch}-linux-gnu-g++
    export STRIP=${_target_arch}-linux-gnu-strip

    export TARGET_PREFIX=/usr/${_target_arch}-linux-gnu
    export TARGET_PREFIX_LIB="$TARGET_PREFIX"/lib
    export TARGET_PREFIX_INCLUDE="$TARGET_PREFIX"/include
    export TARGET_PREFIX_SHARE="$TARGET_PREFIX"/share
}

build() {
    cd "${srcdir}"/zlib-${pkgver}

    ./configure \
        --prefix=${TARGET_PREFIX} \
        --libdir=${TARGET_PREFIX_LIB} \
        --includedir=${TARGET_PREFIX_INCLUDE} \
        --enable-shared

    make $MAKEFLAGS
}

package () {
    cd "${srcdir}"/zlib-${pkgver}

    make DESTDIR="$pkgdir" install
    rm -r "${pkgdir}"/${TARGET_PREFIX_SHARE}
    ${STRIP} -g --strip-unneeded "${pkgdir}"/${TARGET_PREFIX_LIB}/*.so || true
    ${STRIP} -g "$pkgdir"/${TARGET_PREFIX_LIB}/*.a
}
