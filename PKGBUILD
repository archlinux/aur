# Maintainer: Blair Bonnett <blair.bonnett@gmail.com>

pkgbase=lastools
pkgdesc='Efficient tools for LiDAR processing'
pkgname=('lastools' 'laslib')
pkgver=2.0.5
pkgrel=1
url='https://lastools.github.io/'
license=('LGPL-2.1-only')
arch=('x86_64')

depends=(
  glibc
  libgcc
  libstdc++
)
makedepends=(
  cmake
  git
)

source=(
  "git+https://github.com/LAStools/LAStools.git#tag=v$pkgver"
  'add_cmake_components.patch'
  'set_libdir.patch'
)
sha256sums=(
  '4ac6cfb23c6909db934575e1c1007bc16c143c6c3307aaed54759b91aaa1ae8e'
  '3e96ed4d97d6f86e117bf1bfb70ad7ea5c6937919d5823378bababc8ef8c27f3'
  '0c16096e6d8f64a7a56eded935e55a793e194c042ed4801cfe1860613ffd9628'
)

prepare() {
  cd LAStools
  patch -p0 -i "$srcdir/add_cmake_components.patch"
  patch -p0 -i "$srcdir/set_libdir.patch"
}

build() {
  export CXXFLAGS="$CXXFLAGS -Wno-format-security"
  cmake -B build -S LAStools \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DBUILD_SHARED_LIBS=yes \
        -Wno-dev
  cmake --build build
}

package_lastools(){
  pkgdesc='Efficient tools for LiDAR processing'
  depends=('glibc' 'libgcc' 'libLASlib.so' 'libstdc++')

  DESTDIR="$pkgdir" cmake --install build --component lastools
}

package_laslib() {
  pkgdesc='Efficient library for LiDAR processing'
  depends=('glibc' 'libgcc' 'libstdc++')
  provides=('libLASlib.so')

  DESTDIR="$pkgdir" cmake --install build --component laslib
}
