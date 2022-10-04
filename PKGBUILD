# U-Boot: FriendlyARM NanoPi R4S
# Maintainer: Paul Cho <sovinox9 at gmail dot com>

buildarch=8

pkgname=uboot-nanopi-r4s
pkgver=2022.10
pkgrel=1
pkgdesc="U-Boot for FriendlyARM NanoPi R4S"
arch=('aarch64')
url='http://www.denx.de/wiki/U-Boot/WebHome'
license=('GPL')
backup=('boot/boot.txt' 'boot/boot.scr')
makedepends=('arm-none-eabi-gcc' 'python' 'python-setuptools' 'dtc' 'swig')
install=${pkgname}.install
atfver=2.7
source=("ftp://ftp.denx.de/pub/u-boot/u-boot-${pkgver}.tar.bz2"
        "https://github.com/ARM-software/arm-trusted-firmware/archive/v${atfver}.tar.gz"
        'boot.txt'
        'mkscr')
sha256sums=('50b4482a505bc281ba8470c399a3c26e145e29b23500bc35c50debd7fa46bdf8'
            '327c65b1bc231608a7a808b068b00c1a22310e9fc86158813cd10a9711d5725e'
            '085f893239f75243b0f37b34e34d5ba2feb4f2d3af8ffca3ceb2ca8b68bb7c74'
            'a4fc8b6b92bc364d6542670d294aa618a8501fb8729f415cc0a3eed776ef0c8e')

prepare() {
  cd ${srcdir}/arm-trusted-firmware-${atfver}
  make PLAT=rk3399 all

  cd ${srcdir}/u-boot-${pkgver}
  cp ../arm-trusted-firmware-${atfver}/build/rk3399/release/bl31/bl31.elf ./bl31.elf

  cd ${srcdir}/u-boot-${pkgver}/configs
  echo 'CONFIG_IDENT_STRING=" Arch Linux ARM"' >> nanopi-r4s-rk3399_defconfig

}

build() {
  cd ${srcdir}/u-boot-${pkgver}

  unset CFLAGS CXXFLAGS CPPFLAGS LDFLAGS

  make nanopi-r4s-rk3399_defconfig
  make EXTRAVERSION=-${pkgrel}
  make EXTRAVERSION=-${pkgrel} u-boot.itb
}

package() {
  cd u-boot-${pkgver}

  mkdir -p "${pkgdir}/boot"

  tools/mkimage -n rk3399 -T rksd -d ./tpl/u-boot-tpl.bin "${pkgdir}/boot/rksd_loader.img"
  cat ./spl/u-boot-spl.bin >> "${pkgdir}/boot/rksd_loader.img"

  cp ./u-boot.itb "${pkgdir}/boot/u-boot.itb"

  tools/mkimage -A arm -O linux -T script -C none -n "U-Boot boot script" -d ../boot.txt "${pkgdir}/boot/boot.scr"
  cp ../{boot.txt,mkscr} "${pkgdir}"/boot
}
