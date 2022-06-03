# Maintainer: Homalozoa <nx.tardis@gmail.com>

pkgname=ignition-common-3
pkgver=3.14.0
pkgrel=2
pkgdesc="A collection of useful classes and functions for handling many command tasks. This includes parsing 3D mesh files, managing console output, and using PID controllers."
arch=('any')
url="https://gazebosim.org/libs/common"
license=('Apache')
groups=('development')
depends=('ignition-math>=6' 'tinyxml2' 'freeimage' 'libutil-linux' 'gts' 'ffmpeg4.4')
makedepends=('ignition-cmake>=2' 'util-linux')
optdepends=()
provides=("ignition-common=$pkgver")
_url=https://github.com/gazebosim/gz-common
source=("$_url/archive/ignition-common3_${pkgver}.tar.gz"
        "missing-include-cstring.patch::$_url/commit/465bb7780e552b278de559fafaffe3d061a99782.patch")
sha256sums=('293ff4d9e4e5814535ddc40b45794c05153e43b274cee25744a3eea493da5641'
            '9a6f2d45a1c2146150336e25162f6ba46f19db1deb46b2b644a8faa3afe3d7af')

_dir="gz-common-ignition-common3_${pkgver}"

prepare() {
  cd "$srcdir/$_dir"
  patch -p1 < ../missing-include-cstring.patch
}

build() {
  cd "$srcdir/$_dir"

  mkdir -p build
  cd build

  # Configure build
  export PKG_CONFIG_PATH=/usr/lib/ffmpeg4.4/pkgconfig
  cmake .. -DCMAKE_BUILD_TYPE="Release" \
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
