# Maintainer: aarto <aarto@aur.archlinux.org>
# Contributor: Matheus <matheusgwdl@protonmail.com>

readonly _pkgname=SimSIMD

pkgname=simsimd
pkgver=6.5.4
pkgrel=1
pkgdesc="Up to 200x faster dot products and similarity metrics."
arch=('x86_64')
url=https://github.com/ashvardanian/simsimd
license=('Apache-2.0')
makedepends=(cmake)
source=("$pkgname-v$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('7c121375dbc0b2c9f70887d9e0cee19959df6df74145aa87a3b8f4fbc642fab221a5bfc5f9d4b7f48f84569cf84232463db76b58bc067029fb6ac786db209db4')

build() {
    local build_tests=ON
    check_option check y || build_tests=OFF

    cmake -B "$srcdir/$_pkgname-$pkgver/build/" \
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
