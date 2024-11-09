# U-Boot: Radxa Zero 3E/3W
# Maintainer: Valentin Hăloiu <vially.ichb@gmail.com>

buildarch=8

pkgname=uboot-radxa-zero-3
pkgver=2024.10
pkgrel=1
pkgdesc="U-Boot for Radxa Zero 3E/3W"
arch=('aarch64')
url='https://docs.u-boot.org/en/latest/'
license=('GPL')
backup=('boot/boot.txt' 'boot/boot.scr')
makedepends=('bc' 'git' 'python' 'python-setuptools' 'python-pyelftools' 'swig' 'dtc' 'uboot-tools')
install=${pkgname}.install
source=("https://github.com/u-boot/u-boot/archive/refs/tags/v${pkgver}.tar.gz"
        # TODO: Replace with a tagged release once available
        "git+https://github.com/TrustedFirmware-A/trusted-firmware-a.git#commit=9fd9f1d024872b440e3906eded28037330b6f422"
        # Source: https://github.com/radxa-repo/bsp/blob/fa92bfa/u-boot/latest/fork.conf#L119
        'rk3566_ddr.bin::https://github.com/rockchip-linux/rkbin/raw/7c35e21a8529b3758d1f051d1a5dc62aae934b2b/bin/rk35/rk3566_ddr_1056MHz_v1.23.bin'
        'boot.txt'
        'mkscr')
md5sums=('f1ef24a7d9907c0aeedde50938726598'
         '739fe2caea8f905c15b6e9d5b0d65b64'
         '9aef462eee359e8cf7ac1367dfd0f8d8'
         '5612457aece4c5ca8a168f9066e0abdd'
         '021623a04afd29ac3f368977140cfbfd')

prepare() {
  cd ${srcdir}/trusted-firmware-a
  make realclean
  make PLAT=rk3568 all
}

build() {
  cd ${srcdir}/u-boot-${pkgver}

  unset CLFAGS CXXFLAGS CPPFLAGS LDFLAGS

  UBOOT_MAKE_EXTRA=()
  UBOOT_MAKE_EXTRA+=("EXTRAVERSION=-${pkgrel}")
  UBOOT_MAKE_EXTRA+=("BL31=${srcdir}/trusted-firmware-a/build/rk3568/release/bl31/bl31.elf")
  # For some SoCs U-Boot sources lack support to initialize DRAM. In these
  # cases, to get a fully functional image [...] use DDR binary provided by
  # Rockchip rkbin repository as ROCKCHIP_TPL when building U-Boot.
  #
  # Source: https://docs.u-boot.org/en/v2024.10/board/rockchip/rockchip.html#tpl
  UBOOT_MAKE_EXTRA+=("ROCKCHIP_TPL=${srcdir}/rk3566_ddr.bin")

  make distclean
  make radxa-zero-3-rk3566_defconfig
  echo 'CONFIG_IDENT_STRING=" Arch Linux ARM"' >> .config
  make "${UBOOT_MAKE_EXTRA[@]}"
}

package() {
  cd u-boot-${pkgver}

  mkdir -p "${pkgdir}/boot"

  tools/mkimage -n rk3568 -T rksd -d "${srcdir}/rk3566_ddr.bin:./spl/u-boot-spl.bin" "${pkgdir}/boot/idbloader.img"

  cp ./u-boot.itb "${pkgdir}/boot/u-boot.itb"

  tools/mkimage -A arm -O linux -T script -C none -n "U-Boot boot script" -d ../boot.txt "${pkgdir}/boot/boot.scr"
  cp ../{boot.txt,mkscr} "${pkgdir}"/boot
}
