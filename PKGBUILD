# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gdl
pkgver=3.22.0
pkgrel=1
pkgdesc="GNOME Docking Library"
arch=(i686 x86_64)
license=('GPL')
url="http://www.gnome.org/"
depends=('gtk3')
makedepends=('gtk-doc' 'intltool' 'gobject-introspection' gnome-common git)
_commit=4d878257865371dfbb1662f4d17b12b3ed334cb6  # tags/GDL_3_22_0^0
source=("git://git.gnome.org/gdl#commit=$_commit")
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
