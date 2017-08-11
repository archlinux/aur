# $Id$
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=gdk-pixbuf2-xlib
_pkgname=gdk-pixbuf2
pkgver=2.36.8
pkgrel=1
pkgdesc="An image loading library"
arch=(i686 x86_64)
url="https://wiki.gnome.org/Projects/GdkPixbuf"
license=(LGPL2.1)
depends=(glib2 libpng libtiff libjpeg libx11 jasper shared-mime-info)
makedepends=(gtk-doc gobject-introspection git docbook-utils)
provides=($_pkgname=$pkgver)
conflicts=($_pkgname)
install=gdk-pixbuf2.install
_commit=31c0a1f43aaeddef706057065e38bbfc205dbbe0  # tags/2.36.8^0
source=("git+https://git.gnome.org/browse/gdk-pixbuf#commit=$_commit"
        gdk-pixbuf-query-loaders.hook)
sha256sums=('SKIP'
            '963afcfacde9fd36031d93c8aa4c94a669ab1dbe9ba0d2cf17599b7d358e54c2')

pkgver() {
  cd gdk-pixbuf
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd gdk-pixbuf

  # Jasper somtimes runs into this limit
  sed -i 's/ifdef HAVE_SETRLIMIT/if 0/' tests/pixbuf-randomly-modified.c

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd gdk-pixbuf
  ./configure --prefix=/usr \
    --with-x11 \
    --with-libjasper \
    --with-included-loaders=png \
    --enable-gtk-doc \
    --enable-man
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd gdk-pixbuf
  make DESTDIR="$pkgdir" install
  install -Dm644 ../gdk-pixbuf-query-loaders.hook \
    "$pkgdir/usr/share/libalpm/hooks/gdk-pixbuf-query-loaders.hook"
}

# vim:set et sw=2:
