# Maintainer: sfslinux <sfslinux@gmail.com>

pkgname=termmark
pkgver=1.0.0
pkgrel=20
pkgdesc="Minimal C++ Markdown viewer for the terminal (with leaf-style table rendering)"
arch=('x86_64' 'aarch64')
url="https://github.com/ishanawal/TermMark"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'termmark-tables.patch')
sha256sums=('525193e4dce145df0ac638500883ccc6d272651b5cac2d321ef9da778cbf82f3'
            '8fb00c86974416b44be5786131700a7297eb1d25c330a2c4d4b98fe0bea372cb')

prepare() {
    cd "TermMark-$pkgver"
    patch -Np1 -i ../termmark-tables.patch
}

build() {
    cmake -B build -S "TermMark-$pkgver" \
        -DCMAKE_BUILD_TYPE=None \
        -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    install -Dm755 build/termmark "$pkgdir/usr/bin/termmark"
    install -Dm644 "TermMark-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    for doc in README.md README.ru.md CHANGELOG.md CHANGELOG.ru.md; do
        install -Dm644 "TermMark-$pkgver/$doc" "$pkgdir/usr/share/doc/$pkgname/$doc"
    done
    install -Dm644 "TermMark-$pkgver/examples/highlighting.md" "$pkgdir/usr/share/doc/$pkgname/examples/highlighting.md"
}
