# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org>
# Contributor: Dāvis Mosāns <davispuh at gmail dot com>

pkgname=qt5-webkit-git
pkgver=5.212.0.alpha4.r188.g756e1c8f23dc
pkgrel=2
arch=(x86_64)
url='https://github.com/qtwebkit/qtwebkit'
license=(LGPL2.1)
pkgdesc='Classes for a WebKit2 based implementation and a new QML API'
depends=(qt5-location qt5-sensors qt5-webchannel libwebp libxcomposite gst-plugins-base hyphen woff2

         # namcap implicit depends
         glibc gcc-libs glib2 zlib libx11 sqlite gst-plugins-base-libs libjpeg-turbo icu libpng gstreamer libxml2
         qt5-base qt5-declarative)
         # libxslt
depends+=(libicuuc.so libicui18n.so)
makedepends=(git cmake ruby ruby-erb gperf python qt5-doc qt5-tools)
optdepends=('gst-plugins-good: Webm codec support')
provides=(qt5-webkit)
conflicts=(qt5-webkit)
options=(!lto)
source=("git+https://github.com/qtwebkit/qtwebkit.git#branch=qtwebkit-5.212"
        "https://src.fedoraproject.org/rpms/qt5-qtwebkit/raw/rawhide/f/qtwebkit-fix-build-gcc14.patch"
         https://src.fedoraproject.org/rpms/qt5-qtwebkit/raw/rawhide/f/webkit-offlineasm-warnings-ruby27.patch)
sha256sums=('SKIP'
            'eea38db22078700887bf22b6a49bb628fd8444cdb2e506770c993df883d0e8fb'
            '8768433ff3f641b506962ed22cc596eaf57bf21b6d3402e0e73ad8c2afeaa502')

pkgver() {
  cd "qtwebkit"
  # Tag on 10/03
  git tag -f qtwebkit-5.212.0.alpha4 874098cc94c9dda3ae5dc5cbe49a447685216bea
  git describe --long --tags | sed 's/^qtwebkit-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "qtwebkit"
  patch -p1 -i ../qtwebkit-fix-build-gcc14.patch
  echo "Done patch for GCC 14.1"

  patch -Np1 -i ../webkit-offlineasm-warnings-ruby27.patch
  echo "Done patch for Ruby 3.2"
}

build() {
  cmake -B build -S qtwebkit -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_CXX_FLAGS="${CXXFLAGS} -DNDEBUG" \
    -DPYTHON_EXECUTABLE:FILEPATH=/usr/bin/python \
    -DPORT=Qt \
    -DUSE_LD_GOLD=OFF \
    -DENABLE_XSLT=OFF \
    -DENABLE_TOOLS=OFF

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
