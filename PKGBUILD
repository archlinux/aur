# Contributor: Tim Rakowski <tim.rakowski@gmail.com>
pkgname=ignition-cmake
pkgver=0.4.1
pkgrel=1
pkgdesc="Provides modules that are used to find dependencies of ignition projects and generate cmake targets for consumers of ignition projects to link against."
arch=('any')
url="http://ignitionrobotics.org/libs/cmake"
license=('Apache')
groups=('development')
depends=('cmake' 'pkg-config')
optdepends=()
conflicts=()
source=("https://bitbucket.org/ignitionrobotics/ign-cmake/get/${pkgname}_${pkgver}.tar.bz2" "jsoncpp.patch")
sha256sums=('c5f1c74714ed93ff0ba02c504c94055785aa877925fd003b8cdb433cf302a4ed'
            'bfecea1da1bd6fed1e5093788c54a2562e7b3b0eb95f85726f87e28a217dc94a')

_dir="ignitionrobotics-ign-cmake-1f49f8a81dd8"

build() {
  cd "$srcdir/$_dir"
  patch -Np2 -i "${srcdir}/jsoncpp.patch"

  mkdir -p build
  cd build

  # Configure build
  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX="/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib" \
           -DENABLE_TESTS_COMPILATION:BOOL=False

  # Compile
  make
}

check() {
  cd "$srcdir/$_dir/build"

  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX="/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib" \
           -DENABLE_TESTS_COMPILATION:BOOL=True

  make
  make test
}

package() {
  cd "$srcdir/$_dir/build"
  make DESTDIR="$pkgdir/" install
}
