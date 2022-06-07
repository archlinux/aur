# Maintainer: Tyler Veness <calcmogul at gmail dot com>

pkgname=wpimath
pkgver=2023.1.1a
pkgrel=1
pkgdesc="WPILib's mathematics and controls library"
arch=('x86_64')
url='https://github.com/wpilibsuite/allwpilib'
depends=('fmt' 'eigen' 'libuv')
makedepends=('cmake')
license=('BSD' 'MIT')
options=('!strip' 'staticlibs')
source=('git+https://github.com/wpilibsuite/allwpilib#tag=v2023.1.1-alpha-1')
#source=("https://github.com/wpilibsuite/allwpilib/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('SKIP')

build() {
  cmake -B build -S "allwpilib" \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DWITH_JAVA=OFF \
    -DWITH_CSCORE=OFF \
    -DWITH_WPIMATH=ON \
    -DWITH_WPILIB=OFF \
    -DWITH_TESTS=ON \
    -DWITH_GUI=OFF \
    -DWITH_SIMULATION_MODULES=OFF \
    -Wno-dev
  cmake --build build
}

check() {
  cd build
  ctest --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # Move includes to /usr/include
  mv "$pkgdir"/usr/wpilib/include "$pkgdir"/usr/include

  # Delete thirdparty libraries
  rm -r "$pkgdir"/usr/include/wpimath/Eigen
  rm -r "$pkgdir"/usr/include/wpimath/unsupported
  rm -r "$pkgdir"/usr/include/wpiutil/fmt

  # Fix wpiutil includes
  mv "$pkgdir"/usr/include/wpiutil/* "$pkgdir"/usr/include
  rmdir "$pkgdir"/usr/include/wpiutil

  # Fix wpinet includes
  rm -r "$pkgdir"/usr/include/wpinet/uv
  mv "$pkgdir"/usr/include/wpinet/wpinet/* "$pkgdir"/usr/include/wpinet

  # Fix ntcore includes
  mv "$pkgdir"/usr/include/ntcore/* "$pkgdir"/usr/include
  rmdir "$pkgdir"/usr/include/ntcore

  # Fix wpimath includes
  mv "$pkgdir"/usr/include/wpimath/frc "$pkgdir"/usr/include
  mv "$pkgdir"/usr/include/wpimath/drake "$pkgdir"/usr/include
  mv "$pkgdir"/usr/include/wpimath/units "$pkgdir"/usr/include
  mv "$pkgdir"/usr/include/wpimath/wpimath/MathShared.h "$pkgdir"/usr/include/wpimath
  rmdir "$pkgdir"/usr/include/wpimath/wpimath

  # Fix libs install
  mv "$pkgdir"/usr/wpilib/lib "$pkgdir"/usr/lib

  # Fix CMake modules install
  mkdir -p "$pkgdir/usr/share/cmake/Modules"
  rm "$pkgdir"/usr/wpilib/wpilib-config.cmake
  mv "$pkgdir"/usr/wpilib/*.cmake "$pkgdir/usr/share/cmake/Modules"

  rmdir "$pkgdir"/usr/wpilib
}
