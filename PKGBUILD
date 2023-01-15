# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=clutter-gst
pkgver=3.0.27
pkgrel=4
pkgdesc="GStreamer bindings for clutter"
url="https://gitlab.gnome.org/GNOME/clutter-gst"
arch=(x86_64)
license=(LGPL)
depends=(clutter gst-plugins-base-libs libxdamage libgudev gdk-pixbuf2)
makedepends=(gobject-introspection gtk-doc git gst-plugins-good)
optdepends=("gst-plugins-good: Video camera capture")
_commit=01a461da1bdb3b29edd2d198b877ec0765af1f39  # tags/3.0.27^0
source=("git+https://gitlab.gnome.org/GNOME/clutter-gst.git#commit=$_commit"
        0001-video-sink-Remove-RGBx-BGRx-support.patch)
sha256sums=('SKIP'
            '818d20462b9ac623e036d205dc28c07e17045f913fa652a79f73996310be067a')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $pkgname

  # https://bugs.archlinux.org/task/74222
  git apply -3 ../0001-video-sink-Remove-RGBx-BGRx-support.patch

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --sysconfdir=/etc --enable-gtk-doc

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

# vim:set sw=2 et:
