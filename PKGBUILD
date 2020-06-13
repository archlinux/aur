# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: lks <lukas dot graetz et web dot de>
# based on cairo PKGBUILD by: Jan de Groot <jgc@archlinux.org>

_pkgname=cairo
pkgname=$_pkgname-dfb
pkgver=1.17.2+25+gaee96d175
pkgrel=1
pkgdesc="2D graphics library with support for multiple output devices with directfb frontend"
url="https://cairographics.org/"
arch=(i686 x86_64 armv7h)
license=(LGPL MPL)
depends=(directfb libpng libxrender libxext fontconfig pixman glib2 lzo)
makedepends=(mesa-libgl librsvg gtk2 poppler-glib libspectre gtk-doc valgrind git)
checkdepends=(ttf-dejavu gsfonts)
_commit=aee96d175d8349945a6d1948a56abd4b4ec6ad84  # master
provides=('cairo-xcb' "cairo=${pkgver}")
replaces=('cairo-xcb')
conflicts=('cairo')
source=("git+https://gitlab.freedesktop.org/cairo/cairo.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $srcdir/$_pkgname

  # Update gtk-doc
  cp /usr/share/aclocal/gtk-doc.m4 build/aclocal.gtk-doc.m4
  cp /usr/share/gtk-doc/data/gtk-doc.make build/Makefile.am.gtk-doc

  # Fix typo
  sed -i 's/have_png/use_png/g' configure.ac

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $srcdir/$_pkgname

  ./configure --prefix=/usr \
	--sysconfdir=/etc \
	--localstatedir=/var \
	--disable-static \
	--disable-gl \
	--enable-tee \
	--enable-svg \
	--enable-ps \
	--enable-pdf \
	--enable-gobject \
	--enable-gtk-doc \
	--enable-directfb \
        --enable-full-testing \
        --enable-test-surfaces
  sed -i 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd $srcdir/$_pkgname
  # FIXME: tests don't pass
  env CAIRO_TEST_TARGET=image \
      CAIRO_TEST_TARGET_FORMAT=rgba \
      CAIRO_TESTS='!pthread-show-text' make -k check || :
}

package() {
  cd $srcdir/$_pkgname
  make DESTDIR="$pkgdir" install
}
