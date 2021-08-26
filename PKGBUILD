# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gdl
pkgver=3.40.0
pkgrel=1
pkgdesc="GNOME Docking Library"
url="https://gitlab.gnome.org/GNOME/gdl"
arch=(x86_64)
license=(GPL)
depends=(gtk3)
makedepends=(gtk-doc intltool gobject-introspection git)
_commit=bc1f6e9deba012fd81c6c378cd67942a955b0bee  # tags/GDL_3_40_0^0
source=("git+https://gitlab.gnome.org/GNOME/gdl.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^GDL_//;s/_/./g;s/-/+/g'
}

prepare() {
  cd $pkgname
  autoreconf -fvi
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
