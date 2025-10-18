# Maintainer: Kevin MacMartin <prurigro@gmail.com>

_pkgname=rpi-keyboard-fw-update
pkgname=$_pkgname-git
pkgver=20250924.r34.ee4f1cb
pkgrel=1
pkgdesc='The firmware binaries for the (RP2040-powered) keyboards in the Raspberry Pi 500 and 500+, and a script for updating the firmware'
url='https://github.com/raspberrypi/keyboard-firmware'
license=('BSD-3-Clause')
arch=('any')
depends=('bash')
provides=("$_pkgname")
source=('git+https://github.com/raspberrypi/keyboard-firmware')
sha512sums=('SKIP')

pkgver() {
  cd keyboard-firmware
  printf "%s.r%s.%s" "$(git show -s --format=%ci | sed 's/\ .*//g;s/-//g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd keyboard-firmware

  # Script
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"

  # License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Firmware
  cd keyboard
  install -dm755 "$pkgdir/usr/lib/firmware/raspberrypi/keyboard"

  for file in *; do
    if [[ -f "$file" ]]; then
      install -Dm644 "$file" "$pkgdir/usr/lib/firmware/raspberrypi/keyboard/$file"
    fi
  done
}
