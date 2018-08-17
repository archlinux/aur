# Contributor: André Silva <emulatorman@parabola.nu>
# Contributor: Márcio Silva <coadde@parabola.nu>
# Contributor (Parabola): Luke Shumaker <lukeshu@sbcglobal.net>

pkgname=linux-libre-firmware
pkgver=1.3
pkgrel=1
pkgdesc='Firmware files for Linux-libre'
arch=('any')
url='https://jxself.org/firmware'
license=('GPL2')
makedepends=('arm-none-eabi-gcc')
options=('!buildflags')
provides=('linux-firmware')
conflicts=('linux-firmware'
           'linux-firmware-git')
source=("https://jxself.org/firmware/${pkgname}-${pkgver}.tar.lz"
        "https://jxself.org/firmware/${pkgname}-${pkgver}.tar.lz.asc")
sha512sums=('d3ead6924e686d0212c5993386fdf7ed1d2f68cb899517510ef488b2006a7bb9c1a8e511d23622e0342bdc70410c90291aad60adb2ac5db20c00b40a11508700'
            'SKIP')
validpgpkeys=('F611A908FFA165C699584ED49D0DB31B545A3198')

prepare() {
  # ln the arm-none-eabi- prefixed tools for av7110
  mkdir -p bin
  ln -sf /usr/bin/arm-none-eabi-gcc     bin/arm-linux-gnueabi-gcc
  ln -sf /usr/bin/arm-none-eabi-ld      bin/arm-linux-gnueabi-ld
  ln -sf /usr/bin/arm-none-eabi-objcopy bin/arm-linux-gnueabi-objcopy
  export PATH=$PATH:$(pwd)/bin
}

build() {
  cd "${pkgname}-${pkgver}/src"
  make
}

package() {
  cd "${pkgname}-${pkgver}/src"
  install -d -m755 "$pkgdir"/usr/lib/firmware
  make prefix="${pkgdir}/usr/lib/firmware" install
  install -Dm644 WHENCE "${pkgdir}/usr/share/licenses/${pkgname}"
}
