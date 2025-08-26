# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_basename=serd
pkgname=lib32-serd
pkgver=0.32.4
pkgrel=1
pkgdesc="Lightweight C library for RDF syntax supporting reading/ writing Turtle and NTriples (32-bit)"
arch=(x86_64)
url="https://drobilla.net/software/serd.html"
license=(
  '0BSD OR ISC'
  BSD-3-Clause
  ISC
)
depends=(
    lib32-gcc-libs
    serd
)
makedepends=(meson)
source=(https://download.drobilla.net/$_basename-$pkgver.tar.xz{,.sig})
sha512sums=('5dd0c2547929d3a52e8d8cc6fb1546c3c82f9f023e93d761569bafcabeee4c0660368b3e03774e5a8625ad29b561b75931944119ed907571de012cbcb9d82159'
            'SKIP')
b2sums=('62b8f9f066f7193eec95474d3b8ffcdba5c639d0090e33ab3bc977856b00410fb1f47e5213bde5c980e22f9f7660b223eb79c8a0489cf2f8b912ddf9ee9ed7a5'
        'SKIP')
validpgpkeys=('907D226E7E13FA337F014A083672782A9BF368F3') # David Robillard <d@drobilla.net>

build() {
    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG='/usr/bin/i686-pc-linux-gnu-pkg-config'

    arch-meson $_basename-$pkgver build \
        --libdir='/usr/lib32' \
        -Ddocs=disabled \
        -Dtools=disabled

    meson compile -C build
}

check() {
    meson test -C build
}

package() {
    meson install -C build --destdir "$pkgdir"

    install -vDm 644 $_basename-$pkgver/LICENSES/* -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -vDm 644 $_basename-$pkgver/COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -vDm 644 $_basename-$pkgver/{AUTHORS,NEWS,README.md} -t "$pkgdir/usr/share/doc/$pkgname/"

    cd "$pkgdir/usr"

    rm -r include
}
