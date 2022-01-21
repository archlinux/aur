# U-Boot: ODROID XU3

buildarch=4

pkgname=uboot-odroid-xu3-mainline
pkgver=2022.01
pkgrel=1
pkgdesc="U-Boot for ODROID-XU3"
arch=('armv7h')
url='http://www.denx.de/wiki/U-Boot/WebHome'
license=('GPL')
install=$pkgname.install
backup=('boot/boot.txt' 'boot/boot.scr')
makedepends=('bc' 'dtc' 'git')
_commit=f98cc910aa9983d9815b58b4fbc5464c4feb7466
source=("https://github.com/u-boot/u-boot/archive/refs/tags/v${pkgver}.zip"
        "bl1.bin::https://raw.githubusercontent.com/hardkernel/u-boot/${_commit}/sd_fuse/bl1.bin.hardkernel"
        'http://archlinuxarm.org/builder/src/xu3/bl2.bin'
        "tzsw.bin::https://raw.githubusercontent.com/hardkernel/u-boot/${_commit}/sd_fuse/tzsw.bin.hardkernel"
        'sd_fusing.sh'
        'boot.txt'
        'mkscr'
        'odroid-xu3_defconfig')
md5sums=('deb34f88b95a76c9fe38cb0cfc952476'
         '3908379f82f972ece88ca1b5a280b5fd'
         '09c42bed980921cfc914e97e067ba9a3'
         'fd01dda20b999e0b731c7063431a42b3'
         'b184e4b4b23627ef4eb58ba314bce47c'
         '3eecdf88a0565908908d661404cc636f'
         '021623a04afd29ac3f368977140cfbfd'
         'a26849b577f6b16c16c881cd2b2da18c')

conflicts=('uboot-odroid-xu3')

build() {
  cp -f odroid-xu3_defconfig "${srcdir}/u-boot-${pkgver}/configs"

  cd ${srcdir}

  cd "u-boot-${pkgver}"

  unset CFLAGS CXXFLAGS CPPFLAGS

  make distclean
  make odroid-xu3_config
  make EXTRAVERSION=-${pkgrel}
}

package() {
  cd "u-boot-${pkgver}"
  echo `pwd`
  mkdir -p "${pkgdir}"/boot

  cp u-boot-dtb.bin ${pkgdir}/boot/u-boot.bin
  cp ../{{bl{1,2},tzsw}.bin,sd_fusing.sh} "${pkgdir}"/boot
  chmod +x "${pkgdir}"/boot/sd_fusing.sh

  tools/mkimage -A arm -O linux -T script -C none -n "U-Boot boot script" -d ../boot.txt "${pkgdir}"/boot/boot.scr
  cp ../{boot.txt,mkscr} "${pkgdir}"/boot
}
