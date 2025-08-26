# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_basename=sord
pkgname=lib32-sord
pkgver=0.16.18
pkgrel=1
pkgdesc="A lightweight C library for storing RDF data in memory (32-bit)"
arch=(x86_64)
url="https://drobilla.net/software/sord.html"
license=(ISC)
depends=(
    lib32-glibc
    lib32-pcre2
    lib32-serd
    lib32-zix
    sord)
makedepends=(meson)
source=(https://download.drobilla.net/$_basename-$pkgver.tar.xz{,.sig})
sha512sums=('e271d97c77187d7ed0a9c8fe0a65fcf50e269ba79dba4e8d55781ffe3715888c5388d90812d76a48e89ecc9c5e047e0d53ff40333fde7dbbf12dffc496d05e31'
            'SKIP')
b2sums=('8dfffa4632ddf3efe0c4a421d43001d1186f6336004847eaf12f91ca408486eca222ab1b68e9dc31d2e41f0e65fe1cd167a4b5cc5fabd516f032416b4c0dbae3'
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

    install -vDm 644 $_basename-$pkgver/COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -vDm 644 $_basename-$pkgver/{AUTHORS,NEWS,README.md} -t "$pkgdir/usr/share/doc/$pkgname/"

    cd "$pkgdir/usr"

    rm -r include
}
