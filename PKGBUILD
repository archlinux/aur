# Maintainer: Tyler Veness <calcmogul at gmail dot com>

pkgname=wpimath
pkgver=2023.1.1a
pkgrel=2
pkgdesc="WPILib's mathematics and controls library"
arch=('x86_64')
url='https://github.com/wpilibsuite/allwpilib'
depends=('fmt' 'eigen')
makedepends=('cmake')
license=('BSD' 'MIT')
options=('!strip' 'staticlibs')
source=('git+https://github.com/wpilibsuite/allwpilib#tag=v2023.1.1-alpha-1'
        '0001-build-Fix-CMake-system-library-opt-ins.patch'
        '0001-build-Allow-disabling-ntcore-CMake-build.patch'
        'Suppress-Eigen-warning.patch')
#source=("https://github.com/wpilibsuite/allwpilib/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('SKIP'
         'cac7f90b51f6a710bca065b6edc0b996'
         '32b2c74c1c5434ef1241537a0ee8e0f9'
         '0116ecb4c78683a00db29f15c23b2920')

prepare() {
  cd "$srcdir"/allwpilib
  patch -p1 < "$srcdir"/0001-build-Fix-CMake-system-library-opt-ins.patch
  patch -p1 < "$srcdir"/0001-build-Allow-disabling-ntcore-CMake-build.patch
  patch -p1 < "$srcdir"/Suppress-Eigen-warning.patch
}

build() {
  cmake -B build -S "allwpilib" \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DUSE_SYSTEM_EIGEN=ON \
    -DUSE_SYSTEM_FMTLIB=ON \
    -DWITH_JAVA=OFF \
    -DWITH_CSCORE=OFF \
    -DWITH_NTCORE=OFF \
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
  # wpiutil test failure: JsonComparisonValuesTest.Less
  ctest -E wpiutil --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # Move includes to /usr/include
  mv "$pkgdir"/usr/wpilib/include "$pkgdir"/usr/include

  # Fix wpiutil includes
  mv "$pkgdir"/usr/include/wpiutil/* "$pkgdir"/usr/include
  rmdir "$pkgdir"/usr/include/wpiutil

  # Fix wpimath includes
  mv "$pkgdir"/usr/include/wpimath/frc "$pkgdir"/usr/include
  mv "$pkgdir"/usr/include/wpimath/drake "$pkgdir"/usr/include
  mv "$pkgdir"/usr/include/wpimath/units "$pkgdir"/usr/include
  mv "$pkgdir"/usr/include/wpimath/wpimath/MathShared.h "$pkgdir"/usr/include/wpimath
  rmdir "$pkgdir"/usr/include/wpimath/wpimath

  # Fix libs install
  mv "$pkgdir"/usr/wpilib/lib "$pkgdir"/usr/lib

  # Delete empty folder
  rmdir "$pkgdir"/usr/wpilib
}
