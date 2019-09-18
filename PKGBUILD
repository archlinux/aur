# Maintainer: 
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Timm Preetz <timm@preetz.us>

pkgname=vala0.44
_pkgname=vala
pkgver=0.44.7
pkgrel=3
pkgdesc="Compiler for the GObject type system. Legacy version 0.44"
url="https://wiki.gnome.org/Projects/Vala"
arch=(i686 x86_64)
license=(LGPL)
depends=(glib2 gtk-doc graphviz ttf-font pkg-config gcc)
makedepends=(libxslt vala git help2man autoconf-archive)
checkdepends=(dbus libx11 gobject-introspection)
provides=(valadoc vala-${pkgver%} libvala-${pkgver%.*}.so libvaladoc-${pkgver%.*}.so)
conflicts=(valadoc)
replaces=(valadoc)
source=("git+https://github.com/GNOME/vala.git#tag=$pkgver")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $_pkgname
  ./configure --prefix=/usr
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}
