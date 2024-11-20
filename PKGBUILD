# U-Boot: FriendlyElec CM3588 NAS
# Maintainer: Valentin Hăloiu <vially.ichb@gmail.com>

buildarch=8

pkgname=uboot-cm3588-nas
pkgver=2024.10
pkgrel=1
pkgdesc='U-Boot for FriendlyElec CM3588 NAS'
arch=('aarch64')
url='https://docs.u-boot.org/en/latest/'
license=('GPL')
backup=('boot/boot.txt' 'boot/boot.scr')
makedepends=('bc' 'git' 'python' 'python-setuptools' 'python-pyelftools' 'swig' 'dtc' 'uboot-tools')
_trusted_firmware_ver='2.12.0'
install=${pkgname}.install
source=("https://github.com/u-boot/u-boot/archive/refs/tags/v${pkgver}.tar.gz"
        "trusted-firmware-a.tar.gz::https://github.com/TrustedFirmware-A/trusted-firmware-a/archive/refs/tags/v${_trusted_firmware_ver}.tar.gz"
        # Source: https://github.com/armbian/build/blob/cc4513/config/sources/families/include/rockchip64_common.inc#L152
        'rk35_ddr.bin::https://github.com/rockchip-linux/rkbin/raw/7c35e21a8529b3758d1f051d1a5dc62aae934b2b/bin/rk35/rk3588_ddr_lp4_2112MHz_lp5_2400MHz_v1.18.bin'
        'boot.txt'
        'mkscr')
md5sums=('f1ef24a7d9907c0aeedde50938726598'
         '22b488cc61647f556f9b50a8f2db1129'
         '52a7f2091e36b87807ba784e9995ac2c'
         '5612457aece4c5ca8a168f9066e0abdd'
         '021623a04afd29ac3f368977140cfbfd')

prepare() {
  cd ${srcdir}/trusted-firmware-a-${_trusted_firmware_ver}
  make realclean
  make CROSS_COMPILE=aarch64-unknown-linux-gnu- PLAT=rk3588 bl31
}

build() {
  cd ${srcdir}/u-boot-${pkgver}

  unset CLFAGS CXXFLAGS CPPFLAGS LDFLAGS

  UBOOT_MAKE_EXTRA=()
  UBOOT_MAKE_EXTRA+=("EXTRAVERSION=-${pkgrel}")
  UBOOT_MAKE_EXTRA+=("BL31=${srcdir}/trusted-firmware-a-${_trusted_firmware_ver}/build/rk3588/release/bl31/bl31.elf")
  # For some SoCs U-Boot sources lack support to initialize DRAM. In these
  # cases, to get a fully functional image [...] use DDR binary provided by
  # Rockchip rkbin repository as ROCKCHIP_TPL when building U-Boot.
  #
  # Source: https://docs.u-boot.org/en/v2024.10/board/rockchip/rockchip.html#tpl
  UBOOT_MAKE_EXTRA+=("ROCKCHIP_TPL=${srcdir}/rk35_ddr.bin")

  make distclean
  make cm3588-nas-rk3588_defconfig
  echo 'CONFIG_IDENT_STRING=" Arch Linux ARM"' >> .config
  make "${UBOOT_MAKE_EXTRA[@]}"
}

package() {
  cd u-boot-${pkgver}

  mkdir -p "${pkgdir}/boot"

  tools/mkimage -n rk3588 -T rksd -d "${srcdir}/rk35_ddr.bin:./spl/u-boot-spl.bin" "${pkgdir}/boot/idbloader.img"

  cp ./u-boot.itb "${pkgdir}/boot/u-boot.itb"

  tools/mkimage -A arm -O linux -T script -C none -n 'U-Boot boot script' -d ../boot.txt "${pkgdir}/boot/boot.scr"
  cp ../{boot.txt,mkscr} "${pkgdir}"/boot
}
