# Maintainer: Blair Bonnett <blair.bonnett@gmail.com>

pkgbase=lastools
pkgdesc='Efficient tools for LiDAR processing'
pkgname=('lastools' 'laslib')
pkgver=2.0.3
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
  'b6c6ac33835ead2c69d05e282febc266048ba071a71dae6fdad321d532dfcf78'
  'acc829c7505bf0888253b2e701d959705ca09b4ae3b79c3954e6776f27765bf9'
  'cc6d5a5c9680bc64387185002014517f16335b749503c4f2816c86238944c8a9'
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
