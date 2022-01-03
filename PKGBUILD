# Maintainer: Adrià Arrufat <adria.arrufat+AUR@protonmail.ch>
# Original Maintainer: Ionut Biru <ibiru@archlinux.org>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: Timm Preetz <timm@preetz.us>

pkgname=vala-git
pkgver=0.54.1+r150+gc46078fa4
pkgrel=1
pkgdesc="Compiler for the GObject type system"
url="https://wiki.gnome.org/Projects/Vala"
arch=(i686 x86_64)
license=(LGPL)
depends=(glib2 gtk-doc graphviz ttf-font pkg-config gcc)
provides=(vala valadoc)
conflicts=(vala valadoc)
makedepends=(libxslt vala git help2man autoconf-archive)
checkdepends=(dbus libx11 gobject-introspection)
source=("git+https://gitlab.gnome.org/GNOME/vala.git/")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname/-git}
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd ${pkgname/-git}
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd ${pkgname/-git}
  ./configure --prefix=/usr
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd ${pkgname/-git}
  make check
}

package() {
  cd ${pkgname/-git}
  make DESTDIR="$pkgdir" install
}
