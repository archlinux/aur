# Maintainer: Arti Zirk <arti@zirk.me>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

# This package pulls bunch of in flux wxWidgets patches together as noted in
# https://gitlab.com/kicad/code/kicad/-/issues/7207#note_1578155328
# Also borrwoed some things from AUR wxgtk-git package

pkgbase=wxwidgets-wayland-perf
pkgname=(wxwidgets-gtk3-wayland-perf wxwidgets-qt5-wayland-perf wxwidgets-common-wayland-perf)
pkgver=3.2.2.r189.gacea4afa5e01
pkgrel=1
epoch=1
arch=(x86_64)
url='https://wxwidgets.org'
license=(custom:wxWindows)
makedepends=(git cmake gst-plugins-base glu webkit2gtk libnotify qt5-base sdl2 libmspack)
# head of PR  Final bunch of proposed backports for 3.2.3 #23891
# https://github.com/wxWidgets/wxWidgets/pull/23891
source=("git+https://github.com/wxWidgets/wxWidgets.git#commit=acea4afa5e0176949353516a8f0ebb3db05bed82"
        "git+https://github.com/wxWidgets/Catch.git"
        "git+https://github.com/wxWidgets/pcre.git"
        "git+https://github.com/wxWidgets/nanosvg.git"
	"https://patch-diff.githubusercontent.com/raw/wxWidgets/wxWidgets/pull/23898.patch"
	"https://patch-diff.githubusercontent.com/raw/wxWidgets/wxWidgets/pull/23900.patch")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'dfac1456b4f6f4b8e955c2cfbc6aff61f7ad6b101d2906f69f7a6f1873298d48'
            '14ae7c30c8aef45a96255cdb171692e474df5bc5fa295c6f1c7b8c2a00a71edb')


pkgver() {
  cd wxWidgets
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd wxWidgets
  git config submodule.3rdparty/catch.url "${srcdir}/Catch"
  git -c protocol.file.allow=always submodule update --init 3rdparty/catch

  git config submodule.3rdparty/pcre.url "${srcdir}/pcre"
  git -c protocol.file.allow=always submodule update --init 3rdparty/pcre

  git config submodule.3rdparty/nanosvg.url "${srcdir}/nanosvg"
  git -c protocol.file.allow=always submodule update --init 3rdparty/nanosvg

  git apply "${srcdir}/23898.patch"
  git apply "${srcdir}/23900.patch"

  ./autogen.sh
}

build() {
  cmake -B build-gtk3 -S wxWidgets \
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

  cmake -B build-qt5 -S wxWidgets \
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
  cd wxWidgets
  ./configure --prefix=/usr
}

package_wxwidgets-common-wayland-perf() {
  pkgdesc='Common libraries and headers for wxwidgets'
  depends=(expat pcre2 libsecret)
  provides=(wxwidgets-common)
  conflicts=(wxwidgets-common)

  DESTDIR="$pkgdir" cmake --install build-gtk3
  rm -r "$pkgdir"/usr/{bin/wx-config,lib/{cmake,wx,libwx_gtk*}}
  install -Dm644 wxWidgets/wxwin.m4 -t "$pkgdir"/usr/share/aclocal
# Install translations
  make DESTDIR="$pkgdir" -C wxWidgets locale_install

  install -Dm644 wxWidgets/docs/licence.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_wxwidgets-gtk3-wayland-perf() {
  pkgdesc='GTK+3 implementation of wxWidgets API for GUI'
  depends=(gtk3 gst-plugins-base-libs libsm wxwidgets-common-wayland-perf libnotify libmspack sdl2)
  optdepends=('webkit2gtk: for webview support')
  provides=(wxwidgets-gtk3)
  conflicts=(wxwidgets-gtk3)

  DESTDIR="$pkgdir" cmake --install build-gtk3
  rm -r "$pkgdir"/usr/{include,lib/libwx_base*,bin/wxrc*}

  install -Dm644 wxWidgets/docs/licence.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
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

  install -Dm644 wxWidgets/docs/licence.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
