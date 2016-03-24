# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=clutter-gst
pkgver=3.0.18
pkgrel=1
pkgdesc="GStreamer bindings for clutter"
arch=(i686 x86_64)
url="http://www.clutter-project.org/"
license=(LGPL)
depends=(clutter gst-plugins-base-libs libxdamage libgudev)
makedepends=(gobject-introspection)
source=(http://download.gnome.org/sources/$pkgname/${pkgver:0:3}/$pkgname-$pkgver.tar.xz)
sha256sums=('0aec0d0c6020cd19a5bb0dab1165a92748f81a9a3acdfabb0f966d5f53bc8093')

prepare() {
  cd $pkgname-$pkgver
}

build() {
  cd $pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

check() {
  cd $pkgname-$pkgver
  make check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  # https://bugzilla.gnome.org/show_bug.cgi?id=746883
  rm -rf "${pkgdir}"/usr/lib/gstreamer-1.0
}

# vim:set ts=2 sw=2 et:
