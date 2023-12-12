# Maintainer: Tyler Veness <calcmogul at gmail dot com>

pkgname=wpimath-git
pkgver=2024.1.1.beta.4.r20.gd1793f077d
pkgrel=1
pkgdesc="WPILib's mathematics and controls library"
arch=('x86_64')
url='https://github.com/wpilibsuite/allwpilib'
depends=('fmt' 'eigen' 'protobuf')
makedepends=('cmake')
provides=('wpimath')
conflicts=('wpimath')
license=('BSD' 'MIT')
options=('!strip' 'staticlibs')
source=('git+https://github.com/wpilibsuite/allwpilib')
md5sums=('SKIP')

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
    -DNO_WERROR=ON \
    -Wno-dev
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
