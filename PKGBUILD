# Maintainer: Tyler Veness <calcmogul at gmail dot com>

pkgname=wpimath-git
pkgver=2027.0.0.alpha.6.r307.gb69b4bbb2f
pkgrel=1
pkgdesc="WPILib's mathematics and controls library"
arch=('x86_64')
url='https://github.com/wpilibsuite/allwpilib'
depends=('eigen' 'protobuf' 'sleipnirgroup-sleipnir')
makedepends=('cmake')
provides=('wpimath')
conflicts=('wpimath')
license=('BSD' 'MIT')
options=('!strip' 'staticlibs')
source=('git+https://github.com/wpilibsuite/allwpilib')
sha256sums=('SKIP')

pkgver() {
  cd allwpilib
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cmake -B build -S "allwpilib" \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DWPILIB_NO_WERROR=ON \
    -DWPILIB_USE_SYSTEM_EIGEN=ON \
    -DWPILIB_USE_SYSTEM_SLEIPNIR=ON \
    -DWPILIB_WITH_BENCHMARK=OFF \
    -DWPILIB_WITH_CSCORE=OFF \
    -DWPILIB_WITH_EXAMPLES=OFF \
    -DWPILIB_WITH_GUI=OFF \
    -DWPILIB_WITH_NTCORE=OFF \
    -DWPILIB_WITH_SIMULATION_MODULES=OFF \
    -DWPILIB_WITH_TESTS=ON \
    -DWPILIB_WITH_WPICAL=OFF \
    -DWPILIB_WITH_WPILIB=OFF \
    -DWPILIB_WITH_WPIMATH=ON \
    -Wno-dev
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
