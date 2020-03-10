# U-Boot: Inverse Path i.MX53 Quick Start Board
# Maintainer: Claudio Chimera <claudio.chimera@gmail.com>

buildarch=4

pkgname=uboot-imx53qsb
pkgver=2020.01
pkgrel=1
pkgdesc="U-Boot for i.MX53 Quick Start Board"
arch=('armv7h')
url="http://git.denx.de/u-boot.git/"
license=('GPL')
makedepends=('git')
install=${pkgname}.install
backup=('boot/boot.txt' 'boot/boot.scr')
source=("ftp://ftp.denx.de/pub/u-boot/u-boot-${pkgver}.tar.bz2"
        '0001-arch-linux-arm-modifications.patch'
        'boot.txt'
        'mkscr')
md5sums=('b6b2e0787b6874e6b57da0a065a84f5a'
         '5451faf0c9c1039d6ab3e66bd47c0ca2'
         '23a08cb6a356d5dc7ddaf124ebb5a5d7'
         '021623a04afd29ac3f368977140cfbfd')

prepare() {
  cd u-boot-${pkgver}

  git apply ../0001-arch-linux-arm-modifications.patch
}

build() {
  cd u-boot-${pkgver}

  unset CFLAGS CXXFLAGS LDFLAGS

  make distclean
  make mx53loco_defconfig
  make
}

package() {
  cd u-boot-${pkgver}

  install -d "${pkgdir}"/boot
  install -Dm644 u-boot.imx "${pkgdir}"/boot

  install -Dm644 ../boot.txt "${pkgdir}"/boot/boot.txt
  tools/mkimage -A arm -O linux -T script -C none -n "U-Boot boot script" -d ../boot.txt "${pkgdir}"/boot/boot.scr
  install -Dm755 ../mkscr "${pkgdir}"/boot/mkscr
}
