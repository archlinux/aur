# Maintainer: 
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>

pkgbase=gstreamermm
pkgname=(gstreamermm gstreamermm-docs)
pkgver=1.10.0
pkgrel=2
pkgdesc="C++ interface for GStreamer"
arch=('x86_64')
url="https://gstreamer.freedesktop.org/bindings/cplusplus.html"
license=('LGPL')
depends=('glibmm' 'gst-plugins-base')
makedepends=('mm-common' 'glibmm-docs' 'cairomm' 'cairomm-docs' 'pangomm' 'pangomm-docs')
changelog=$pkgname.changelog
source=(https://ftp.gnome.org/pub/GNOME/sources/gstreamermm/1.10/$pkgname-$pkgver.tar.xz)
sha256sums=('be58fe9ef7d7e392568ec85e80a84f4730adbf91fb0355ff7d7c616675ea8d60')

prepare() {
  cd $pkgbase-$pkgver
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgbase-$pkgver
  ./configure --prefix=/usr --enable-maintainer-mode
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package_gstreamermm() {
  cd $pkgbase-$pkgver
  sed -i -e 's/^doc_subdirs/#doc_subdirs/' Makefile
  make DESTDIR="$pkgdir" install
}

package_gstreamermm-docs() {
  pkgdesc+=" (documentation)"
  depends=()

  cd $pkgbase-$pkgver
  make -C docs DESTDIR="$pkgdir" install
}
