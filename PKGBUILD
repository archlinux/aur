# Maintainer: Maxwell Pray <synthead@gmail.com>
# Contributor: Darrell Enns <darrell at darrellenns dot com>
# Contributor: qubidt <qubidt at gmail dot com>
# Contributor: loredan13
# Contributor: lf <packages at lfcode dot ca>

pkgname=kalico
pkgver=0.12.0
pkgrel=1
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
conflicts=('kalico-git')
source=(
  "https://github.com/KalicoCrew/kalico/archive/refs/tags/v$pkgver.tar.gz"
  'kalico.service'
  'sysusers.d-kalico.conf'
  'tmpfiles.d-kalico.conf'
)
md5sums=(
  'fb766438d82167feec93f66a20789b67'
  'a6177889f84f362263f7a12ccf57701c'
  '18074e35a16bf065d12ca10f7b0d5f3c'
  'e89b001451e5783ce42f9f641c5be2b4'
)

build() {
  cd "$srcdir/$pkgname-$pkgver"

  python -m compileall klippy
  python klippy/chelper/__init__.py
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/lib/$pkgname"
  cp -r Makefile docs config klippy scripts lib src "$pkgdir/usr/lib/$pkgname"

  python scripts/make_version.py archlinux > "$pkgdir/usr/lib/$pkgname/klippy/.version"

  install -Dm 644 "$srcdir/kalico.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm 644 "$srcdir/sysusers.d-kalico.conf" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm 644 "$srcdir/tmpfiles.d-kalico.conf" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}
