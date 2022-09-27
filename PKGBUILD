# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_basename=sratom
pkgname=lib32-sratom
pkgver=0.6.14
pkgrel=1
pkgdesc="An LV2 Atom RDF serialisation library (32-bit)"
arch=(x86_64)
url="https://drobilla.net/software/sratom.html"
license=(custom:ISC)
depends=(lib32-sord lib32-lv2 sratom)
makedepends=(meson)
source=("https://download.drobilla.net/$_basename-$pkgver.tar.xz"{,.sig})
sha512sums=('3647ccca3ac98299a0bcc30d540788c627445c9a55f0b68a53e08ee45b15138c7a5466c92d1c10eac614325718d4f59eff6f0664f99891e8349e613be675c87d'
            'SKIP')
b2sums=('6f468e9a0de97cf83a4f3faeb8ceff8a5502da7f0dff6b5721ef985df352057cda0dbbf13656471ef7f3103a891570e3462ed6bf4517dbc546d9f83115db433b'
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
