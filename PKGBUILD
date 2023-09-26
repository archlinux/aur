# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Tim Rakowski <tim.rakowski@gmail.com>
pkgname=ignition-common
pkgver=5.4.0
pkgrel=1
pkgdesc="Provides a set of libraries that cover many different use cases."
arch=('x86_64')
url="https://gazebosim.org/libs/common"
license=('Apache')
depends=('ignition-math>6' 'ignition-utils>1' 'tinyxml2' 'freeimage'
         'libutil-linux' 'gts' 'ffmpeg4.4' 'gdal' 'assimp')
makedepends=('ignition-cmake>2' 'util-linux')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gazebosim/gz-common/archive/gz-common5_${pkgver}.tar.gz"
        "gcc13.diff::https://github.com/gazebosim/gz-common/commit/6a0f9d7cd67a3916a0e6661cd99494f2d0e4faf9.patch")
sha256sums=('e439bac118b145355d57713a975394a6191e4d1d4703566851ddfc7b72463af3'
            '5c1018b5dd41e1d9af9050e19baad31010e31788663430c48b5aaa2e0cdf0d43')

_dir="gz-common-gz-common5_${pkgver}"
prepare() {
  # fix GCC13 errors
  cd "$srcdir/$_dir"
  patch -p1 < ../gcc13.diff
}
build() {
  cd "$srcdir/$_dir"

  mkdir -p build
  cd build

  export PKG_CONFIG_PATH=/usr/lib/ffmpeg4.4/pkgconfig
  cmake .. -Wno-dev \
           -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX="/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib" \
           -DBUILD_TESTING:BOOL=False

  make
}

package() {
  cd "$srcdir/$_dir/build"
  make DESTDIR="$pkgdir/" install
}
