# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=cheese
pkgver=3.20.2
pkgrel=1
pkgdesc="Use your webcam to take photos and videos, apply fancy special effects and share the fun with others"
url="https://wiki.gnome.org/Apps/Cheese/"
arch=(i686 x86_64)
license=(GPL)
depends=(gtk3 gstreamer gst-plugins-bad gst-plugins-base gst-plugins-good
         clutter-gst clutter-gtk libcanberra gnome-video-effects librsvg
         gnome-desktop libgudev)
makedepends=(pkgconfig intltool gobject-introspection itstool vala)
optdepends=('frei0r-plugins: More camera effects')
groups=(gnome-extra)
options=(!emptydirs)
source=(https://download.gnome.org/sources/$pkgname/${pkgver:0:4}/$pkgname-$pkgver.tar.xz)
sha256sums=('b7c18719b708e039c063ef09278ee813923556e06af4a7e9598c5d3bdeb83775')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --disable-static --disable-schemas-compile --libexecdir=/usr/lib/cheese

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
