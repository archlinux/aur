pkgname=libdmapsharing-git
_pkgname=libdmapsharing
pkgver=3.9.7+4+g9ae04e2
pkgrel=1
pkgdesc="A library that implements the DMAP family of protocols"
arch=(x86_64)
url="https://www.flyn.org/projects/libdmapsharing/index.html"
license=(LGPL2.1)
depends=('libsoup' 'avahi' 'gst-plugins-base-libs' 'gdk-pixbuf2')
makedepends=('git' 'gtk-doc' 'gobject-introspection')
provides=('libdmapsharing')
conflicts=('libdmapsharing')
source=("git+https://gitlab.gnome.org/GNOME/libdmapsharing.git")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/^LIBDMAPSHARING_//;s/_/./g;s/-/+/g'
}

prepare() {
  cd $_pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $_pkgname
  ./configure --prefix=/usr --with-mdns=avahi --enable-gtk-doc
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}
