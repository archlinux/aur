# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=xadi
pkgver=0.4.1
pkgrel=1
pkgdesc="CoreADI wrapper based on libprovision "
arch=('x86_64')
url="https://github.com/xtool-org/xadi"
license=('LGPL-2.1-only')
depends=()
makedepends=(
  'dub'
  'ldc'
  'git'
  'swift-bin'
)
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/xtool-org/xadi/archive/refs/tags/source-${pkgver}.tar.gz"
)
b2sums=('9d1e7366d8fef7b80cdeb2c5153b2c67858b5488924fb7acaadb24f6f76afe8494f233e6fda305e748475c773e401cb3a04b9c3ad672b4eda62484e644e337e8')

build() {
  cd "$pkgname-source-$pkgver"
  ./Linux/build.sh

  local swift_bin_dir=/usr/lib/swift/bin
  export PATH="$swift_bin_dir:$PATH"
  export SWIFT_EXEC="$swift_bin_dir/swiftc"
  export SWIFT_DRIVER_SWIFT_EXEC="$swift_bin_dir/swiftc"
  swift build -c release --product XADI
}

package() {
  cd "$pkgname-source-$pkgver"

  install -Dm644 "bin/libxadibase.a" "$pkgdir/usr/lib/libxadibase.a"
  install -Dm755 ".build/release/libXADI.so" "$pkgdir/usr/lib/libXADI.so"
  install -Dm644 "Sources/XADI/include/XADI.h" "$pkgdir/usr/include/XADI.h"

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
