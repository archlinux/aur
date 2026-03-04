# Maintainer: aarto <aarto@aur.archlinux.org>
# Contributor: Matheus <matheusgwdl@protonmail.com>

readonly _pkgname=SimSIMD

pkgname=simsimd
pkgver=6.5.15
pkgrel=3
pkgdesc="Up to 200x faster dot products and similarity metrics."
arch=('x86_64')
url=https://github.com/ashvardanian/simsimd
license=('Apache-2.0')
makedepends=(cmake)
source=("$pkgname-v$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('afd9e2d85048c0039fc6cede5dee98a813d57aa514d3bb804a00c7b767f79c58c6398ed259036b5c3ec7ba69f1255e76fd062835704e72cb37a09be748cf61ba')

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
