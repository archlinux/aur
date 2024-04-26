# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Christian Heusel <gromit@archlinux.org>
# Contributor: Aleksandar Trifunović <akstrfn at gmail dot com>

_android_arch=aarch64

pkgname=android-${_android_arch}-abseil-cpp
pkgver=20240116.1
pkgrel=1
arch=('any')
pkgdesc="Collection of C++ library code designed to augment the C++ standard library (Android ${_android_arch})"
url='https://abseil.io'
license=('Apache-2.0')
depends=('android-ndk')
makedepends=('android-cmake')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/abseil/abseil-cpp/archive/$pkgver/abseil-cpp-$pkgver.tar.gz")
sha256sums=('3c743204df78366ad2eaf236d6631d83f6bc928d1705dd0000b872e53b73dc6a')

build() {
    cd "${srcdir}/abseil-cpp-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -S . \
        -B build \
        -DCMAKE_CXX_FLAGS="${CXXFLAGS} -DNDEBUG" \
        -DCMAKE_CXX_STANDARD=17 \
        -DBUILD_TESTING=ON
    make -C build $MAKEFLAGS
}

package() {
    cd "${srcdir}/abseil-cpp-${pkgver}"
    source android-env ${_android_arch}

    make -C build DESTDIR="$pkgdir" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
}
