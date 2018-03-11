# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=clutter-gst
pkgver=3.0.26
pkgrel=1
pkgdesc="GStreamer bindings for clutter"
url="https://git.gnome.org/browse/clutter-gst"
arch=(x86_64)
license=(LGPL)
depends=(clutter gst-plugins-base-libs libxdamage libgudev)
makedepends=(gobject-introspection gtk-doc git)
_commit=7e191b675decc87bca263f08c1b01a694c74d44a  # clutter-gst-3.0~1
source=("git+https://git.gnome.org/browse/clutter-gst#commit=$_commit")
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
