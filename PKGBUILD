# Maintainer: ShinKouyo <i@0x0f.dev>
# Contributor: André Silva <emulatorman@parabola.nu>
# Contributor: Márcio Silva <coadde@parabola.nu>
# Contributor: Luke Shumaker <lukeshu@sbcglobal.net>
# Contributor: Bastian Germann

pkgname=linux-libre-firmware
pkgver=1.5
pkgrel=1
pkgdesc='Firmware files for Linux-libre'
arch=('any')
url='https://jxself.org/firmware'
license=('LicenseRef-WHENCE')
makedepends=(
  arm-none-eabi-gcc
  avr-libc
  cmake
  dfu-util
  gcc-avr
  gperf
  wget
)
options=(
  '!buildflags'
  '!makeflags'
)
provides=('linux-firmware')
conflicts=(
  'linux-firmware'
  'linux-firmware-git'
)
source=(
  "${url}/${pkgname}-${pkgver}.tar.lz"{,.asc}
)
b2sums=(
  '9f8deb2007dac3f613e71b36627c5c2c6f54b48a7330a1efc28cb47234fbbdd4d994010997e2c52f6f94dfd57c141aff7fb982acdf3a2d7b7ff7541cbd4f23ab'
  'SKIP'
)
validpgpkeys=(
  'F611A908FFA165C699584ED49D0DB31B545A3198' # Jason Self <j@jxself.org>
)

prepare() {
  mkdir -p bin
  ln -sf /usr/bin/arm-none-eabi-gcc     bin/arm-linux-gnueabi-gcc
  ln -sf /usr/bin/arm-none-eabi-ld      bin/arm-linux-gnueabi-ld
  ln -sf /usr/bin/arm-none-eabi-objcopy bin/arm-linux-gnueabi-objcopy
  PATH=$PATH:$(pwd)/bin
  export PATH
}

build() {
  cd "${pkgname}-${pkgver}/src" || exit 1
  make
}

package() {
  install -d -m755 "$pkgdir"/usr/lib/firmware
  make -C "${pkgname}-${pkgver}/src" prefix="${pkgdir}/usr/lib/firmware" install
  install -Dm644 "${pkgname}-${pkgver}/src/WHENCE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
