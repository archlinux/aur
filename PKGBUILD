# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=clutter-gst
pkgver=3.0.22
pkgrel=1
pkgdesc="GStreamer bindings for clutter"
arch=(i686 x86_64)
url="https://git.gnome.org/browse/clutter-gst"
license=(LGPL)
depends=(clutter gst-plugins-base-libs libxdamage libgudev)
makedepends=(gobject-introspection gtk-doc git)
_commit=439d3a08de55a49c39066add4f7f32db3164380b  # tags/3.0.22^0
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
