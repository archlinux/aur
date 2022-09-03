# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgbase=wxwidgets
pkgname=(wxwidgets-gtk3 wxwidgets-qt5 wxwidgets-common)
pkgver=3.2.0
pkgrel=6
arch=(x86_64)
url='https://wxwidgets.org'
license=(custom:wxWindows)
makedepends=(cmake gst-plugins-base glu webkit2gtk libnotify qt5-base sdl2 libmspack)
source=(https://github.com/wxWidgets/wxWidgets/releases/download/v$pkgver/wxWidgets-$pkgver.tar.bz2
        https://github.com/wxWidgets/wxWidgets/commit/e4f230a3.patch
        https://github.com/wxWidgets/wxWidgets/commit/d9a78be1.patch
        https://github.com/wxWidgets/wxWidgets/commit/600bf54a.patch)
sha256sums=('356e9b55f1ae3d58ae1fed61478e9b754d46b820913e3bfbc971c50377c1903a'
            '00f58f7248ce513e50acfdf6fca536a2e557d9d07891168ba9f9789322bbac03'
            'efc502a5c72b257d38bf9957bd29eb684fd24b816d689a860bc1d511ff56458f'
            '6c764e0907fe9e0f881f6bff924429bf42f33ce5865dc2f3fe918ba3c492c011')
options=(debug)

prepare() {
  patch -d wxWidgets-$pkgver -p1 < d9a78be1.patch # Support GTKprint with cmake
  patch -d wxWidgets-$pkgver -p1 < e4f230a3.patch # Pre next commit
  patch -d wxWidgets-$pkgver -p1 < 600bf54a.patch # Honor DESTDIR
}

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
