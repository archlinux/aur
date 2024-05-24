# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=qt5-webkit-movableink-git
pkgver=r275665.2d2b3794dd79
pkgrel=2
pkgdesc="Classes for a WebKit2 based implementation and a new QML API"
arch=(x86_64)
url="https://github.com/movableink/webkit"
license=(LGPL2.1)
depends=(qt5-base qt5-location libjpeg libpng libwebp libxml2 hyphen harfbuzz harfbuzz-icu icu woff2 zlib
         gstreamer gst-plugins-base-libs libxslt

         # namcap implicit depends
         glibc glib2 gcc-libs sqlite libgcrypt libtasn1)
depends+=(libicuuc.so libicui18n.so)
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
source=("movableink-webkit::git+https://github.com/movableink/webkit.git"
        001-fix-build.patch)
sha256sums=('SKIP'
            '30634c6480fc97e0bc5e0246175de65892b142b34f64355f7040cb9e063f2dcf')

prepare() {
  cd movableink-webkit
  patch -Np1 -i ../001-fix-build.patch
}

pkgver() {
  cd "movableink-webkit"
  #git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S movableink-webkit -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DPORT=Qt \
    -DENABLE_TOOLS=OFF

  cmake --build build
}

package() {
  depends+=(libicuuc.so libicui18n.so)
  DESTDIR="$pkgdir" cmake --install build
}
