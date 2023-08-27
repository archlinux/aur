# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=telepathy-farstream
pkgver=0.6.2
pkgrel=7
pkgdesc="Telepathy GLib-based client library that uses Farstream to handle Call channels"
arch=(x86_64)
url="https://telepathy.freedesktop.org/components/telepathy-farstream/"
license=(LGPL2.1)
depends=(telepathy-glib farstream)
makedepends=(dbus-glib gobject-introspection gtk-doc git glib2-docs)
replaces=(telepathy-farsight)
_commit=0b1bba79cfe94e7676fe69e9e0d2e3983a3c14c5  # tags/telepathy-farstream-0.6.2^0
source=("git+https://github.com/TelepathyIM/telepathy-farstream#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^telepathy-farstream-//;s/-/+/g'
}

prepare() {
  cd $pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "$pkgname"
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/telepathy \
    --disable-static --enable-gtk-doc
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
