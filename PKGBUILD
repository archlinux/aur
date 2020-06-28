# U-Boot: Raspberry Pi 4
# Maintainer: Greyson Christoforo

buildarch=8

pkgname=uboot-raspberrypi4-rc
pkgver=2020.07rc5
pkgrel=1
pkgdesc="U-Boot for Raspberry Pi 4"
arch=('aarch64')
url='http://www.denx.de/wiki/U-Boot/WebHome'
license=('GPL')
backup=('boot/boot.txt' 'boot/boot.scr' 'boot/config.txt')
makedepends=('bc' 'dtc' 'git')
depends=('linux-aarch64')
optdepends=('uboot-tools-rc')
options=(!strip)
source=("ftp://ftp.denx.de/pub/u-boot/u-boot-${pkgver/rc/-rc}.tar.bz2"
        'boot.txt'
        'mkscr')
md5sums=('3b10951fa62e91433d0045a29a8588b0'
         '364b0d31dfa497efa18ee71676a73145'
         '96d327ad1824134515d3ec25b4ffd7c6')

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
