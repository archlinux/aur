# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=clutter-gst
pkgver=3.0.6
pkgrel=4
pkgdesc="GStreamer bindings for clutter"
arch=(i686 x86_64)
url="http://www.clutter-project.org/"
license=(LGPL)
depends=(clutter gst-plugins-base-libs libxdamage libgudev)
makedepends=(gobject-introspection)
source=(http://download.gnome.org/sources/$pkgname/${pkgver:0:3}/$pkgname-$pkgver.tar.xz
        stream-crash.patch)
sha256sums=('d6d5493ae57cc175deee479304569c419d2bb90de3be124e6f3350ae7e73df76'
            '891315e34c1f8dbe7e89d78f59707b567b14953e2e5151ffcbe021ab5a0fe9c2')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../stream-crash.patch
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
