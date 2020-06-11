# Maintainer: Patrick Oppenlander <patrick.oppenlander@gmail.com>

pkgname=cairo-minimal
pkgver=1.17.2+25+gaee96d175
pkgrel=1
pkgdesc="A vector graphics library - build with minimal dependencies"
url="https://cairographics.org/"
arch=(x86_64)
license=(LGPL MPL)
depends=(libpng fontconfig pixman glib2 lzo)
provides=(cairo)
replaces=(cairo)
_commit=aee96d175d8349945a6d1948a56abd4b4ec6ad84
source=("git+https://gitlab.freedesktop.org/cairo/cairo.git#commit=$_commit")
sha1sums=('SKIP')

pkgver() {
  cd cairo
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd cairo

  # Fix typo
  sed -i 's/have_png/use_png/g' configure.ac

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd cairo

  ./configure --prefix=/usr \
	--sysconfdir=/etc \
	--localstatedir=/var \
	--disable-static \
	--disable-gl \
	--enable-tee \
	--enable-svg \
	--enable-ps \
	--enable-pdf \
	--enable-gobject
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd cairo
  make DESTDIR="$pkgdir" install
}
