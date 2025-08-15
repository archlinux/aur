# Maintainer: Maxwell Pray <synthead@gmail.com>
# Contributor: Darrell Enns <darrell at darrellenns dot com>
# Contributor: qubidt <qubidt at gmail dot com>
# Contributor: loredan13
# Contributor: lf <packages at lfcode dot ca>

pkgname=kalico-git
_pkgname=kalico
pkgver=r5822.91fd6480
pkgrel=1
pkgdesc="Klipper, but Limitless"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://kalico.gg"
license=('GPL3')
depends=('python' 'libusb')
optdepends=(
  'avr-binutils: for AVR MCU firmware compilation'
  'avr-gcc: for AVR MCU firmware compilation'
  'avr-libc: for AVR MCU firmware compilation'
  'avrdude: for flashing firmware on AVR MCU'
  'dfu-util: for flashing firmware on STM32 MCUs'
  'ncurses: for choosing compilation config'
  'stm32flash: for flashing firmware on STM MCU'
)
optdepends_x86_64=(
  'arm-none-eabi-binutils: for ARM MCU firmware compilation'
  'arm-none-eabi-gcc: for ARM MCU firmware compilation'
  'arm-none-eabi-newlib: for ARM MCU firmware compilation'
)
makedepends=('git')
provides=('kalico')
conflicts=('kalico')
source=(
  "$_pkgname::git+https://github.com/KalicoCrew/kalico"
  'kalico.service'
  'sysusers.d-kalico.conf'
  'tmpfiles.d-kalico.conf'
)
md5sums=(
  'SKIP'
  '92bebe556e304bc6be82109fe873569c'
  '18074e35a16bf065d12ca10f7b0d5f3c'
  '7a00293052c04fba501441380c6bb817'
)

pkgver() {
  cd "$srcdir/$_pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"

  python -m compileall klippy
  python klippy/chelper/__init__.py
}

package() {
  cd "$srcdir/$_pkgname"

  mkdir -p "$pkgdir/usr/share/$_pkgname"
  cp -r Makefile docs config klippy scripts lib src "$pkgdir/usr/share/$_pkgname"

  python scripts/make_version.py archlinux > "$pkgdir/usr/share/$_pkgname/klippy/.version"

  install -Dm 644 "$srcdir/kalico.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
  install -Dm 644 "$srcdir/sysusers.d-kalico.conf" "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
  install -Dm 644 "$srcdir/tmpfiles.d-kalico.conf" "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
}
