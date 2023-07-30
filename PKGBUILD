# Maintainer: 0tkl

pkgname=epanet-git
pkgver=2.2.r1060.6b8f9c8
pkgrel=2
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
  "$pkgname-01.patch"
)
sha256sums=(
  'SKIP'
  '34fb0657e0872955d75ac95e143d4af795d2e3fce6ea4ef9034e1c1b18bbb91a'
)

pkgver() {
  cd $pkgname
  tag='v2.2'
  printf "%s.r%s.%s" "${tag#v}" "$(git rev-list --count ${tag}..HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $pkgname
  git apply $srcdir/$pkgname-01.patch
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
