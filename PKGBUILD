# Maintainer: 0tkl

pkgname=epanet
pkgver=2.2
pkgrel=5
pkgdesc='The Water Distribution System Hydraulic and Water Quality Analysis Toolkit'
arch=(x86_64)
url='https://github.com/OpenWaterAnalytics/EPANET'
license=(MIT)
makedepends=(cmake)
checkdepends=(boost)
optdepends=('python: Python wrapper')
source=(
  "$pkgname-v$pkgver.zip::https://github.com/OpenWaterAnalytics/EPANET/archive/refs/tags/v$pkgver.zip"
  "0001-add-install-to-CMakeLists.patch"
)
sha256sums=(
  '696da02aa393853de901ecc841ce1e2c108a1665ae777c8129b442cd9eef6aaf'
  '9b76aa629bd84687ba861fb8d21f2b42502d275233b6fb58a14a4f169f81a6a5'
)

prepare() {
  cd EPANET-$pkgver
  patch -p1 < $srcdir/0001-add-install-to-CMakeLists.patch
}

build() {
  cd EPANET-$pkgver
  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_TESTS=ON ..
  cmake --build . --config Release
}

check() {
  cd EPANET-$pkgver/build/tests
  ctest -C Release --output-on-failure
}

package() {
  cd EPANET-$pkgver
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 src/hash.h "$pkgdir/usr/include/epanet/hash.h"
  install -Dm644 src/types.h "$pkgdir/usr/include/epanet/types.h"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
