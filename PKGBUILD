# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libgdata
pkgver=0.17.8
pkgrel=1
pkgdesc="GLib-based library for accessing online service APIs using the GData protocol"
url="https://wiki.gnome.org/Projects/libgdata"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libsoup' 'liboauth' 'gcr' 'gnome-online-accounts')
makedepends=('intltool' 'gobject-introspection' 'vala' 'uhttpmock' 'git' 'gtk-doc' 'autoconf-archive')
_commit=19f9f9420146bc51c7dc6dba2102c7d94bae149a  # tags/0.17.8^0
source=("git+https://git.gnome.org/browse/libgdata#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed -e 's/-/+/g'
}

prepare() {
  cd $pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --disable-static --enable-gtk-doc
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd $pkgname
  make check
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
