# Maintainer: Xiao Xiong <xiongxiao126 {at} gmail {dot} com>
pkgname=astrorama-alexandria
_pkgname=Alexandria
pkgver=2.32.0
pkgrel=1
pkgdesc="SDC-CH common library for the Euclid project"
url="https://github.com/astrorama/Alexandria"
arch=('x86_64')
license=('LGPL-3.0-only')
depends=('astrorama-elements=6.3.4' boost-libs gcc-libs ccfits python)
makedepends=(boost cmake)
checkdepends=(gtest python-numpy)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/astrorama/Alexandria/archive/$pkgver.tar.gz"
  0001-fix_build.patch
)
sha256sums=(
  '74497287b96d370afd59577792e0c45a7b2b4c85babc8d108727746641828efa'
  'd80447c1ec5759e0ceca67e2e224a6d0fcca8b4d6a70c76e6b734015db35d005'
)

prepare() {
  cd $_pkgname-$pkgver

  patch -Np1 -i ../0001-fix_build.patch
}

build() {
  cd "$_pkgname-$pkgver"

  export CMAKE_PROJECT_PATH=/opt/astrorama/lib/cmake/ElementsProject
  export CMAKE_PREFIX_PATH=$CMAKE_PROJECT_PATH

  cmake -B build -DCMAKE_INSTALL_PREFIX=/opt/astrorama -DPYTHON_EXPLICIT_VERSION=3 -DUSE_SPHINX=OFF -Wno-dev
  make -C build
}

check() {
  cd "$_pkgname-$pkgver"

  make -C build test
}

package() {
  cd "$_pkgname-$pkgver"

  make -C build DESTDIR="$pkgdir" install
}
