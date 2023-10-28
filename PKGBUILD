# Maintainer: Carson Rueter <swurl at swurl dot x y z>
# Contributor: Tyler Veness <calcmogul at gmail dot com>

pkgname=ntcore
pkgver=2024.1.1b2
_pkgver="v2024.1.1-beta-2"
pkgrel=1
pkgdesc="WPILib's NetworkTables communication library"
arch=('x86_64')
url='https://github.com/wpilibsuite/allwpilib'
depends=('fmt' 'eigen' 'protobuf')
makedepends=('cmake')
license=('BSD' 'MIT')
options=('!strip' 'staticlibs')
source=("git+https://github.com/wpilibsuite/allwpilib#tag=$_pkgver"
        'Don_t-treat-warnings-as-errors.patch')
md5sums=('SKIP'
         '06355c12d930efa26edbbe11f633831a')

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
    -DWITH_NTCORE=ON \
    -DWITH_WPIMATH=OFF \
    -DWITH_WPILIB=OFF \
    -DWITH_TESTS=ON \
    -DWITH_GUI=OFF \
    -DWITH_SIMULATION_MODULES=OFF \
    -Wno-dev
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
