# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=picotool-git
pkgver=r47.f6fe6b7
pkgrel=1
pkgdesc="Tool for interacting with a RP2040 device in BOOTSEL mode, or with a RP2040 binary"
arch=('x86_64')
url="https://github.com/raspberrypi/picotool"
license=('MIT')
depends=('gcc-libs' 'libusb')
makedepends=('git' 'cmake')
provides=('picotool')
conflicts=('picotool')
source=(
  "git+https://github.com/raspberrypi/picotool.git"
  "git+https://github.com/raspberrypi/pico-sdk.git"
)
sha512sums=(
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "$srcdir/picotool"

  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/picotool"

  mkdir -p build && cd build
  PICO_SDK_PATH="$srcdir/pico-sdk" cmake ..
  make
}

package() {
  cd "$srcdir/picotool"

  install -Dm755 build/picotool "$pkgdir/usr/bin/picotool"
  install -Dm644 clipp/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
