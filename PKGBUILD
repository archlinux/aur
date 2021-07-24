#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>

pkgname=megahit
pkgver=1.2.9
pkgrel=1
pkgdesc='Ultra-fast and memory-efficient (meta-)genome assembler'
url='https://github.com/voutcn/megahit'
arch=('any')
license=('GPL3')
depends=(
    'gzip'
    'bzip2'
)
makedepends=(
    'zlib'
    'cmake'
    'gcc'
)
provides=("megahit")
conflicts=("megahit-bin" "megahit-git")
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('5c6fb5a8104516beb6e43fd58e7438ac746cd0314180cc0d085ac303de5b2fbd9d63e00263f9fc86b994dff798964e0f8aa0891857b1a18940a17e9269eb100d')

build() {
    cd "$pkgname-$pkgver" || exit

    cmake -B build -S . \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev

    make -C build
}

check() {
    cd "$pkgname-$pkgver" || exit

    make -C build simple_test
}

package() {
    cd "$pkgname-$pkgver" || exit

    make -C build DESTDIR="$pkgdir" install

    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
