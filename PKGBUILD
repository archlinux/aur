# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgbase=wxwidgets
pkgname=(wxwidgets-gtk3 wxwidgets-qt5 wxwidgets-common)
pkgver=3.2.1
pkgrel=2
arch=(x86_64)
url='https://wxwidgets.org'
license=(custom:wxWindows)
makedepends=(cmake gst-plugins-base glu webkit2gtk libnotify qt5-base sdl2 libmspack)
source=(https://github.com/wxWidgets/wxWidgets/releases/download/v$pkgver/wxWidgets-$pkgver.tar.bz2)
sha256sums=('c229976bb413eb88e45cb5dfb68b27890d450149c09b331abd751e7ae0f5fa66')
options=(debug)

build() {
  cmake -B build-gtk3 -S wxWidgets-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DwxBUILD_TOOLKIT=gtk3 \
    -DwxUSE_OPENGL=ON \
    -DwxUSE_REGEX=sys\
    -DwxUSE_ZLIB=sys \
    -DwxUSE_EXPAT=sys \
    -DwxUSE_LIBJPEG=sys \
    -DwxUSE_LIBPNG=sys \
    -DwxUSE_LIBTIFF=sys \
    -DwxUSE_LIBLZMA=sys \
    -DwxUSE_LIBMSPACK=ON \
    -DwxUSE_PRIVATE_FONTS=ON \
    -DwxUSE_GTKPRINT=ON
  cmake --build build-gtk3

  cmake -B build-qt5 -S wxWidgets-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DwxBUILD_TOOLKIT=qt \
    -DwxUSE_OPENGL=ON \
    -DwxUSE_REGEX=sys \
    -DwxUSE_ZLIB=sys \
    -DwxUSE_EXPAT=sys \
    -DwxUSE_LIBJPEG=sys \
    -DwxUSE_LIBPNG=sys \
    -DwxUSE_LIBTIFF=sys \
    -DwxUSE_LIBLZMA=sys \
    -DwxUSE_LIBMSPACK=ON \
    -DwxUSE_PRIVATE_FONTS=ON
  cmake --build build-qt5

# Run configure to generate the Makefile, cmake doesn't install translations
  cd wxWidgets-$pkgver
  ./configure --prefix=/usr
}

package_wxwidgets-common() {
  pkgdesc='Common libraries and headers for wxwidgets'
  depends=(expat pcre2 libsecret)
  conflicts=(wxgtk-common)
  replaces=(wxgtk-common)

  DESTDIR="$pkgdir" cmake --install build-gtk3
  rm -r "$pkgdir"/usr/{bin/wx-config,lib/{cmake,wx,libwx_gtk*}}
  install -Dm644 wxWidgets-$pkgver/wxwin.m4 -t "$pkgdir"/usr/share/aclocal
# Install translations
  make DESTDIR="$pkgdir" -C wxWidgets-$pkgver locale_install  

  install -Dm644 wxWidgets-$pkgver/docs/licence.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_wxwidgets-gtk3() {
  pkgdesc='GTK+3 implementation of wxWidgets API for GUI'
  depends=(gtk3 gst-plugins-base-libs libsm wxwidgets-common libnotify libmspack sdl2)
  optdepends=('webkit2gtk: for webview support')
  conflicts=(wxgtk3)
  provides=(wxgtk3 wxwidgets)
  replaces=(wxgtk3)

  DESTDIR="$pkgdir" cmake --install build-gtk3
  rm -r "$pkgdir"/usr/{include,lib/libwx_base*,bin/wxrc*}
  
  install -Dm644 wxWidgets-$pkgver/docs/licence.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_wxwidgets-qt5() {
  pkgdesc='Qt5 implementation of wxWidgets API for GUI'
  depends=(qt5-base wxwidgets-common libmspack sdl2)
  provides=(wxwidgets)

  DESTDIR="$pkgdir" cmake --install build-qt5
  rm -r "$pkgdir"/usr/{include,lib/libwx_base*,bin/wxrc*}
  mv "$pkgdir"/usr/bin/wx-config{,-qt} # Conflicts with wx-gtk3
# Rename cmake files for coinstallability
  mv "$pkgdir"/usr/lib/cmake/wxWidgets{,Qt}
  for _f in "$pkgdir"/usr/lib/cmake/wxWidgetsQt/*; do
    mv $_f $(dirname $_f)/$(basename $_f | sed -e 's/wxWidgets/wxWidgetsQt/')
  done

  install -Dm644 wxWidgets-$pkgver/docs/licence.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
