# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gdl
pkgver=3.40.0
pkgrel=2
pkgdesc="GNOME Docking Library"
url="https://gitlab.gnome.org/Archive/gdl"
arch=(x86_64)
license=(LGPL-2.0-or-later)
depends=(
  cairo
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  libxml2
)
makedepends=(
  git
  glib2-devel
  gobject-introspection
  gtk-doc
  intltool
)
source=("git+$url.git#tag=GDL_${pkgver//./_}")
b2sums=('714e94bbda6144621d5146d4c99d38c267188bb6ffa8afc99cc95b82b0d039c3584acb54edd5377d16b20546a183cf9acf39bf1968aeaeca3b95affac1cf63ef')

prepare() {
  cd $pkgname

  # Fix build with libxml2 2.12
  git cherry-pick -n 414f83eb4ad9e5576ee3d089594bf1301ff24091

  autoreconf -fvi
}

build() {
  cd "$pkgname"
  CFLAGS+=" -Wno-error=incompatible-pointer-types"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static --enable-gtk-doc
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
}
