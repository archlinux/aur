# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Xilon <xilonmu@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=dina-font
pkgver=2.92
pkgrel=10
pkgdesc="A monospace bitmap font, primarily aimed at programmers"
arch=('any')
url="https://www.dcmembers.com/jibsen/download/61/"
license=('custom')
makedepends=('xorg-bdftopcf')
source=("dina-$pkgver-new.zip::https://www.dcmembers.com/jibsen/download/61/?wpdmdl=61"
       75-yes-dina.conf)
sha256sums=('1f51bba53f75a64d2d8bd037e8e0f84b6f8064e50a72ee954033bede173508cf'
            '2596b25f3e20936dbe189f8574a55950b5ee2605bfdeaaac1ec47d0ff14855b6')

_ex_pt() {
    _pt=${1%.bdf}
    _pt=${_pt#*-}
    echo $_pt
}

build() {
    cd "$srcdir/BDF"

    sed -i 's/microsoft-cp1252/ISO8859-1/' *.bdf

    for i in Dina_i400-*.bdf; do
        bdftopcf -t -o DinaItalic$(_ex_pt $i).pcf $i
    done
    for i in Dina_i700-*.bdf; do
        bdftopcf -t -o DinaBoldItalic$(_ex_pt $i).pcf $i
    done
    for i in Dina_r400-*.bdf; do
        bdftopcf -t -o DinaMedium$(_ex_pt $i).pcf $i
    done
    for i in Dina_r700-*.bdf; do
        bdftopcf -t -o DinaBold$(_ex_pt $i).pcf $i
    done
    gzip -n *.pcf
}

package() {
    cd "$srcdir/BDF"
    for i in *.gz; do
        install -Dm 644 $i "$pkgdir/usr/share/fonts/misc/$i"
    done
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/75-yes-dina.conf" "$pkgdir/usr/share/fontconfig/conf.avail/75-yes-dina.conf"
    install -d "$pkgdir/usr/share/fontconfig/conf.default"
    ln -s ../conf.avail/75-yes-dina.conf "$pkgdir/usr/share/fontconfig/conf.default/75-yes-dina.conf"
}
