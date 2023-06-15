# Maintainer: Blair Bonnett <blair.bonnett@gmail.com>

pkgbase=lastools
pkgdesc='Efficient tools for LiDAR processing'
pkgname=('lastools' 'laslib')
pkgver=2.0.2
pkgrel=1
url='https://lastools.github.io/'
license=('LGPL')
arch=('x86_64')

depends=('gcc-libs' 'glibc')
makedepends=('cmake')

source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/LAStools/LAStools/archive/refs/tags/v$pkgver.tar.gz"
  'add_cmake_components.patch'
  'set_libdir.patch'
)
sha256sums=(
  '41200e2b6ad92fe057fc5008132978090890463d5b602bce89ecf8aa84c78a82'
  'acf54ddb1d311b1250e14da966878f7ebbdaf46bc0a07cb857d5e8435b704212'
  'be78bc1127d36e3845936754a60fe0e2a4fdb8c85ad86355c5235b2f78536c97'
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
