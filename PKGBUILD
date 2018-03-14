# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gdl
pkgver=3.28.0
pkgrel=1
pkgdesc="GNOME Docking Library"
arch=(x86_64)
license=('GPL')
url="https://www.gnome.org/"
depends=('gtk3')
makedepends=('gtk-doc' 'intltool' 'gobject-introspection' gnome-common git)
_commit=c2b2abc622e9aa535c07f76ec15292f4da55d694  # tags/GDL_3_28_0^0
source=("git+https://git.gnome.org/browse/gdl#commit=$_commit")
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
