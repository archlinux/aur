# Maintainer: Ckat <ckat@teknik.io>

pkgname=dina8-font
pkgver=2.92
pkgrel=10
pkgdesc="A monospace bitmap font, primarily aimed at programmers, only size 8"
arch=('any')
url="https://www.dcmembers.com/jibsen/download/61/"
license=('custom')
makedepends=('xorg-bdftopcf')
conflicts=('dina-font')
source=("dina-$pkgver-new.zip::https://www.dcmembers.com/jibsen/download/61/?wpdmdl=61"
       75-yes-dina.conf)
md5sums=('028424baac750e9fd0f54df03202e5d0'
         'd2ea97a9ee0595cbdb02168bb7a85f12')

_ex_pt() {
    _pt=${1%.bdf}
    _pt=${_pt#*-}
    echo $_pt
}

build() {
    cd "$srcdir/BDF"

    sed -i 's/microsoft-cp1252/ISO8859-1/' *.bdf

    for i in Dina_i400-8.bdf; do
        bdftopcf -t -o DinaItalic$(_ex_pt $i).pcf $i
    done
    for i in Dina_i700-8.bdf; do
        bdftopcf -t -o DinaBoldItalic$(_ex_pt $i).pcf $i
    done
    for i in Dina_r400-8.bdf; do
        bdftopcf -t -o DinaMedium$(_ex_pt $i).pcf $i
    done
    for i in Dina_r700-8.bdf; do
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
