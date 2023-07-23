# Maintainer: Tyler Veness <calcmogul at gmail dot com>

pkgname=wpimath
pkgver=2023.4.3
pkgrel=3
pkgdesc="WPILib's mathematics and controls library"
arch=('x86_64')
url='https://github.com/wpilibsuite/allwpilib'
depends=('fmt' 'eigen')
makedepends=('cmake')
license=('BSD' 'MIT')
options=('!strip' 'staticlibs')
source=('git+https://github.com/wpilibsuite/allwpilib#tag=v2023.4.3'
        'Don_t-treat-warnings-as-errors.patch'
        'Add-missing-include.patch')
md5sums=('SKIP'
         '06355c12d930efa26edbbe11f633831a'
         'e2b9acf67122eca03efd62866a54ba59')

prepare() {
  cd allwpilib
  patch -p1 < "$srcdir"/Don_t-treat-warnings-as-errors.patch
  patch -p1 < "$srcdir"/Add-missing-include.patch
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
  # wpiutil test failure: JsonComparisonValuesTest.Less
  ctest --test-dir build -E wpiutil --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
