# Maintainer: Eric Woudstra <ericwouds AT gmail DOT com>

#mediatek distroboot see: include/configs/mt7623.h
# include/configs/<CONFIG_SYS_CONFIG_NAME>.h
# arch/<CONFIG_SYS_ARCH>/cpu/<CONFIG_SYS_CPU>
# board/<CONFIG_SYS_VENDOR>/<CONFIG_SYS_BOARD>

pkgname=bpir-uboot-git
#_pkgver=2021.10 # last build of u-boot tested for R64
_pkgver=2023.04
pkgver=2023.04r84964.fd4ed6b7e8
pkgrel=1
pkgdesc='U-Boot for BPI Router Boards'
arch=('aarch64' 'x86_64')
url='https://github.com/u-boot/u-boot'
license=(GPL3)
depends=()
makedepends=('git' 'bc')
source=(
  "git+https://github.com/u-boot/u-boot.git#tag=v${_pkgver}"
  'mt7xxx.h'
  'clk-uclass-log_ret.patch'
)
sha256sums=(SKIP SKIP SKIP)
install=${pkgname}.install

export CARCH=aarch64
if [[ "$(uname -m)" != "aarch64" ]]; then
  makedepends+=(aarch64-linux-gnu-gcc)
  export CROSS_COMPILE=aarch64-linux-gnu-
fi

pkgver() {
  cd "${srcdir}/u-boot"
  _year=$(grep '^VERSION = ' Makefile | cut -b 11-)
  _month=$(grep '^PATCHLEVEL = ' Makefile | cut -b 14-)
  printf "%s.%sr%s.%s" "$_year" "$_month" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

_buildimage() {
  _target=$1; _def=$2; _devtree=$3
  echo ^^^ BUILDING $_target ^^^
  cp -vf ./configs/$_def configs/bpir_my_defconfig
  cat <<EOT | tee -a configs/bpir_my_defconfig
CONFIG_AUTOBOOT=y
CONFIG_BOOTDELAY=1
CONFIG_SYS_CONFIG_NAME="mt7xxx"
CONFIG_DEFAULT_DEVICE_TREE="${_devtree}"
CONFIG_DEFAULT_FDT_FILE="${_devtree}"
CONFIG_CMD_EXT4=y
CONFIG_CMD_SETEXPR=y
CONFIG_HUSH_PARSER=y
CONFIG_EFI_PARTITION=y
CONFIG_ENV_IS_IN_MMC=n
CONFIG_DISTRO_DEFAULTS=y
EOT
  unset CFLAGS CXXFLAGS CPPFLAGS LDFLAGS
  ARCH=arm64 make bpir_my_defconfig
#  export KCFLAGS='-Wno-error=address'
  ARCH=arm64 make u-boot.bin
  cp u-boot.bin u-boot-${_target}.bin
}

build() {
  cd "${srcdir}/u-boot"
  rm -f u-boot-bpir*.bin
  patch -p1 -N -r - < "${srcdir}/clk-uclass-log_ret.patch"
  cp -vf "${srcdir}/mt7xxx.h" include/configs/
  _buildimage bpir64 mt7622_rfb_defconfig       mt7622-bananapi-bpi-r64
  _buildimage bpir3  mt7986a_bpir3_sd_defconfig mt7986a-sd-rfb
}

package() {
  cd "${srcdir}/u-boot"
  install -vDt "$pkgdir/boot" -m644 u-boot-bpir*.bin
}
