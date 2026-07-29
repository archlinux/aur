# Maintainer: aarto <aarto@aur.archlinux.org>

readonly _pkgname=NumKong

pkgname=numkong
pkgver=7.7.1
pkgrel=1
pkgdesc="SIMD kernels for mixed-precision BLAS-like numerics."
arch=('x86_64')
url=https://github.com/ashvardanian/NumKong
license=('Apache-2.0')
depends=(glibc)
makedepends=(cmake openblas)
source=("$pkgname-v$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('11dd2b46c377450f5253a4fd63a14d7c68cc56fbafa8e25dc629c0432886c34f59ae11831eef84ecafee12db99e18a67ee52ea626c4d6ca728b3b57129f21ddc')

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
