# U-Boot: Raspberry Pi 4
# Maintainer: Greyson Christoforo

buildarch=8

pkgname=uboot-raspberrypi4-rc
#_pkgver="2020.07-rc5"
pkgver=2020.07rc5
pkgrel=1
pkgdesc="U-Boot for Raspberry Pi 4"
arch=('aarch64')
url='http://www.denx.de/wiki/U-Boot/WebHome'
license=('GPL')
backup=('boot/boot.txt' 'boot/boot.scr' 'boot/config.txt')
makedepends=('bc' 'dtc' 'git')
conflicts_armv7h=('linux-raspberrypi')
_commit=f4b58692fef0b9c16bd4564edb980fff73a758b3
source=("ftp://ftp.denx.de/pub/u-boot/u-boot-${pkgver/rc/-rc}.tar.bz2"
        'boot.txt.v2'
        'boot.txt.v3'
        'mkscr')
md5sums=('3b10951fa62e91433d0045a29a8588b0'
         '69e883f0b8d1686b32bdf79684623f06'
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

  cp u-boot.bin ${pkgdir}/boot/kernel8.img
  #cp ../*.dtb ${pkgdir}/boot
  cp ../boot.txt.v3 ../boot.txt
  echo "enable_uart=1" > ${pkgdir}/boot/config.txt

  tools/mkimage -A arm -O linux -T script -C none -n "U-Boot boot script" -d ../boot.txt "${pkgdir}"/boot/boot.scr
  cp ../{boot.txt,mkscr} "${pkgdir}"/boot
}
