# Maintainer: Roman Kyrylych <roman@archlinux.org>
# Contributer: Ben <ben@benmazer.net>

pkgname=gtkspell
pkgver=2.0.16
pkgrel=7
url="http://gtkspell.sourceforge.net/"
pkgdesc="Provides word-processor-style highlighting and replacement of misspelled words in a GtkTextView widget"
arch=('x86_64')
license=('GPL')
depends=('gtk2' 'enchant')
makedepends=('intltool' 'gtk-doc')
validpgpkeys=('7C70E4D9927061BD840E82DB6BA6197569B23319') #Daniel Atallah <daniel.atallah@gmail.com>
source=(https://downloads.sourceforge.net/sourceforge/gtkspell/${pkgname}-${pkgver}.tar.gz{,.asc}
        enchant-2.diff)
sha256sums=('8fc7dc560167b2cb7193e76aca625a152dc19b0ebf49816b78539cbb90d80d02'
            'SKIP'
            '52e693590161bc285ec46a2beece802f47c7ede65ec0b72ffa224ab0db176bad')

prepare() {
  cd $pkgname-$pkgver

  # enchant 2.2
  patch -Np1 -i ../enchant-2.diff

  gtkdocize
  autoreconf -fvi
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
