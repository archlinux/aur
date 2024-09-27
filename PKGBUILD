# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gdl
pkgver=3.40.0
pkgrel=1
pkgdesc="GNOME Docking Library"
url="https://gitlab.gnome.org/GNOME/gdl"
arch=(x86_64)
license=(GPL)
depends=(gtk3)
makedepends=(glib2-devel gtk-doc intltool gobject-introspection git)
_commit=bc1f6e9deba012fd81c6c378cd67942a955b0bee  # tags/GDL_3_40_0^0
source=("git+https://gitlab.gnome.org/GNOME/gdl.git#commit=$_commit")
sha256sums=('af014f5d2a4422b740c599bbf0cc0b8d739b18a7519e2b991018bb5f885ffad9')

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
