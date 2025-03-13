# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Chocobo1 <chocobo1@archlinux.net>

_android_arch=x86

pkgname=android-${_android_arch}-libdeflate
pkgver=1.23
pkgrel=1
arch=('any')
pkgdesc="Heavily optimized library for DEFLATE/zlib/gzip compression and decompression (Android ${_android_arch})"
url='https://github.com/ebiggers/libdeflate'
license=('MIT')
groups=('android-libdeflate')
depends=('android-ndk')
makedepends=('android-cmake')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/ebiggers/libdeflate/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('9815bc968d0f97b5188f1f00e333da71')

build() {
    cd "${srcdir}/libdeflate-${pkgver}"
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
    cd "${srcdir}/libdeflate-${pkgver}"
    source android-env ${_android_arch}

    DESTDIR="${pkgdir}" cmake --install build
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
