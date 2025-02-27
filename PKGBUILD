# Maintainer: Maxwell Pray <synthead@gmail.com>
# Contributor: Darrell Enns <darrell at darrellenns dot com>
# Contributor: qubidt <qubidt at gmail dot com>
# Contributor: loredan13
# Contributor: lf <packages at lfcode dot ca>

pkgname=kalico-git
_pkgname=kalico
pkgver=r5728.aa4cc805
pkgrel=3
pkgdesc="Klipper, but Limitless"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://kalico.gg"
license=('GPL3')
depends=(
  'python-cffi'
  'python-pyserial'
  'python-greenlet'
  'python-jinja'
  'python-can'
  'libusb'
)
optdepends=(
  'avr-binutils: for AVR MCU firmware compilation'
  'avr-gcc: for AVR MCU firmware compilation'
  'avr-libc: for AVR MCU firmware compilation'
  'avrdude: for flashing firmware on AVR MCU'
  'dfu-util: for flashing firmware on STM32 MCUs'
  'ncurses: for choosing compilation config'
  'python-matplotlib: for resonance measurement'
  'python-numpy: for resonance measurement'
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
  'da748b73f3e3a0647df2c242f87cc1e3'
  '18074e35a16bf065d12ca10f7b0d5f3c'
  '1e86632f0b6b3a0d83936c69ee15bd72'
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

  mkdir -p "$pkgdir/usr/lib/$_pkgname"
  cp -r Makefile docs config klippy scripts lib src "$pkgdir/usr/lib/$_pkgname"

  python scripts/make_version.py archlinux > "$pkgdir/usr/lib/$_pkgname/klippy/.version"

  install -Dm 644 "$srcdir/kalico.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
  install -Dm 644 "$srcdir/sysusers.d-kalico.conf" "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
  install -Dm 644 "$srcdir/tmpfiles.d-kalico.conf" "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
}
