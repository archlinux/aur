# Maintainer: aarto <aarto@aur.archlinux.org>

readonly _pkgname=NumKong

pkgname=numkong
pkgver=7.3.0
pkgrel=1
pkgdesc="SIMD kernels for mixed-precision BLAS-like numerics."
arch=('x86_64')
url=https://github.com/ashvardanian/NumKong
license=('Apache-2.0')
depends=(glibc)
makedepends=(cmake openblas)
source=("$pkgname-v$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('612a9c4736348b3730f6d8b34a0e36c82490a0ad9029dce8b205623d3c86b6a0d41e308585ff956e83a5e4631132156225dde8b2fbc1d0c70a29d3fb06067915')

build() {
    local build_tests=OFF
    local compare_blas=OFF06:42:05
    if check_buildenv check y; then
        build_tests=ON
        compare_blas=ON
    fi

    cmake -B "$srcdir/$_pkgname-$pkgver/build/" \
        -D CMAKE_BUILD_TYPE=Release \
        -D CMAKE_INSTALL_PREFIX=/usr \
        -D NK_BUILD_SHARED=ON \
        -D NK_BUILD_TEST=$build_tests \
        -D NK_COMPARE_TO_BLAS=$compare_blas \
        -S "$srcdir/$_pkgname-$pkgver" \
        -Wno-dev
    cmake --build "$srcdir/$_pkgname-$pkgver/build/"
}

check() {
    cd "$srcdir/$_pkgname-$pkgver/build/" || exit 1
    ./nk_test
}

package() {
    DESTDIR="$pkgdir/" cmake --install "$srcdir/$_pkgname-$pkgver/build/"
    install -Dm644 "$srcdir/$_pkgname-$pkgver/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "$srcdir/$_pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
