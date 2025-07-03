# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Christian Heusel <gromit@archlinux.org>
# Contributor: Aleksandar Trifunović <akstrfn at gmail dot com>

_android_arch=riscv64

pkgname=android-${_android_arch}-abseil-cpp
pkgver=20250512.1
pkgrel=1
arch=('any')
pkgdesc="Collection of C++ library code designed to augment the C++ standard library (Android ${_android_arch})"
url='https://abseil.io'
license=('Apache-2.0')
groups=('android-abseil-cpp')
depends=('android-ndk')
makedepends=('android-cmake')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/abseil/abseil-cpp/archive/${pkgver}/abseil-cpp-${pkgver}.tar.gz")
md5sums=('f225db90c7f3485f3bb65ab2aeae76fa')

build() {
    cd "${srcdir}/abseil-cpp-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -S . \
        -B build-shared \
        -DCMAKE_CXX_FLAGS="${CXXFLAGS} -DNDEBUG" \
        -DCMAKE_CXX_STANDARD=17 \
        -DBUILD_TESTING=OFF \
        -DABSL_BUILD_TESTING=OFF \
        -DABSL_BUILD_TEST_HELPERS=OFF \
        -DBUILD_SHARED_LIBS=ON
    make -C build-shared $MAKEFLAGS

    android-${_android_arch}-cmake \
        -S . \
        -B build-static \
        -DCMAKE_CXX_FLAGS="${CXXFLAGS} -DNDEBUG" \
        -DCMAKE_CXX_STANDARD=17 \
        -DBUILD_TESTING=OFF \
        -DABSL_BUILD_TESTING=OFF \
        -DABSL_BUILD_TEST_HELPERS=OFF \
        -DBUILD_SHARED_LIBS=OFF
    make -C build-static $MAKEFLAGS

}

package() {
    cd "${srcdir}/abseil-cpp-${pkgver}"
    source android-env ${_android_arch}

    make -C build-shared DESTDIR="${pkgdir}" install
    make -C build-static DESTDIR="${pkgdir}" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a || true
}
