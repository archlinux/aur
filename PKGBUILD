# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgbase=qt5-webkit-movableink-git
pkgname=qt6-webkit-movableink-git
pkgver=r284069.9a33154f9d7a
pkgrel=1
pkgdesc="Classes for a WebKit2 based implementation and a new QML API"
arch=(x86_64)
url="https://github.com/movableink/webkit"
license=(LGPL2.1)
depends=(qt6-base qt6-location libjpeg libpng libwebp libxml2 hyphen harfbuzz harfbuzz-icu icu woff2 zlib
         gstreamer gst-plugins-base-libs libxslt

         # namcap implicit depends
         glibc glib2 gcc-libs sqlite libgcrypt libtasn1)
depends+=(libicuuc.so libicui18n.so)
makedepends=(git cmake ruby ruby-erb gperf python qt6-tools libxcomposite
    gst-libav
    gst-plugins-base
    gst-plugins-good
    gst-plugins-ugly
    gst-plugins-bad
    gst-plugins-bad-libs
)

optdepends=('gst-plugins-good: Webm codec support')
provides=(qt6-webkit) #qt6-webkit-movableink
conflicts=(qt6-webkit) #qt6-webkit-movableink
options=(!lto)
source=("movableink-webkit::git+https://github.com/movableink/webkit.git"
         https://src.fedoraproject.org/rpms/qt5-qtwebkit/raw/rawhide/f/webkit-offlineasm-warnings-ruby27.patch)
sha256sums=('SKIP'
            '8768433ff3f641b506962ed22cc596eaf57bf21b6d3402e0e73ad8c2afeaa502')

prepare() {
  cd movableink-webkit
  patch -Np1 -i ../webkit-offlineasm-warnings-ruby27.patch
  echo "Done patch for Ruby 3.2"
}

pkgver() {
  cd "movableink-webkit"
  #git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S movableink-webkit -Wno-dev \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPORT=Qt \
    -DENABLE_TOOLS=OFF

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
