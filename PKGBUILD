
# Maintainer: j-stach (https://github.com/j-stach)

pkgname=picotool-git
pkgver=r224.282a3ca
pkgrel=1
pkgdesc="Tool for working with RP2040/RP2350 binaries, and interacting with RP2040/RP2350 devices when they are in BOOTSEL mode."
arch=('x86_64')
url="https://github.com/raspberrypi/picotool"
license=('BSD-3-Clause')
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
    printf \
      "r%s.%s" \
      "$(git rev-list --count HEAD)" \
      "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/picotool"

  cmake \
        -B build \
        -S . \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DPICO_SDK_PATH="$srcdir/pico-sdk"

  cmake --build build --parallel
}

package() {
  cd "$srcdir/picotool"

  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE.TXT"

  install -Dm644 udev/60-picotool.rules \
    "$pkgdir/usr/lib/udev/rules.d/60-picotool.rules"
}

