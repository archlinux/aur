# U-Boot: TQC A01
# Maintainer: Yjun <jerrysteve1101@gmail.com>

# Patches: https://github.com/Izumiko/uboot-tqc-a01/tree/master/patches

pkgname=uboot-tqc-a01
pkgver=2023.07.02
pkgrel=1
_atf_version=2.8.8
_crust_version=0.5
pkgdesc="U-Boot for TQC A01"
arch=('aarch64')
url='http://www.denx.de/wiki/U-Boot/WebHome'
license=('GPL')
makedepends=('dtc' 'bc' 'git' 'or1k-elf-gcc' 'swig' 'python-setuptools')
provides=('uboot')
conflicts=('uboot')
install="${pkgname}.install"
source=("ftp://ftp.denx.de/pub/u-boot/u-boot-${pkgver/rc/-rc}.tar.bz2"
	"0001-allwinner-boot-splash.patch::https://raw.githubusercontent.com/Izumiko/uboot-tqc-a01/master/patches/u-boot/allwinner-boot-splash.patch"
	"0002-allwinner-enable-autoboot-keyed.patch::https://raw.githubusercontent.com/Izumiko/uboot-tqc-a01/master/patches/u-boot/allwinner-enable-autoboot-keyed.patch"
	"0003-allwinner-fdt-setprop-fix-unaligned-access.patch::https://raw.githubusercontent.com/Izumiko/uboot-tqc-a01/master/patches/u-boot/allwinner-fdt-setprop-fix-unaligned-access.patch"
	"0004-add-tqc-a01.patch::https://raw.githubusercontent.com/Izumiko/uboot-tqc-a01/master/patches/u-boot/add-tqc-a01.patch"
	"atf-${_atf_version}.tar.gz::https://github.com/ARM-software/arm-trusted-firmware/archive/refs/tags/lts-v${_atf_version}.tar.gz"
	"0001-sunxi-Don-t-enable-referenced-regulators.patch::https://raw.githubusercontent.com/Izumiko/uboot-tqc-a01/master/patches/atf/0001-sunxi-Don-t-enable-referenced-regulators.patch"
	"0002-rwx-permissions.patch::https://raw.githubusercontent.com/Izumiko/uboot-tqc-a01/master/patches/atf/rwx-permissions.patch"
	"crust-${_crust_version}.tar.gz::https://github.com/crust-firmware/crust/archive/refs/tags/v0.5.tar.gz"
	"0001-crust-rwx-permissions.patch"
	)
md5sums=('001a0c1ffedd9a6e8d7af915d4d68b02'
         '74a3b6ec1d8a649b08a9c842dfdd5a36'
         'a62274449b2da12de3ec39edc4b4db5a'
         '7270774843259e6ed840533fa777edc6'
         'dec220bb164f19ba8b62f34d6f62cd8c'
         'e4c86abc861de434c8b3b4f993348504'
         'dcbcd460923a7a624a124c6c283d7249'
         'eb6f40ebb33ba002c8ef7ca1f03c3793'
         '5702ac6bb30a194434f82099bb244d50'
         '955e550428d38787e3c9900703aaca55')

prepare() {
  echo "Patching Arm Trusted Firmware"
  cd ${srcdir}/arm-trusted-firmware-lts-v${_atf_version}
  patch -p1 -N < ${srcdir}/0001-sunxi-Don-t-enable-referenced-regulators.patch
  patch -p1 -N < ${srcdir}/0002-rwx-permissions.patch

  echo "Patching SCP firmware"
  cd ${srcdir}/crust-${_crust_version}
  patch -p1 -N < ${srcdir}/0001-crust-rwx-permissions.patch

  echo "Patching U-Boot"
  cd ${srcdir}/u-boot-${pkgver/rc/-rc}
  patch -p1 -N < ${srcdir}/0001-allwinner-boot-splash.patch
  patch -p1 -N < ${srcdir}/0002-allwinner-enable-autoboot-keyed.patch
  patch -p1 -N < ${srcdir}/0003-allwinner-fdt-setprop-fix-unaligned-access.patch
  patch -p1 -N < ${srcdir}/0004-add-tqc-a01.patch
}

build() {
  # Avoid build warnings by editing a .config option in place instead of
  # appending an option to .config, if an option is already present
  update_config() {
    if ! grep -q "^$1=$2$" .config; then
      if grep -q "^# $1 is not set$" .config; then
        sed -i -e "s/^# $1 is not set$/$1=$2/g" .config
      elif grep -q "^$1=" .config; then
        sed -i -e "s/^$1=.*/$1=$2/g" .config
      else
        echo "$1=$2" >> .config
      fi
    fi
  }

  unset CFLAGS CXXFLAGS CPPFLAGS LDFLAGS

  echo "Building Arm Trusted Firmware"
  cd ${srcdir}/arm-trusted-firmware-lts-v${_atf_version}
  make PLAT=sun50i_h6 DEBUG=0 bl31
  export BL31=${PWD}/build/sun50i_h6/release/bl31.bin

  echo "Building SCP firmware"
  cd ${srcdir}/crust-${_crust_version}
  sed -i '0,/lex/s//flex/' Makefile
  CROSS_COMPILE=or1k-elf- make orangepi_3_defconfig
  CROSS_COMPILE=or1k-elf- make scp
  export SCP=${PWD}/build/scp/scp.bin

  echo "Building U-Boot"
  cd ${srcdir}/u-boot-${pkgver/rc/-rc}

  make distclean
  make tqc_a01_defconfig
  echo 'CONFIG_IDENT_STRING=" Arch Linux ARM"' >> .config
  update_config 'CONFIG_IDENT_STRING' '"Arch Linux ARM"'

  make EXTRAVERSION=-${pkgrel}
}

package() {
  cd u-boot-${pkgver/rc/-rc}

  mkdir -p "${pkgdir}"/boot/extlinux

  install -Dm644 u-boot-sunxi-with-spl.bin ${pkgdir}/boot/${pkgname}.img
}
