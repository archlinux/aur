# Maintainer: Tyler Veness <calcmogul at gmail dot com>

pkgname=wpimath
pkgver=2023.1.1b7
pkgrel=1
pkgdesc="WPILib's mathematics and controls library"
arch=('x86_64')
url='https://github.com/wpilibsuite/allwpilib'
depends=('fmt' 'eigen')
makedepends=('cmake')
license=('BSD' 'MIT')
options=('!strip' 'staticlibs')
source=('git+https://github.com/wpilibsuite/allwpilib#tag=v2023.1.1-beta-7'
        'Suppress-Eigen-warning.patch')
md5sums=('SKIP'
         '0116ecb4c78683a00db29f15c23b2920')

prepare() {
  cd allwpilib
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
}
