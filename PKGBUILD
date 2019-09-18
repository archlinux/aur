# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>

pkgname=abseil-cpp
pkgver=20190808
pkgrel=1
pkgdesc="Abseil Common Libraries (C++)"
arch=('any')
url="https://github.com/abseil/abseil-cpp"
license=('Apache')
makedepends=('cmake' 'git')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('8100085dada279bf3ee00cd064d43b5f55e5d913be0dfe2906f06f8f28d5b37e')

prepare() {
    cd "$pkgname-$pkgver"
    cmake -H. -Bbuild \
        -DCMAKE_C_FLAGS:STRING="${CFLAGS}" \
        -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS}" \
        -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DABSL_RUN_TESTS=ON \
        -DABSL_USE_GOOGLETEST_HEAD=ON
}

build() {
    cd "$pkgname-$pkgver"
    cmake --build build
}

check() {
    cd "$pkgname-$pkgver"
    cmake --build build -- test ARGS="$MAKEFLAGS"
}

package() {
    cd "$pkgname-$pkgver"
    cmake --build build -- DESTDIR="$pkgdir" install
}
