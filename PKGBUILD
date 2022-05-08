# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Tim Rakowski <tim.rakowski@gmail.com>
pkgname=ignition-common
pkgver=4.5.0
pkgrel=4
pkgdesc="A collection of useful classes and functions for handling many command tasks. This includes parsing 3D mesh files, managing console output, and using PID controllers."
arch=('any')
url="https://ignitionrobotics.org/libs/common"
license=('Apache')
groups=('development')
depends=('ignition-math>=6' 'ignition-utils' 'tinyxml2' 'freeimage' 'libutil-linux' 'gts' 'ffmpeg')
makedepends=('ignition-cmake>=2' 'util-linux')
optdepends=()
conflicts=()
source=("https://github.com/ignitionrobotics/ign-common/archive/${pkgname}4_${pkgver}.tar.gz" "patch"::"https://github.com/ignitionrobotics/ign-common/pull/325.patch")
sha256sums=('0810d23af7ae16524f115e191e72df9de436e0809ade3d85bdee455bfa3f1aff'
            '799d1c63658cfec9671f88fecd38fd6dc659f89c7c8004d8011e47ce8b5dafc2')

_dir="gz-common-${pkgname}4_${pkgver}"

prepare() {
  cd "${srcdir}/$_dir"/
  patch -p1 -i "${srcdir}/patch"
}

build() {
  cd "$srcdir/$_dir"

  mkdir -p build
  cd build

  # Configure build
  cmake .. -Wno-dev \
           -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX="/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib" \
           -DBUILD_TESTING:BOOL=False

  # Compile
  make
}

package() {
  cd "$srcdir/$_dir/build"
  make DESTDIR="$pkgdir/" install
}
