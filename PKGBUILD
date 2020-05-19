# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=clutter-gst
pkgver=3.0.27
pkgrel=3
pkgdesc="GStreamer bindings for clutter"
url="https://gitlab.gnome.org/GNOME/clutter-gst"
arch=(x86_64)
license=(LGPL)
depends=(clutter gst-plugins-base-libs libxdamage libgudev gdk-pixbuf2)
makedepends=(gobject-introspection gtk-doc git gst-plugins-good)
optdepends=("gst-plugins-good: Video camera capture")
_commit=01a461da1bdb3b29edd2d198b877ec0765af1f39  # tags/3.0.27^0
source=("git+https://gitlab.gnome.org/GNOME/clutter-gst.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname
  git tag -f 3.0.26 7e191b675decc87bca263f08c1b01a694c74d44a  # Fixup missing tag
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --sysconfdir=/etc \
    --enable-gtk-doc

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

check() {
  cd $pkgname
  make check
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
