# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org>
# Contributor: Dāvis Mosāns <davispuh at gmail dot com>

pkgname=qt5-webkit-git
pkgver=5.212.0.alpha4.r13.gac8ebc6c3
pkgrel=2
arch=(x86_64)
url='https://github.com/qtwebkit/qtwebkit'
license=(GPL3 LGPL3 FDL custom)
pkgdesc='Classes for a WebKit2 based implementation and a new QML API'
source=("qt5-webkit::git+https://code.qt.io/qt/qtwebkit.git#branch=5.212"
        "https://src.fedoraproject.org/rpms/qt5-qtwebkit/raw/rawhide/f/qtwebkit-cstdint.patch"
         icu68.patch
         glib-2.68.patch)
depends=(qt5-location qt5-sensors qt5-webchannel libwebp libxslt libxcomposite gst-plugins-base hyphen woff2)
makedepends=(git cmake ruby gperf python qt5-doc qt5-tools)
optdepends=('gst-plugins-good: Webm codec support')
provides=(qt5-webkit)
conflicts=(qt5-webkit)
options=(!lto)
sha256sums=('SKIP'
            '4c71c958eae45cae65c9f002024eb1369d06029b668e595158138ff7971e64f1'
            '0b40ed924f03ff6081af610bb0ee01560b7bd1fb68f8af02053304a01d4ccdf0'
            '4969dd03e482155e2490b50307dada81dda7bbc9e5398e3a53c20bc474f7c04e')

pkgver() {
  cd "$srcdir/qt5-webkit"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/qt5-webkit"
  patch -p0 -i ../icu68.patch # Fix build with ICU 68.x
  patch -p1 -i ../glib-2.68.patch # https://github.com/qtwebkit/qtwebkit/issues/1057
  patch -p1 -i ../qtwebkit-cstdint.patch # gcc 11.1
}

build() {
  cmake -B build -S qt5-webkit \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_CXX_FLAGS="${CXXFLAGS} -DNDEBUG" \
    -DPORT=Qt \
    -DENABLE_TOOLS=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -d "$pkgdir"/usr/share/licenses
  ln -s /usr/share/licenses/qt5-base "$pkgdir"/usr/share/licenses/${pkgname}
}
