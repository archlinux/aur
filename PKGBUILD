# Maintainer: envolution
# Contributor: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Peter Mattern <pmattern at arcor dot de>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=(wxwidgets-gtk3-noegl)
pkgver=3.2.6
pkgrel=1
pkgdesc="GTK+3 implementation of wxWidgets API for GUI"
arch=(x86_64)
url='https://www.wxwidgets.org'
license=('custom: wxWindows Library Licence')
makedepends=(cmake
  git
  glu
  gst-plugins-base
  nanosvg
  qt5-base
  webkit2gtk-4.1)
pkgdesc='GTK+3 implementation of wxWidgets API for GUI without GLCANVAS_EGL support'
depends=(bash
  cairo
  fontconfig
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gst-plugins-bad-libs
  gstreamer
  gtk3
  libglvnd
  libjpeg-turbo
  libnotify
  libmspack
  libpng
  libsm # cmake target
  libtiff
  libx11
  libxkbcommon
  libxtst
  pango
  sdl2
  wayland
  wxwidgets-common)
optdepends=('webkit2gtk-4.1: for webview support')
conflicts=(wxgtk3)
provides=(wxgtk3
  wxwidgets-gtk3
  wxwidgets)
source=(git+https://github.com/wxWidgets/wxWidgets#tag=v$pkgver)
sha256sums=('b4f2e8ebac43c0fc351a3c94b6fad6862d8cc9cdb55f7a224747d1066a2e09f5')

build() {
  cmake -B build-gtk3 -S wxWidgets \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DwxBUILD_TOOLKIT=gtk3 \
    -DwxUSE_OPENGL=ON \
    -DwxUSE_REGEX=sys -DwxUSE_ZLIB=sys \
    -DwxUSE_EXPAT=sys \
    -DwxUSE_LIBJPEG=sys \
    -DwxUSE_LIBPNG=sys \
    -DwxUSE_LIBTIFF=sys \
    -DwxUSE_LIBLZMA=sys \
    -DwxUSE_NANOSVG=sys \
    -DwxUSE_LIBMSPACK=ON \
    -DwxUSE_PRIVATE_FONTS=ON \
    -DwxUSE_GTKPRINT=ON \
    -DwxUSE_GLCANVAS_EGL=OFF #the primary reason for this package
  cmake --build build-gtk3

  # Run configure to generate the Makefile, cmake doesn't install translations
  cd wxWidgets
  ./configure --prefix=/usr --disable-tests
  make -C locale allmo
}

package() {

  DESTDIR="$pkgdir" cmake --install build-gtk3
  rm -r "$pkgdir"/usr/{include,lib/libwx_base*,bin/wxrc*}

  install -Dm644 wxWidgets/docs/licence.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
# vim:set ts=2 sw=2 et:
