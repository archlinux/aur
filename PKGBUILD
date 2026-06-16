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
  avr-gcc
  avr-libc
  cmake
  dfu-util
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
  "0001-av7110-Build-Boot.S-with-arm-linux-gnueabi-as-instea.patch"
  "0002-ath9k_htc-bump-CMAKE_MINIMUM_REQUIRED-to-version-3.5.patch"
)
b2sums=(
  '9f8deb2007dac3f613e71b36627c5c2c6f54b48a7330a1efc28cb47234fbbdd4d994010997e2c52f6f94dfd57c141aff7fb982acdf3a2d7b7ff7541cbd4f23ab'
  'SKIP'
  'c7cb7fdd2b7ed83319b829cac149a878f3ff6594a5f5480545b7039880c944c25bd37f5b718afc997b213495f7c45ce63ac75783990b46fe7fc523e2bcbd9e62'
  '9ea6a49cda75386509a64dc753df17e0bfc9d079ad14ddfc42174c0611b4a12c73423fc51035831d1b6088140b53e67fc5ee47127de2fa4901751a58cf662e11'
)
validpgpkeys=(
  'F611A908FFA165C699584ED49D0DB31B545A3198' # Jason Self <j@jxself.org>
)

prepare() {
  # prefixed tools for av7110
  mkdir -p bin
  ln -sf /usr/bin/arm-none-eabi-gcc     bin/arm-linux-gnueabi-gcc
  ln -sf /usr/bin/arm-none-eabi-ld      bin/arm-linux-gnueabi-ld
  ln -sf /usr/bin/arm-none-eabi-objcopy bin/arm-linux-gnueabi-objcopy
  PATH=$PATH:$(pwd)/bin
  export PATH

  cd "$pkgbase-$pkgver/src"

  # patches from parabola
  patch -Np1 -i "$srcdir"/0001-av7110-Build-Boot.S-with-arm-linux-gnueabi-as-instea.patch
  patch -Np1 -i "$srcdir"/0002-ath9k_htc-bump-CMAKE_MINIMUM_REQUIRED-to-version-3.5.patch
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
