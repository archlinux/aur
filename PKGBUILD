# Maintainer: Blair Bonnett <blair.bonnett@gmail.com>

pkgbase=lastools
pkgdesc='Efficient tools for LiDAR processing'
pkgname=('lastools' 'laslib')
pkgver=2.0.4
pkgrel=1
url='https://lastools.github.io/'
license=('LGPL-2.1-only')
arch=('x86_64')

depends=('gcc-libs' 'glibc')
makedepends=('cmake')

source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/LAStools/LAStools/archive/refs/tags/v$pkgver.tar.gz"
  'add_cmake_components.patch'
  'set_libdir.patch'
)
sha256sums=(
  '40009d74dd7e782e2f245f4e35d063db06e74b2948a47157ee41f1cf63057090'
  'da6c519b33e5a596c0dac0fdfc37b0bf39b6a459a160165ea9cc688b42a363a7'
  '98870e79ce664e191b9100adafabb1d63c05e9b75e6566e6477eb94d64ee6a96'
)

prepare() {
  cd "LAStools-$pkgver"
  patch -p0 -i "$srcdir/add_cmake_components.patch"
  patch -p0 -i "$srcdir/set_libdir.patch"
}

build() {
  export CXXFLAGS="$CXXFLAGS -Wno-format-security"
  cmake -B build -S "LAStools-$pkgver" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DBUILD_SHARED_LIBS=yes \
        -Wno-dev
  cmake --build build
}

package_lastools(){
  pkgdesc='Efficient tools for LiDAR processing'
  depends=('gcc-libs' 'glibc' 'libLASlib.so')

  DESTDIR="$pkgdir" cmake --install build --component lastools
}

package_laslib() {
  pkgdesc='Efficient library for LiDAR processing'
  depends=('gcc-libs' 'glibc')
  provides=('libLASlib.so')

  DESTDIR="$pkgdir" cmake --install build --component laslib
}
