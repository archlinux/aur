# U-Boot: RockPro64 using upstream TF-A (no rockchip blobs)
# Maintainer: Craig S <fast.code.studio at gmail dot com>

# Based on PKGBUILD for uboot-rock64 and the Manjaro uboot-rockpro64
# from here: https://gitlab.manjaro.org/manjaro-arm/packages/core/uboot-rockpro64
# and PKGBUILD from Matyas Mehn <matyas.mehn@tum.de> here: https://github.com/matyas1995/u-boot-PKGBUILD
# Modified to use U-boot 2023.04, which includes working support for SATA boot on the RockPro64.
# This PKGBUILD also includes optional support for underclocking the RAM on the RockPro64. Uncomment
# the 'patch' line in the 'prepare' block below to enable this patch.
# This can help with stability issues.

# More frequencies can be added. See the 'rk3399_ddr_set_clk' function in 'src/u-boot-2023.04/drivers/clk/rockchip/clk_rk3399.c' for details (after you run 'makepkg --nobuild).
# There is a comment at the top of the function that explains what the numbers mean.
# After adding support for a new frequency, setup u-boot to use it in the 'srv/u-boot-2023.04/drivers/ram/rockchip/sdram-rk3399-lpddr4-800.inc' file.


buildarch=8

pkgname=uboot-rockpro64-foss
pkgver=2023.04
pkgrel=1
_tfaver="lts-v2.8.6"
pkgdesc="Blobless U-Boot for RockPro64"
arch=('aarch64')
url='http://www.denx.de/wiki/U-Boot/WebHome'
license=('GPL')
backup=('boot/boot.txt' 'boot/boot.scr')
# python-pyelftools required for u-boot 2023.04
makedepends=('bc' 'git' 'arm-none-eabi-gcc' 'arm-none-eabi-newlib' 'python-setuptools' 'swig' 'dtc' 'python-pyelftools')
optdepends=('mtd-utils')
provides=('uboot')
conflicts=('uboot')
options=(!buildflags
         !makeflags
         !debug)
install=${pkgname}.install
source=("https://ftp.denx.de/pub/u-boot/u-boot-${pkgver/rc/-rc}.tar.bz2"
        "https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/snapshot/trusted-firmware-a-${_tfaver}.tar.gz"
        'boot.txt'
        'mkscr'
	'752MHz-ram-clock.patch')
sha256sums=('e31cac91545ff41b71cec5d8c22afd695645cd6e2a442ccdacacd60534069341'
            '7043922f8b06c736e11cbda24ee3b123a756b13de260f79cddf4dd1deb2f6221'
            'dface8873b26c7425660749e190abbac678476addba6e539e9faac16183fba17'
            'a4fc8b6b92bc364d6542670d294aa618a8501fb8729f415cc0a3eed776ef0c8e'
            '8ed0112e35392454655b1c45e2866b85c79a948175cfaaed38ef47eefc436287')

prepare(){
  cd u-boot-${pkgver/rc/-rc}
  # To apply the RAM underclock patch, uncomment the line below.
  # This will run the RAM at 752MHz, which might fix your system if you are experiencing stability issues.
  #patch --forward --strip=1 --input="${srcdir}/752MHz-ram-clock.patch"
}

build() {
  cd u-boot-${pkgver/rc/-rc}
  make distclean
  cd ../

  cd trusted-firmware-a-${_tfaver}
  make distclean
  make -j6 PLAT=rk3399 bl31

  cd ../

  # u-boot now looks for a file named atf-bl31 instead of just bl31
  #cp trusted-firmware-a-${_tfaver}/build/rk3399/release/bl31/bl31.elf u-boot-${pkgver/rc/-rc}/
  cp trusted-firmware-a-${_tfaver}/build/rk3399/release/bl31/bl31.elf u-boot-${pkgver/rc/-rc}/atf-bl31

  cd u-boot-${pkgver/rc/-rc}

  make rockpro64-rk3399_defconfig
  echo 'CONFIG_IDENT_STRING=" Arch Linux ARM"' >> .config

  # Enable support for device tree overlay files.
  echo 'CONFIG_OF_LIBFDT_OVERLAY=y' >> .config

  # Enable SATA support (specifically the 'sata' command in the u-boot command line).
  echo 'CONFIG_CMD_SATA=y' >> .config

  # Enable ZFS support - this seems to only support very old version of ZFS. Hence, it is best to leave it disabled.
  # echo 'CONFIG_CMD_ZFS=y' >> .config

  # Enable booting from SATA devices
  echo 'CONFIG_SATA_BOOT=y' >> .config

  make -j6 EXTRAVERSION=-${pkgrel}
}

package() {
  cd u-boot-${pkgver/rc/-rc}

  mkdir -p "${pkgdir}/boot"
  mkdir -p "${pkgdir}/usr/share/uboot"

  # Copy over the u-boot files needed for installing to EMMC or micro SD card.
  cp u-boot.itb idbloader.img "${pkgdir}/usr/share/uboot"

  # Copy over the u-boot files needed for SPI installation
  cp tpl/u-boot-tpl.bin spl/u-boot-spl.bin "${pkgdir}/usr/share/uboot"

  # Build the u-boot image needed for SPI installation (spi_combined.img).
  tools/mkimage -n rk3399 -T rkspi -d tpl/u-boot-tpl.bin:spl/u-boot-spl.bin "${pkgdir}/usr/share/uboot/idbloader-spi.img"
  dd if="${pkgdir}/usr/share/uboot/idbloader-spi.img" of=spi_combined.img seek=0
  dd if="${pkgdir}/usr/share/uboot/u-boot.itb" of=spi_combined.img seek=768
  # Move the SPI image to its final destination.
  mv spi_combined.img "${pkgdir}/usr/share/uboot/spi_combined.img"

  # Build the default u-boot boot script.
  tools/mkimage -A arm -O linux -T script -C none -n "U-Boot boot script" -d ../boot.txt "${pkgdir}/boot/boot.scr"
  cp ../{boot.txt,mkscr} "${pkgdir}"/boot
}
