# Maintainer: 0tkl

pkgname=epanet-git
pkgver=2.2.r1086.7b64012
pkgrel=1
pkgdesc='The Water Distribution System Hydraulic and Water Quality Analysis Toolkit'
arch=(x86_64)
url='https://github.com/OpenWaterAnalytics/EPANET'
license=(MIT)
provides=(epanet)
conflicts=(epanet)
makedepends=(
  cmake
  git
)
checkdepends=(boost)
optdepends=('python: Python wrapper')
source=(
  "$pkgname::git+https://github.com/OpenWaterAnalytics/EPANET.git#branch=dev"
  "0001-add-install-to-CMakeLists.patch"
)
sha256sums=(
  'SKIP'
  '9b76aa629bd84687ba861fb8d21f2b42502d275233b6fb58a14a4f169f81a6a5'
)

pkgver() {
  cd $pkgname
  tag='v2.2'
  printf "%s.r%s.%s" "${tag#v}" "$(git rev-list --count ${tag}..HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $pkgname
  patch -p1 < $srcdir/0001-add-install-to-CMakeLists.patch
}

build() {
  cd $pkgname
  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_TESTS=ON ..
  cmake --build . --config Release
}

check() {
  cd $pkgname/build/tests
  ctest -C Release --output-on-failure
}

package() {
  cd $pkgname
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 src/hash.h "$pkgdir/usr/include/epanet/hash.h"
  install -Dm644 src/types.h "$pkgdir/usr/include/epanet/types.h"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
