# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Antony Male <antony dot male at geemail dot com>>

_android_arch=x86-64

pkgname=android-${_android_arch}-snappy
pkgver=1.1.10
pkgrel=1
arch=('any')
pkgdesc="A fast compressor/decompressor library (Android ${_android_arch})"
url="https://google.github.io/snappy/"
license=('BSD')
depends=('android-ndk')
makedepends=('android-cmake')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/google/snappy/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        snappy.pc.in
        0001-Add-pkgconfig.patch
        0002-Disable-neon.patch)
sha256sums=('49d831bffcc5f3d01482340fe5af59852ca2fe76c3e05df0e67203ebbe0f1d90'
            '134f06ca0584a1026538d0fb972fc141c008390ecae1806184b721eca1abbc75'
            '2a204d7d35509ffc290d80c641fcb7e8488c67ca550aa1695493cff12c53156b'
            '4ba42f130366ee39d2afba4967c2afde4ebb490b6470d2a39506c630e31d20d4')

prepare() {
    cd "${srcdir}/snappy-$pkgver"
    source android-env ${_android_arch}

    cp ../snappy.pc.in .
    patch -Np1 -i ../0001-Add-pkgconfig.patch
    patch -Np1 -i ../0002-Disable-neon.patch
}

build() {
    cd "${srcdir}/snappy-$pkgver"
    source android-env ${_android_arch}

    # compile without assertions
    export CFLAGS="${CFLAGS} -DNDEBUG"
    export CXXFLAGS="${CXXFLAGS} -DNDEBUG"

    android-${_android_arch}-cmake \
        -DSNAPPY_BUILD_TESTS=OFF \
        -DSNAPPY_BUILD_BENCHMARKS=OFF \
        -DSNAPPY_USE_BUNDLED_GTEST=OFF \
        -DSNAPPY_USE_BUNDLED_BENCHMARK_LIB=OFF \
        .
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/snappy-$pkgver"
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
}
