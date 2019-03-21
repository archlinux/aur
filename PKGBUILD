# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>

pkgname=abseil-cpp
pkgver=20181200
pkgrel=1
pkgdesc="Abseil Common Libraries (C++)"
arch=('any')
url="https://github.com/abseil/abseil-cpp"
license=('Apache')
makedepends=('cmake' 'git')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('e2b53bfb685f5d4130b84c4f3050c81bf48c497614dc85d91dbd3ed9129bce6d')

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

    mkdir -p "$pkgdir/usr/include"
    cp -a absl "$pkgdir/usr/include/absl"
    mkdir "${pkgdir}/usr/lib/"
    find build/absl -name "*.a" -exec cp {} "${pkgdir}/usr/lib" \;

    # cmake --build build -- DESTDIR="$pkgdir" install
}
