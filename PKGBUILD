# Maintainer: Patrick Oppenlander <patrick.oppenlander@gmail.com>

pkgname=cairo-minimal
pkgver=1.17.4
pkgrel=1
pkgdesc="A vector graphics library - build with minimal dependencies"
url="https://cairographics.org/"
arch=(x86_64)
license=(LGPL MPL)
depends=(libpng fontconfig pixman glib2 lzo)
makedepends=(gtk-doc)
provides=(cairo)
replaces=(cairo)
_commit=156cd3eaaebfd8635517c2baf61fcf3627ff7ec2
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
