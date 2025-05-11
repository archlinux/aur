# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Antony Male <antony dot male at geemail dot com>>

_android_arch=riscv64

pkgname=android-${_android_arch}-snappy
pkgver=1.2.2
pkgrel=1
arch=('any')
pkgdesc="A fast compressor/decompressor library (Android ${_android_arch})"
url="https://google.github.io/snappy/"
license=('BSD')
groups=('android-snappy')
depends=('android-ndk')
makedepends=('android-cmake')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/google/snappy/archive/${pkgver}/snappy-${pkgver}.tar.gz"
        'snappy.pc.in'
        '0001-Add-pkgconfig.patch')
md5sums=('30286dd6311dee1d5498c57f62eda7b8'
         '52264b05925281c591daea10f937424d'
         'de6ce2e289d166971edd67748eedaf3f')

prepare() {
    cd "${srcdir}/snappy-${pkgver}"
    source android-env ${_android_arch}

    cp ../snappy.pc.in .
    patch -Np1 -i ../0001-Add-pkgconfig.patch
    sed -i 's|cmake_minimum_required(VERSION 3.1)|cmake_minimum_required(VERSION 3.6)|g' CMakeLists.txt
}

build() {
    cd "${srcdir}/snappy-${pkgver}"
    source android-env ${_android_arch}

    # compile without assertions
    export CFLAGS="${CFLAGS} -DNDEBUG"
    export CXXFLAGS="${CXXFLAGS} -DNDEBUG"

    android-${_android_arch}-cmake \
        -S . \
        -B build-shared \
        -DBUILD_SHARED_LIBS=ON \
        -DSNAPPY_BUILD_TESTS=OFF \
        -DSNAPPY_BUILD_BENCHMARKS=OFF \
        -DSNAPPY_USE_BUNDLED_GTEST=OFF \
        -DSNAPPY_USE_BUNDLED_BENCHMARK_LIB=OFF \
        -Wno-dev
    make -C build-shared $MAKEFLAGS

    android-${_android_arch}-cmake \
        -S . \
        -B build-static \
        -DBUILD_SHARED_LIBS=OFF \
        -DSNAPPY_BUILD_TESTS=OFF \
        -DSNAPPY_BUILD_BENCHMARKS=OFF \
        -DSNAPPY_USE_BUNDLED_GTEST=OFF \
        -DSNAPPY_USE_BUNDLED_BENCHMARK_LIB=OFF \
        -Wno-dev
    make -C build-static $MAKEFLAGS
}

package() {
    cd "${srcdir}/snappy-${pkgver}"
    source android-env ${_android_arch}

    make -C build-shared DESTDIR="${pkgdir}" install
    make -C build-static DESTDIR="${pkgdir}" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
