# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Chocobo1 <chocobo1@archlinux.net>

_android_arch=x86

pkgname=android-${_android_arch}-libdeflate
pkgver=1.20
pkgrel=1
arch=('any')
pkgdesc="Heavily optimized library for DEFLATE/zlib/gzip compression and decompression (Android ${_android_arch})"
url='https://github.com/ebiggers/libdeflate'
license=('MIT')
depends=('android-ndk')
makedepends=('android-cmake')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/ebiggers/libdeflate/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('14494b58c42b3bf65b4c469a8e4252ab')

build() {
    cd "${srcdir}/libdeflate-$pkgver"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -S . \
        -B build \
        -DLIBDEFLATE_BUILD_STATIC_LIB=ON \
        -DLIBDEFLATE_BUILD_TESTS=OFF \
        -DLIBDEFLATE_BUILD_GZIP=OFF
    cmake --build build
}

package() {
    cd "${srcdir}/libdeflate-$pkgver"
    source android-env ${_android_arch}

    DESTDIR="${pkgdir}" cmake --install build
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
