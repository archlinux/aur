# Maintainer: Eric Woudstra ericwouds AT gmail DOT com
 
_gitname="arm-trusted-firmware"
_gitroot=https://github.com/ericwoud/${_gitname}
_gitbranch="bpir"
#_gitbranch="master"
pkgname=bpir64-atf-git
epoch=2
pkgver=v2.8r12079.7155480e7
pkgrel=1
pkgdesc='ATF bpir64 images including fiptool'
url='https://github.com/mtk-openwrt/arm-trusted-firmware.git'
arch=(aarch64)
depends=(linux)
makedepends=(git bpir64-mkimage)
license=(GPL)
source=("git+${_gitroot}.git#branch=${_gitbranch}"
        '95-atf.hook'
        'bpir64-writefip'
)
sha256sums=(SKIP SKIP SKIP)
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
#  git am --ignore-space-change --ignore-whitespace "${startdir}/"*.patch
}

_buildimage() {
  _plat=$1; _bpir=$2; _atfdev=$3; _rest="${@:4}"
  sed -i 's/.*entry = get_partition_entry.*/\tentry = get_partition_entry("'${_bpir}'-'${_atfdev}'-fip");/' \
         plat/mediatek/${_plat}/bl2_boot_mmc.c
  touch plat/mediatek/${_plat}/platform.mk
  unset CXXFLAGS CPPFLAGS LDFLAGS
  export CFLAGS=-Wno-error
  make PLAT=${_plat} BOOT_DEVICE=$_atfdev LOG_LEVEL=40 MTK_BL33_IS_64BIT=1 \
       USE_MKIMAGE=1 MKIMAGE=$(which bpir64-mkimage) ${_rest} all
  dd of=build/${_plat}/release/${_bpir}-atf-${_atfdev}-header.bin bs=1 count=440 if=build/${_plat}/release/bl2.img
  dd of=build/${_plat}/release/${_bpir}-atf-${_atfdev}-atf.bin         skip=34   if=build/${_plat}/release/bl2.img
}

_installimage() {
  _plat=$1; _bpir=$2
  cd "${srcdir}/${_gitname}/build/${_plat}/release"
  install -vDt "$pkgdir/boot" -m644 ${_bpir}-atf-*.bin
}

build() {
  cd "${srcdir}/${_gitname}/tools/fiptool"
  sed -i '/-Werror/d' ./Makefile
  make HOSTCCFLAGS+="-D'SHA256(x,y,z)=nop'" LDLIBS=""
  cd "${srcdir}/${_gitname}"
  _buildimage mt7622 bpir64 sdmmc DDR3_FLYBY=1 DEVICE_HEADER_OFFSET=0
  _buildimage mt7622 bpir64 emmc  DDR3_FLYBY=1 DEVICE_HEADER_OFFSET=0
  _buildimage mt7986 bpir3  sdmmc DRAM_USE_DDR4=1
  _buildimage mt7986 bpir3  emmc  DRAM_USE_DDR4=1
}
 
package() {
  cd "${srcdir}"
  install -m755 -vDt "$pkgdir/usr/bin" bpir64-writefip
  install -Dt "${pkgdir}/usr/share/libalpm/hooks/" -m644 95-atf.hook
  cd "${srcdir}/${_gitname}/tools/fiptool"
  install -m755 -vDt "$pkgdir/usr/bin" fiptool
  _installimage mt7622 bpir64
  _installimage mt7986 bpir3
}
