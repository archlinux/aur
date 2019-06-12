# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=x86-64
source android-env ${_android_arch}

pkgname=android-${_android_arch}-zlib
pkgver=1.2.11
pkgrel=2
pkgdesc="A compression/decompression Library (android)"
arch=('any')
url="http://www.zlib.net/"
license=('custom:zlib')
depends=('android-ndk')
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-environment' 'android-pkg-config')
source=("http://zlib.net/zlib-${pkgver}.tar.gz"
        "0001-Disable-versioning.patch")
md5sums=('1c9f62f0778697a09d36121ead88e08e'
         '2a60cf737d0fdd05c7795b1e6d6e6b69')

prepare() {
    cd "${srcdir}"/zlib-${pkgver}
    patch -Np1 -i ../0001-Disable-versioning.patch
}

build() {
    cd "${srcdir}"/zlib-${pkgver}

    export CC=${ANDROID_CC}
    export CXX=${ANDROID_CXX}

    ./configure \
        --prefix=${ANDROID_PREFIX} \
        --libdir=${ANDROID_PREFIX_LIB} \
        --includedir=${ANDROID_PREFIX_INCLUDE} \
        --enable-shared

    make $MAKEFLAGS
}

package () {
    cd "${srcdir}"/zlib-${pkgver}

    make DESTDIR="$pkgdir" install
    rm -r "${pkgdir}"/${ANDROID_PREFIX_SHARE}
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
