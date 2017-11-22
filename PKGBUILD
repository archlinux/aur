# Maintainer: Roman Kyrylych <roman@archlinux.org>
# Contributer: Ben <ben@benmazer.net>

pkgname=gtkspell
pkgver=2.0.16
pkgrel=6
url="http://gtkspell.sourceforge.net/"
pkgdesc="Provides word-processor-style highlighting and replacement of misspelled words in a GtkTextView widget"
arch=('x86_64')
license=('GPL')
depends=('gtk2' 'enchant')
makedepends=('intltool' 'gtk-doc')
validpgpkeys=('7C70E4D9927061BD840E82DB6BA6197569B23319') #Daniel Atallah <daniel.atallah@gmail.com>
source=(https://downloads.sourceforge.net/sourceforge/gtkspell/${pkgname}-${pkgver}.tar.gz{,.asc}
        enchant-2.patch)
sha256sums=('8fc7dc560167b2cb7193e76aca625a152dc19b0ebf49816b78539cbb90d80d02'
            'SKIP'
            'edeecf8e1cb9c524fdf800026c2b9c91c60faba637185302167909dd234453e9')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../enchant-2.patch
  gtkdocize
  autoreconf -fi
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --disable-static
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="${pkgdir}" install
}
