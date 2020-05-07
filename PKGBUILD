# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=rest
pkgver=0.8.1
pkgrel=3
pkgdesc="Helper library for RESTful services"
url="https://wiki.gnome.org/Projects/Librest"
arch=(x86_64)
license=(LGPL2.1)
depends=(glib2 libxml2 libsoup)
makedepends=(gobject-introspection gtk-doc git)
provides=(librest{,-extras}-0.7.so)
_commit=2971b3b92701f70fc368ad64bd25cefaea043f87  # tags/0.8.1^0
source=("git+https://gitlab.gnome.org/GNOME/librest.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd librest
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd librest
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd librest
  ./configure --prefix=/usr --sysconfdir=/etc --enable-gtk-doc
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd librest
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
