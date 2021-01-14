# U-Boot: Raspberry Pi 4
# Maintainer: Greyson Christoforo <first name at last name dot net>

buildarch=8

pkgname=uboot-raspberrypi4-rc
pkgver=2021.01
pkgrel=1
pkgdesc="U-Boot for Raspberry Pi 4"
arch=(aarch64)
url='http://www.denx.de/wiki/U-Boot/WebHome'
license=(LGPL MIT BSD GPL2 custom)
backup=('boot/boot.txt' 'boot/boot.scr' 'boot/config.txt')
makedepends=(bc dtc git)
depends=(linux-aarch64)
optdepends=(uboot-tools-rc)
options=('!strip' '!makeflags' !buildflags 'staticlibs')
source=("${pkgname}-${pkgver}.tar.bz2::ftp://ftp.denx.de/pub/u-boot/u-boot-${pkgver/rc/-rc}.tar.bz2"
        'boot.txt'
        'mkscr')
sha256sums=('b407e1510a74e863b8b5cb42a24625344f0e0c2fc7582d8c866bd899367d0454'
            '4ae414a388383046f28ebd249a2c74045b4f2e14131cada9e9ce0c4f341f63f1'
            '6fa9a67367836fc9e96670881ea3fc8eede828f2182cd9bf08366bfcb1bfa0cb')

prepare() {
  cd u-boot-${pkgver/rc/-rc}

}

build() {
  cd u-boot-${pkgver/rc/-rc}

  unset CFLAGS
  unset CXXFLAGS
  unset CPPFLAGS

  make distclean
  make rpi_4_config
  echo 'CONFIG_IDENT_STRING=" Arch Linux ARM"' >> .config
  make EXTRAVERSION=-${pkgrel}
}

package() {
  cd u-boot-${pkgver/rc/-rc}

  mkdir -p "${pkgdir}"/boot
  
  cp u-boot.bin ${pkgdir}/boot/.
  echo "enable_uart=1" > ${pkgdir}/boot/config.txt
  echo "arm_64bit=1" >> ${pkgdir}/boot/config.txt
  echo "kernel=u-boot.bin" >> ${pkgdir}/boot/config.txt

  tools/mkimage -A arm64 -O linux -T script -C none -n "U-Boot boot script" -d ../boot.txt "${pkgdir}"/boot/boot.scr
  cp ../{boot.txt,mkscr} "${pkgdir}"/boot
}
