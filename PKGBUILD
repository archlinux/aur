# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=clutter-gtk
pkgver=1.8.2
pkgrel=1
pkgdesc="Clutter integration with GTK+"
arch=('i686' 'x86_64')
url="https://git.gnome.org/browse/clutter-gtk"
license=(LGPL)
depends=(clutter)
makedepends=(gobject-introspection gtk-doc git)
_commit=d48408a24672fa553034a0b3749bee930ad7c49d
source=("git://git.gnome.org/clutter-gtk#commit=$_commit")
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
  cd $pkgname
  ./configure --prefix=/usr --enable-gtk-doc

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
