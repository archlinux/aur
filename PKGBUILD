# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: TingPing <tingping@tingping.se>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

pkgname=glade-git
pkgver=3.22.0.r115.gdb79d55c
pkgrel=1
pkgdesc="User interface builder for GTK+ and GNOME."
provides=(glade)
conflicts=(glade)
arch=(i686 x86_64)
license=(GPL LGPL)
depends=(gtk3 libxml2)
makedepends=(intltool gtk-doc gobject-introspection python-gobject itstool docbook-xsl git
             gnome-common webkit2gtk)
optdepends=('devhelp: development help')
url="https://glade.gnome.org/"
source=("git+https://gitlab.gnome.org/GNOME/glade.git")
sha256sums=(SKIP)

pkgver() {
  cd glade
  git describe --long --tags | sed 's/^GLADE_//;s/_/./g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd glade
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd glade
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --disable-static --enable-gtk-doc
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd glade
  make DESTDIR="$pkgdir" install
}
