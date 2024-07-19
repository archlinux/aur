# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Christian Heusel <gromit@archlinux.org>
# Contributor: Aleksandar Trifunović <akstrfn at gmail dot com>

_android_arch=aarch64

pkgname=android-${_android_arch}-abseil-cpp
pkgver=20240116.2
pkgrel=2
arch=('any')
pkgdesc="Collection of C++ library code designed to augment the C++ standard library (Android ${_android_arch})"
url='https://abseil.io'
license=('Apache-2.0')
depends=('android-ndk')
makedepends=('android-cmake')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/abseil/abseil-cpp/archive/${pkgver}/abseil-cpp-${pkgver}.tar.gz"
        '0001-Disable-tests.patch')
md5sums=('f2c807858166b0a8ce4f679b17111335'
         'f06af905384ff2ddf97ef1c944d4bd3a')

prepare() {
    cd "${srcdir}/abseil-cpp-${pkgver}"

    patch -Np1 -i ../0001-Disable-tests.patch
}

build() {
    cd "${srcdir}/abseil-cpp-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -S . \
        -B build-shared \
        -DCMAKE_CXX_FLAGS="${CXXFLAGS} -DNDEBUG" \
        -DCMAKE_CXX_STANDARD=17 \
        -DBUILD_TESTING=OFF \
        -DBUILD_SHARED_LIBS=ON
    make -C build-shared $MAKEFLAGS

    android-${_android_arch}-cmake \
        -S . \
        -B build-static \
        -DCMAKE_CXX_FLAGS="${CXXFLAGS} -DNDEBUG" \
        -DCMAKE_CXX_STANDARD=17 \
        -DBUILD_TESTING=OFF \
        -DBUILD_SHARED_LIBS=OFF
    make -C build-static $MAKEFLAGS

}

package() {
    cd "${srcdir}/abseil-cpp-${pkgver}"
    source android-env ${_android_arch}

    make -C build-shared DESTDIR="$pkgdir" install
    make -C build-static DESTDIR="$pkgdir" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a || true
}
