# Maintainer: Adrià Arrufat <adria.arrufat+AUR@protonmail.ch>
# Contributor: Eric Bélanger <eric@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=webkit2gtk-unstable
pkgver=2.23.90
pkgrel=1
pkgdesc="GTK+ Web content engine library"
arch=('i686' 'x86_64')
url="https://webkitgtk.org/"
license=('custom')
depends=(libxt libxslt enchant geoclue2 gst-plugins-base-libs
	 libsecret libwebp harfbuzz-icu gtk3 libnotify hyphen woff2)
makedepends=(gtk2 gperf gobject-introspection ruby cmake python ninja)
optdepends=('gtk2: Netscape plugin support'
            'gst-plugins-base: free media decoding'
            'gst-plugins-good: media decoding'
            'gst-libav: nonfree media decoding')
conflicts=(webkit2gtk)
provides=(webkit2gtk)
options=('!emptydirs')

source=(http://webkitgtk.org/releases/webkitgtk-${pkgver}.tar.xz)
sha1sums=('83cc239517f27321705a4d6da2bd3f81d5182295')

prepare() {
  [ -d build ] && rm -rf build
  mkdir build

  cd webkitgtk-$pkgver
  rm -r Source/ThirdParty/gtest/
}

build() {
  cd build
  cmake \
    -G Ninja \
    -DPORT=GTK \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=ON \
    -DLIB_INSTALL_DIR=/usr/lib \
    ../webkitgtk-$pkgver
  ninja
}

package() {
  cd build
  DESTDIR="$pkgdir" ninja install

  install -m755 -d "$pkgdir/usr/share/licenses/webkit2gtk"
  cd "$srcdir/webkitgtk-$pkgver/Source"
  for f in $(find -name 'COPYING*' -or -name 'LICENSE*'); do
    echo $f >> "$pkgdir/usr/share/licenses/webkit2gtk/LICENSE"
    cat $f >> "$pkgdir/usr/share/licenses/webkit2gtk/LICENSE"
    echo "" >> "$pkgdir/usr/share/licenses/webkit2gtk/LICENSE"
  done
}
