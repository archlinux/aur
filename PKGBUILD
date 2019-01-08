# Maintainer: Adrià Arrufat <adria.arrufat+AUR@protonmail.ch>

pkgname=webkit2gtk-unstable
pkgver=2.23.2
pkgrel=1
pkgdesc="GTK+ Web content engine library"
arch=('i686' 'x86_64')
url="https://webkitgtk.org/"
license=('custom')
depends=(libxt libxslt enchant geoclue2 gst-plugins-base-libs
	 libsecret libwebp harfbuzz-icu gtk3 libnotify hyphen woff2)
makedepends=(gtk2 gperf gobject-introspection ruby gtk-doc cmake python python2 ninja)
optdepends=('gtk2: Netscape plugin support'
            'gst-plugins-base: free media decoding'
            'gst-plugins-good: media decoding'
            'gst-libav: nonfree media decoding')
conflicts=(webkit2gtk)
provides=(webkit2gtk)
options=('!emptydirs')

source=(http://webkitgtk.org/releases/webkitgtk-${pkgver}.tar.xz)
sha1sums=('fc90f496d96e6386070e2c785b06f5fb8682d7a2')

prepare() {
  [ -d build ] && rm -rf build
  mkdir build

  cd webkitgtk-$pkgver
  sed -i '1s/python$/&2/' Tools/gtk/generate-gtkdoc
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
    -DENABLE_GTKDOC=ON \
    -DLIB_INSTALL_DIR=/usr/lib \
    -DPYTHON_EXECUTABLE=/usr/bin/python2 \
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
