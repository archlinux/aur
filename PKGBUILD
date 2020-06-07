#Maintainer: Jan De Groot <jgc@archlinux.org>

pkgname=libgnome-keyring
pkgver=3.12.0+13+g4f8ab73
pkgrel=3
pkgdesc="GNOME keyring client library (deprecated)"
url="https://gitlab.gnome.org/GNOME/libgnome-keyring"
arch=(x86_64)
license=(GPL LGPL)
depends=(dbus glib2 libgcrypt)
makedepends=(intltool gobject-introspection vala git gnome-common)
optdepends=('org.freedesktop.secrets: secret storage backend')
_commit=4f8ab73d19e5621b06102dc29ad880e74aeec573  # master
source=("git+https://gitlab.gnome.org/GNOME/libgnome-keyring.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "$pkgname"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --libexecdir=/usr/lib --enable-gtk-doc
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
}
