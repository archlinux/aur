# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gdl
pkgver=3.34.0
pkgrel=2
pkgdesc="GNOME Docking Library"
url="https://gitlab.gnome.org/GNOME/gdl"
arch=(x86_64)
license=(GPL)
depends=(gtk3)
makedepends=(gtk-doc intltool gobject-introspection gnome-common git)
_commit=8f8435bac99f3fdfde4e877a70ec98bfe1e83433  # tags/GDL_3_34_0^0
source=("git+https://gitlab.gnome.org/GNOME/gdl.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^GDL_//;s/_/./g;s/-/+/g'
}

prepare() {
  cd $pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "$pkgname"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static --enable-gtk-doc
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
}
