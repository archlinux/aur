# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Maintainer: Zen Wen <zen.8841@gmail.com>

pkgbase=gstreamermm
pkgname=(gstreamermm gstreamermm-docs)
pkgver=1.10.0
pkgrel=3
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
  cd "${srcdir}"/$pkgbase-$pkgver
  # Fix the formatting error in configure.ac
  sed -i '/enable_unittests=\$have_gtest)/ { s/enable_unittests=\$have_gtest)/enable_unittests=\$have_gtest])/; n; s/^\s*])$/)/; }' configure.ac
  # Fix gstreamer/gstreamermm/register.h
  # Due to changes in glib's atomic API and how it interacts with C++ compilers
  # especially since recent versions of glib (and gcc or clang) are stricter
  # about the use of volatile types with atomic functions.
  sed -i 's/static volatile gsize/static gsize/' gstreamer/gstreamermm/register.h
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "${srcdir}"/$pkgbase-$pkgver
  ./configure --prefix=/usr --enable-maintainer-mode
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package_gstreamermm() {
  cd "${srcdir}"/$pkgbase-$pkgver
  # Fix the formatting error in configure.ac
  sed -i -e 's/^doc_subdirs/#doc_subdirs/' Makefile
  make DESTDIR="${pkgdir}" install
}

package_gstreamermm-docs() {
  cd $pkgbase-$pkgver
  pkgdesc+=" (documentation)"
  depends=()

  make -C docs DESTDIR="${pkgdir}" install
}
