# Maintainer: Eric Woudstra ericwouds AT gmail DOT com
 
_gitname="arm-trusted-firmware"
_gitroot=https://github.com/ericwoud/${_gitname}
#_gitroot=https://github.com/mtk-openwrt/${_gitname}
_gitbranch="bpir"
#_gitbranch="master"
#_gitbranch="mtksoc"
pkgname=bpir64-atf-git
epoch=2
pkgver=v2.8r12169.30aa84c97
pkgrel=1
pkgdesc='ATF BPI-R64 & BPI-R3 images including fiptool'
_ubootpkgver=2023.01
url='https://github.com/mtk-openwrt/arm-trusted-firmware.git'
arch=(aarch64)
depends=(linux)
makedepends=(git)
replaces=(bpir64-mkimage)
license=(GPL)
source=("git+${_gitroot}.git#branch=${_gitbranch}"
        "uboot${_ubootpkgver}::https://github.com/u-boot/u-boot/archive/refs/tags/v${_ubootpkgver}.tar.gz"
        '95-atf.hook'
        'bpir-writefip'
        'mtkimage-gpt-expand.patch'
)
sha256sums=(SKIP SKIP SKIP SKIP SKIP)
install=${pkgname}.install
 
pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "v%s.%sr%s.%s" \
      $(grep '^VERSION_MAJOR' Makefile | cut -b 19-) \
      $(grep '^VERSION_MINOR' Makefile | cut -b 19-) \
      "$(git rev-list --count HEAD)" \
      "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_gitname}"
#  git config --global user.email "you@example.com"
#  git config --global user.name "Your Name"
#  rm -rf ${srcdir}/${_gitname}/.git/rebase-apply  
#  echo -n -e "\n\nCOMMIT DATE:"
#  git log -1 --format="%at" | xargs -I{} date -d @{} +%Y/%m/%d-%H:%M:%S
#  echo -e "\n\n"
#  git am --ignore-space-change --ignore-whitespace "${startdir}/"*.patch
}

_buildmkimage() {
  cd "${srcdir}/u-boot-${_ubootpkgver}"
  cp -vf configs/mt7622_rfb_defconfig configs/my_defconfig
  # No libcrypto (openssl)
  echo "CONFIG_TOOLS_LIBCRYPTO=n" | tee -a configs/my_defconfig
  # kwbimage needs libcrypto, so remove it from build
  sed -i '/kwbimage.o \\/d' ./tools/Makefile
  # reduce objects being build, as they are not linked anyway
  sed -i 's/FIT_OBJS-y :=.*/FIT_OBJS-y := fit_common.o boot\/image-fit.o/' ./tools/Makefile
  ARCH=arm64 make clean
  ARCH=arm64 make my_defconfig
  ARCH=arm64 make tools-only
  mv -vf tools/mkimage nostretch-mkimage
  patch -p1 -N -r - < "${srcdir}/mtkimage-gpt-expand.patch"
  ARCH=arm64 make tools-only
  mv -vf tools/mkimage stretch-mkimage
}

_buildfiptool() {
  cd "${srcdir}/${_gitname}/tools/fiptool"
  sed -i '/-Werror/d' ./Makefile
  make HOSTCCFLAGS+="-D'SHA256(x,y,z)=nop'" LDLIBS=""
}

_buildimage() {
  _plat=$1; _bpir=$2; _atfdev=$3; _stretch=$4; _rest="${@:5}"
  cd "${srcdir}/${_gitname}"
  rm -f build/${_plat}/release/${_bpir}-atf-${_atfdev}-*.bin
  sed -i 's/.*entry = get_partition_entry.*fip.*/\tentry = get_partition_entry("'${_bpir}'-'${_atfdev}'-fip");/' \
         plat/mediatek/${_plat}/bl2_boot_mmc.c
  sed -i 's/.*entry = get_partition_entry.*boot.*/\tentry = get_partition_entry("'${_bpir}'-'${_atfdev}'-boot");/' \
         plat/mediatek/${_plat}/bl2_boot_mmc.c
  touch plat/mediatek/${_plat}/platform.mk
  unset CXXFLAGS CPPFLAGS LDFLAGS
  export CFLAGS=-Wno-error
  make PLAT=${_plat} BOOT_DEVICE=$_atfdev LOG_LEVEL=40 USE_MKIMAGE=1 \
       MKIMAGE="${srcdir}/u-boot-${_ubootpkgver}/${_stretch}-mkimage" ${_rest} all # MTK_BL33_IS_64BIT=1 
  if [[ "${_stretch}" == "stretch" ]]; then
    dd of=build/${_plat}/release/${_bpir}-atf-${_atfdev}-header.bin bs=1 count=440 if=build/${_plat}/release/bl2.img
    dd of=build/${_plat}/release/${_bpir}-atf-${_atfdev}-atf.bin          skip=34  if=build/${_plat}/release/bl2.img
  else
    dd of=build/${_plat}/release/${_bpir}-atf-${_atfdev}-atf.bin                   if=build/${_plat}/release/bl2.img
  fi
#  BL31 will be inside BL2, so no need for it. If bl31 is present separately, it will be loaded from fip (not from bl2).
# dd   of=build/${_plat}/release/${_bpir}-atf-${_atfdev}-bl31.bin                  if=build/${_plat}/release/bl31.bin
}

_installimage() {
  _plat=$1; _bpir=$2
  cd "${srcdir}/${_gitname}/build/${_plat}/release"
  install -vDt "$pkgdir/boot" -m644 ${_bpir}-atf-*.bin
}

build() {
  if [ ! -f "${srcdir}/u-boot-${_ubootpkgver}/nostretch-mkimage"  ] || \
     [ ! -f "${srcdir}/u-boot-${_ubootpkgver}/stretch-mkimage" ]; then _buildmkimage
  fi
  _buildfiptool
  _buildimage mt7622 bpir64 sdmmc stretch   DDR3_FLYBY=1 DEVICE_HEADER_OFFSET=0
  _buildimage mt7622 bpir64 emmc  stretch   DDR3_FLYBY=1 DEVICE_HEADER_OFFSET=0
  _buildimage mt7986 bpir3  sdmmc nostretch DRAM_USE_DDR4=1
  _buildimage mt7986 bpir3  emmc  nostretch DRAM_USE_DDR4=1 BROM_HEADER_TYPE=sdmmc
}
 
package() {
  cd "${srcdir}"
  install -m755 -vDt "$pkgdir/usr/bin" bpir-writefip
  install -Dt "${pkgdir}/usr/share/libalpm/hooks/" -m644 95-atf.hook
  cd "${srcdir}/${_gitname}/tools/fiptool"
  install -m755 -vDt "$pkgdir/usr/bin" fiptool
  _installimage mt7622 bpir64
  _installimage mt7986 bpir3
}
