# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_basename=sratom
pkgname=lib32-sratom
pkgver=0.6.12
pkgrel=1
pkgdesc="An LV2 Atom RDF serialisation library (32-bit)"
arch=(x86_64)
url="https://drobilla.net/software/sratom.html"
license=(custom:ISC)
depends=(lib32-sord lib32-lv2 sratom)
makedepends=(meson)
source=("https://download.drobilla.net/$_basename-$pkgver.tar.xz"{,.sig})
sha512sums=('e677945f59494970c8c723319216cf6543ed38c590b6db94e5e928e830004e96dc957a2cf2fb0b76278cf55f0d62ea03ba705fbc449424c467e29593eaa948dc'
            'SKIP')
b2sums=('76a01c84e418ee3ffeb1e0e44214e9b02ab58b9b572372ee43309650a7a674a55e49384e8b62657af30933b7bdb02faf38ff100030e2ec86947972cacf32db69'
        'SKIP')
validpgpkeys=('907D226E7E13FA337F014A083672782A9BF368F3') # David Robillard <d@drobilla.net>

build() {
    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG='/usr/bin/i686-pc-linux-gnu-pkg-config'

    arch-meson $_basename-$pkgver build \
        --libdir='/usr/lib32' \
        -Ddocs=disabled

    meson compile -C build
}

check() {
    meson test -C build
}

package() {
    meson install -C build --destdir "$pkgdir"

    install -vDm 644 $_basename-$pkgver/COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -vDm 644 $_basename-$pkgver/{NEWS,README.md} -t "$pkgdir/usr/share/doc/$pkgname/"

    cd "$pkgdir/usr"

    rm -r include
}
