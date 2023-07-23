# Maintainer: Tyler Veness <calcmogul at gmail dot com>

pkgname=wpimath-git
pkgver=2023.4.3.r136.g44acca7c00
pkgrel=1
pkgdesc="WPILib's mathematics and controls library"
arch=('x86_64')
url='https://github.com/wpilibsuite/allwpilib'
depends=('fmt' 'eigen')
makedepends=('cmake')
provides=('wpimath')
conflicts=('wpimath')
license=('BSD' 'MIT')
options=('!strip' 'staticlibs')
source=('git+https://github.com/wpilibsuite/allwpilib'
        'Don_t-treat-warnings-as-errors.patch')
md5sums=('SKIP'
         '06355c12d930efa26edbbe11f633831a')

pkgver() {
  cd allwpilib
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd allwpilib
  patch -p1 < "$srcdir"/Don_t-treat-warnings-as-errors.patch
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
