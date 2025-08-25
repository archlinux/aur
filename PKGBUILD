# Maintainer: Emma Eilefsen Glenna <emma at eilefsen dot no>

_basename=zix
pkgname=lib32-zix
pkgver=0.6.2
pkgrel=1
pkgdesc="A lightweight C99 portability and data structure library"
arch=(x86_64)
url="https://gitlab.com/drobilla/zix"
license=(custom:ISC)
depends=()
makedepends=(meson)
source=(https://download.drobilla.net/$_basename-$pkgver.tar.xz{,.sig})
sha512sums=('3b072f00481a34e8b900311c2dc77fd73a63a34f69ea953be6b714f5bcbdebcc3cdd81feae73b5ad2bdc09a4bac122e12d9035cfc417ca41dfe5230d1fe13d9c'
            'SKIP')
b2sums=('230d9f6717f10ac6f7608593fa94331a4aebd8c4c1c59f1db5a7d1881d674d687d67c353c3944bf4649ea5cbb49a8c4afe8abc82bad9eaf84bff79777a0a91e1'
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
