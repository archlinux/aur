# Contributor: André Silva <emulatorman@parabola.nu>
# Contributor: Márcio Silva <coadde@parabola.nu>
# Contributor (Parabola): Luke Shumaker <lukeshu@sbcglobal.net>

pkgname=linux-libre-firmware
pkgver=1.1
pkgrel=2
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
sha512sums=('4ef111f86e8a87bab31e02be171e09f47d71884f1737f5329e9dd07e9f799436d8ff2de5aa0b2cfb4bc921ed02bb2b59b9a1ea69176dcef5f902364d8725e75a'
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
