# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_basename=lilv
pkgname=lib32-lilv
pkgver=0.24.20
pkgrel=1
pkgdesc="A C library interface to the LV2 plug-in standard (32-bit)"
arch=(x86_64)
url="https://drobilla.net/software/lilv.html"
license=(ISC)
depends=(lib32-glibc lib32-lv2 lib32-serd lib32-sord lib32-sratom lilv)
makedepends=(lib32-libsndfile meson)
source=(https://download.drobilla.net/${_basename}-${pkgver}.tar.xz{,.sig})
sha512sums=('68963b66fd6e577280867fcd5a601fd2cf539a10fcf0b667c22165cc7e42206fd6a20d56dbe97b587fb68f798d4db3b2351b87b1243c665c3a2b1bb82cbbf9a3'
            'SKIP')
b2sums=('50b2044a7fb62cfcbea6dc68cd0d26503780f30a5a04e2ceafca9e02b2369965d7d27b8d08bbfa136930a3b18a3e0eb6cf4c326d3c2d46218badb4a8ec6e1e01'
        'SKIP')
validpgpkeys=('907D226E7E13FA337F014A083672782A9BF368F3') # David Robillard <d@drobilla.net>

build() {
    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG='/usr/bin/i686-pc-linux-gnu-pkg-config'

    arch-meson $_basename-$pkgver build \
        --libdir='/usr/lib32' \
        -Dbindings_py=disabled \
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
    install -vDm 644 $_basename-$pkgver/{NEWS,README.md} -t "$pkgdir/usr/share/doc/$pkgname/"

    cd "$pkgdir"

    rm -r etc usr/bin usr/include usr/share/man
}
