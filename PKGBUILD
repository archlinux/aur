# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

pkgname=hunspell14
pkgver=1.4.2
pkgrel=1
pkgdesc="Spell checker and morphological analyzer library and program (version 1.4)"
arch=('i686' 'x86_64')
url="http://hunspell.github.io/"
license=('GPL' 'LGPL' 'MPL')
depends=('gcc-libs')
source=($pkgname-$pkgver.tar.gz::https://github.com/hunspell/hunspell/archive/v${pkgver}.tar.gz)
sha256sums=('b6a0b23d083e0130f8c561cca8c980814ba65740ccfa52f47159f9141089946d')

prepare() {
    cd hunspell-$pkgver

    autoreconf -vfi
}

build() {
    cd hunspell-$pkgver

    ./configure --prefix=/usr --disable-static \
        --includedir=/usr/include/hunspell1.4 \
        --with-ui --with-readline # --with-experimental breaks build in this release

    make
}

check() {
    cd hunspell-$pkgver

    make check
}

package() {
    cd hunspell-$pkgver

    make DESTDIR="$pkgdir" install

    rm -rf "${pkgdir}"/usr/{bin,share}

    mv "${pkgdir}"/usr/lib/pkgconfig/hunspell.pc "${pkgdir}"/usr/lib/pkgconfig/hunspell-1.4.pc

    sed -i 's|}/hunspell|}|g' \
        "${pkgdir}"/usr/lib/pkgconfig/hunspell-1.4.pc
}
