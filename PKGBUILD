# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Michael Kanis <mkanis@gmx.de>

pkgname=libchamplain
pkgver=0.12.15
pkgrel=1
pkgdesc="A map widget"
url="https://wiki.gnome.org/Projects/libchamplain"
license=(LGPL)
arch=(i686 x86_64)
depends=(clutter-gtk libsoup cairo sqlite)
makedepends=(gobject-introspection gtk-doc vala gnome-common git)
_commit=d5f50d3932e2fabae8f3f10df522d7716e5bed7b  # tags/LIBCHAMPLAIN_0_12_15^0
source=("git+https://git.gnome.org/browse/libchamplain#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^LIBCHAMPLAIN_//;s/_/./g;s/-/+/g'
}

prepare() {
  cd $pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --disable-static --disable-debug \
    --enable-vala --enable-gtk-doc

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
