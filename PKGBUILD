# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

# includes patches from https://github.com/wxWidgets/wxWidgets/pull/23554

pkgbase=wxwidgets-wayland-perf
pkgname=(wxwidgets-gtk3-wayland-perf wxwidgets-qt5-wayland-perf wxwidgets-common-wayland-perf)
pkgver=3.2.2.1
pkgrel=1
arch=(x86_64)
url='https://wxwidgets.org'
license=(custom:wxWindows)
makedepends=(cmake gst-plugins-base glu webkit2gtk libnotify qt5-base sdl2 libmspack)
source=(https://github.com/wxWidgets/wxWidgets/releases/download/v$pkgver/wxWidgets-$pkgver.tar.bz2
        https://github.com/wxWidgets/wxWidgets/commit/ed510012.patch
	https://github.com/wxWidgets/wxWidgets/commit/fca2f535732229269dedfea67899134d64ccd9a9.patch
	https://github.com/wxWidgets/wxWidgets/commit/194a7be33fa471a768e1b012b18b0554d4935b26.patch
	https://github.com/wxWidgets/wxWidgets/commit/f2214fff6026b44bede0ea979f286453f967fed0.patch
	https://github.com/wxWidgets/wxWidgets/commit/54d44fcb536625b7ba71b81ff8ad6d1cb56db6ba.patch)
sha256sums=('dffcb6be71296fff4b7f8840eb1b510178f57aa2eb236b20da41182009242c02'
            '0f714caa562269ba40ea55e1ef2f1c800d0669f01c3862f47db183eb2db91567'
            'be4367bd47e3d4210c51b82b4a2ef544b5cfc4c921b1c34731d6b7eb8092193f'
            '41650006b7d00ffd0991a8279356122b112e7e3fdf0e2a398fbd493cf9d470e7'
            'c658311849a7b4b43669e68678796c3c6b9d1d3c27be9baf04e8511a7de0c9bd'
            '1eb62bf7e5a02a65d8a30f2f0a4701b223ba78097c148589a7fbc48b3ad58fd9')

prepare() {
  patch -d wxWidgets-$pkgver -p1 < ed510012.patch # Fix undefined symbols in Qt build
  patch -d wxWidgets-$pkgver -p1 -F3 < fca2f535732229269dedfea67899134d64ccd9a9.patch # Don't use wxGLCanvasEGL::m_readyToDraw for X11 windows
  patch -d wxWidgets-$pkgver -p1 < 194a7be33fa471a768e1b012b18b0554d4935b26.patch # Improve wxGLCanvasEGL refresh logic under Wayland
  patch -d wxWidgets-$pkgver -p1 < f2214fff6026b44bede0ea979f286453f967fed0.patch # Don't draw on hidden X11 EGL windows
  patch -d wxWidgets-$pkgver -p1 < 54d44fcb536625b7ba71b81ff8ad6d1cb56db6ba.patch # Add some tracing to wxGLCanvasEGL code
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

package_wxwidgets-common-wayland-perf() {
  pkgdesc='Common libraries and headers for wxwidgets'
  depends=(expat pcre2 libsecret)
  provides=(wxwidgets-common)
  conflicts=(wxwidgets-common)

  DESTDIR="$pkgdir" cmake --install build-gtk3
  rm -r "$pkgdir"/usr/{bin/wx-config,lib/{cmake,wx,libwx_gtk*}}
  install -Dm644 wxWidgets-$pkgver/wxwin.m4 -t "$pkgdir"/usr/share/aclocal
# Install translations
  make DESTDIR="$pkgdir" -C wxWidgets-$pkgver locale_install  

  install -Dm644 wxWidgets-$pkgver/docs/licence.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_wxwidgets-gtk3-wayland-perf() {
  pkgdesc='GTK+3 implementation of wxWidgets API for GUI'
  depends=(gtk3 gst-plugins-base-libs libsm wxwidgets-common-wayland-perf libnotify libmspack sdl2)
  optdepends=('webkit2gtk: for webview support')
  provides=(wxwidgets-gtk3)
  conflicts=(wxwidgets-gtk3)

  DESTDIR="$pkgdir" cmake --install build-gtk3
  rm -r "$pkgdir"/usr/{include,lib/libwx_base*,bin/wxrc*}
  
  install -Dm644 wxWidgets-$pkgver/docs/licence.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_wxwidgets-qt5-wayland-perf() {
  pkgdesc='Qt5 implementation of wxWidgets API for GUI'
  depends=(qt5-base wxwidgets-common-wayland-perf libmspack sdl2 libtiff)
  provides=(wxwidgets-qt5)
  conflicts=(wxwidgets-qt5)

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
