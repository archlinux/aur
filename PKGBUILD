# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=clutter-gst
pkgver=3.0.27
pkgrel=5
pkgdesc='GStreamer bindings for clutter'
#url=https://blogs.gnome.org/clutter
url=https://gitlab.gnome.org/Archive/clutter-gst
arch=(x86_64)
license=(LGPL-2.1)
depends=(clutter gdk-pixbuf2 gst-plugins-base-libs libgudev libxdamage)
makedepends=(git glib2-devel gobject-introspection gst-plugins-good gtk-doc)
optdepends=('gst-plugins-good: Video camera capture')
_commit=01a461da1bdb3b29edd2d198b877ec0765af1f39 # tags/3.0.27^0
source=(
  "$pkgname-$pkgver::git+$url.git#commit=$_commit"
  0001-video-sink-Remove-RGBx-BGRx-support.patch)
sha256sums=(
  'ad670fdc9a1eb3f10eab5f8c9032a42ae436efde4cc253891dfff303c0a5a556'
  '818d20462b9ac623e036d205dc28c07e17045f913fa652a79f73996310be067a')

pkgver() {
  git -C $pkgname-$pkgver describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $pkgname-$pkgver

  # https://bugs.archlinux.org/task/74222
  git apply -3 ../0001-video-sink-Remove-RGBx-BGRx-support.patch

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr --sysconfdir=/etc --enable-gtk-doc

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

check() {
  make -C $pkgname-$pkgver check
}

package() {
  make -C $pkgname-$pkgver DESTDIR="$pkgdir" install
}

# vim:set sw=2 et:
