# Contributor: Tim Rakowski <tim.rakowski@gmail.com>
pkgname=ignition-common
pkgver=1.1.1
pkgrel=2
pkgdesc="A collection of useful classes and functions for handling many command tasks. This includes parsing 3D mesh files, managing console output, and using PID controllers."
arch=('any')
url="http://ignitionrobotics.org/libs/common"
license=('Apache')
groups=('development')
makedepends=('ignition-cmake' 'util-linux')
depends=('ignition-math' 'tinyxml2' 'freeimage' 'libutil-linux' 'gts' 'ffmpeg')
optdepends=()
conflicts=()
source=("https://bitbucket.org/ignitionrobotics/ign-common/get/${pkgname}_${pkgver}.tar.bz2")
sha256sums=('SKIP')

_dir="ignitionrobotics-ign-common-4d7ed1df80b0"

build() {
  cd "$srcdir/$_dir"

  # sed -i -e 's/CODEC_CAP_TRUNCATED/AV_CODEC_CAP_TRUNCATED/g' src/Video.cc
  # sed -i -e 's/CODEC_FLAG_TRUNCATED/AV_CODEC_FLAG_TRUNCATED/g' src/Video.cc

  mkdir -p build
  cd build

  # Configure build
  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX="/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib" \
           -DBUILD_TESTING:BOOL=False

  # Compile
  make
}

check() {
  cd "$srcdir/$_dir/build"

  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX="/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib" \
           -DBUILD_TESTING:BOOL=True

  make
  make test
}

package() {
  cd "$srcdir/$_dir/build"
  make DESTDIR="$pkgdir/" install
}
