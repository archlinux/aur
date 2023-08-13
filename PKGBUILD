# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=qt5-webkit-movableink-git
pkgver=r269464.3cfcdcf38a52
pkgrel=1
pkgdesc='Classes for a WebKit2 based implementation and a new QML API'
arch=(x86_64)
url='https://github.com/qtwebkit/qtwebkit'
license=(GPL3 LGPL3 FDL custom)
depends=(qt5-base qt5-location libjpeg libpng libwebp libxml2 libxslt hyphen harfbuzz harfbuzz-icu icu woff2 zlib
         gstreamer gst-plugins-base-libs

         glibc glib2 gcc-libs sqlite libgcrypt libtasn1
)

makedepends=(git cmake ruby gperf python qt5-tools libxcomposite
    gst-libav
    gst-plugins-base
    gst-plugins-good
    gst-plugins-ugly
    gst-plugins-bad
    gst-plugins-bad-libs
)

optdepends=('gst-plugins-good: Webm codec support')
provides=(qt5-webkit) #qt5-webkit-movableink
conflicts=(qt5-webkit) #qt5-webkit-movableink
options=(!lto)
source=("qt5-webkit-movableink::git+https://github.com/movableink/webkit.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/qt5-webkit-movableink"
  #git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S qt5-webkit-movableink -Wno-dev \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DPORT=Qt \
    -DENABLE_TOOLS=OFF

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -d "$pkgdir"/usr/share/licenses
  ln -s /usr/share/licenses/qt5-base "$pkgdir"/usr/share/licenses/${pkgname}
}
