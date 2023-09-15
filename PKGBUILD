# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>

pkgname=librsvg-og
pkgver=2.40.20+23+g0f3eef9e
pkgrel=3
epoch=1
pkgdesc="SVG rendering library old gen"
url="https://github.com/oaken-source/librsvg-og"
arch=(i486 i686 pentium4 x86_64)
license=(LGPL)
depends=(gdk-pixbuf2 pango libcroco)
conflicts_i486=(libsrvg)
makedepends=(gobject-introspection gtk-doc git)
provides_i486=(librsvg=${pkgver} librsvg-${pkgver%%.*}.so)
#source=("https://github.com/oaken-source/librsvg-og/archive/2.40.20.tar.gz")
_commit=0f3eef9e6924130c74d7a7b16aac3e7f5bef9b4c  # branch api2
source=("git+https://github.com/andreasbaumann/librsvg-og.git#commit=$_commit")

#sha256sums=('5bcbd8aa34a81478f990dc62a308ee2a42ff89a4e2bc905c09fd68f525bf5643')
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^orc-//;s/-/+/g'
}

prepare() {
#  cd ${pkgname}-${pkgver}
  cd $pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
#  cd ${pkgname}-${pkgver}
  cd $pkgname
  ./configure --prefix=/usr --disable-static --disable-vala \
    --enable-gtk-doc
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' libtool
  make
}

check() {
#  cd ${pkgname}-${pkgver}
  cd $pkgname
  # Test suite is very dependent on the versions of
  # Cairo, Pango, FreeType and HarfBuzz
  make check || :
}

package() {
#  cd ${pkgname}-${pkgver}
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
