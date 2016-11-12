# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=clutter-gst
pkgver=3.0.20+5+ga71607b
pkgrel=1
pkgdesc="GStreamer bindings for clutter"
arch=(i686 x86_64)
url="https://git.gnome.org/browse/clutter-gst"
license=(LGPL)
depends=(clutter gst-plugins-base-libs libxdamage libgudev)
makedepends=(gobject-introspection gtk-doc git)
_commit=a71607b7dc2a0f27d53bf9c5b79d92e08819c6a4  # clutter-gst-3.0
source=("git://git.gnome.org/clutter-gst#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname
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

  # https://bugzilla.gnome.org/show_bug.cgi?id=746883
  rm -rf "${pkgdir}"/usr/lib/gstreamer-1.0
}

# vim:set ts=2 sw=2 et:
