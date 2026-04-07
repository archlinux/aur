# Maintainer: aarto <aarto@aur.archlinux.org>
# Contributor: Matheus <matheusgwdl@protonmail.com>

readonly _pkgname=NumKong

pkgname=simsimd
pkgver=6.5.16
pkgrel=1
pkgdesc="Up to 200x faster dot products and similarity metrics."
arch=('x86_64')
url=https://github.com/ashvardanian/NumKong
license=('Apache-2.0')
makedepends=(cmake)
source=("$pkgname-v$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('87378d3cb3b04a0044a8cf6b3fc86d177c3dbf8f9533dfa9a835bff38b600147ce3ce36cde21a42850b994cc8b2369cd59ab8f682f3bede40b7b14968b3d1ad9')

build() {
    local build_tests=OFF
    check_option check y || build_tests=ON

    cmake -B "$srcdir/$_pkgname-$pkgver/build/" \
        -D CMAKE_INSTALL_PREFIX=/usr \
        -D SIMSIMD_BUILD_SHARED=ON \
        -D SIMSIMD_BUILD_TESTS=$build_tests \
        -S "$srcdir/$_pkgname-$pkgver" \
        -Wno-dev
    cmake --build "$srcdir/$_pkgname-$pkgver/build/"
}

check() {
    # ctest --output-on-failure --test-dir "$srcdir/$_pkgname-$pkgver/build/"
    cd "$srcdir/$_pkgname-$pkgver/build/" || exit 1
    ./simsimd_test_compile_time
    ./simsimd_test_run_time
}

package() {
    DESTDIR="$pkgdir/" cmake --install "$srcdir/$_pkgname-$pkgver/build/"
    install -Dm644 "$srcdir/$_pkgname-$pkgver/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "$srcdir/$_pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
