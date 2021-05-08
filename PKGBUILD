# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>

pkgname=librsvg-og
pkgver=2.40.20
pkgrel=1
epoch=1
pkgdesc="SVG rendering library old gen"
url="https://github.com/oaken-source/librsvg-og"
arch=(i486 i686 pentium4)
license=(LGPL)
depends=(gdk-pixbuf2 pango)
conflicts_i486=(libsrvg)
makedepends=(gobject-introspection gtk-doc git)
provides_i486=(librsvg=${pkgver} librsvg-${pkgver%%.*}.so)
source=("https://github.com/oaken-source/librsvg-og/archive/2.40.20.tar.gz")
sha256sums=('5bcbd8aa34a81478f990dc62a308ee2a42ff89a4e2bc905c09fd68f525bf5643')

prepare() {
  cd ${pkgname}-${pkgver}
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --disable-static --disable-vala \
    --enable-gtk-doc
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' libtool
  make
}

check() {
  cd ${pkgname}-${pkgver}
  # Test suite is very dependent on the versions of
  # Cairo, Pango, FreeType and HarfBuzz
  make check || :
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
}
