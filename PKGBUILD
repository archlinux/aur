# Maintainer: Eric Woudstra ericwouds AT gmail DOT com
 
_gitname="arm-trusted-firmware"
_gitroot=https://github.com/ericwoud/${_gitname}
_gitbranch="bpir64"
pkgname=bpir64-atf-git
epoch=2
pkgver=v2.8r12062.65943cb2c
pkgrel=2
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
 
build() {
  cd "${srcdir}/${_gitname}/tools/fiptool"
  sed -i '/-Werror/d' ./Makefile
  make HOSTCCFLAGS+="-D'SHA256(x,y,z)=nop'" LDLIBS=""
  cd "${srcdir}/${_gitname}"
  for _atfdev in sdmmc emmc; do
    _ATFBUILDARGS="PLAT=mt7622 BOOT_DEVICE=$_atfdev DDR3_FLYBY=1 LOG_LEVEL=40 MTK_BL33_IS_64BIT=1"
     sed -i 's/.*entry = get_partition_entry.*/\tentry = get_partition_entry("bpir64-'${_atfdev}'-fip");/' \
           plat/mediatek/mt7622/bl2_boot_mmc.c
    _makeatf="make $_ATFBUILDARGS USE_MKIMAGE=1 MKIMAGE=$(which bpir64-mkimage) DEVICE_HEADER_OFFSET=0"
    touch plat/mediatek/mt7622/platform.mk
    unset CFLAGS CXXFLAGS CPPFLAGS LDFLAGS
    # PRELOADED_BL33_BASE is not being used in mt7622 atf code, so we use it as binairy flags:
    # 0b0001 : incbin BL31.bin inside of BL2 image, disable it during BL31 build because of common code!
    CFLAGS=-Wno-error $_makeatf PRELOADED_BL33_BASE=0b0000 bl31
    CFLAGS=-Wno-error $_makeatf PRELOADED_BL33_BASE=0b0001 bl2 ${srcdir}/${_gitname}/build/mt7622/release/bl2.img
    dd of=build/mt7622/release/bpir64-atf-${_atfdev}-header.bin bs=1 count=440 if=build/mt7622/release/bl2.img
    dd of=build/mt7622/release/bpir64-atf-${_atfdev}-atf.bin         skip=34   if=build/mt7622/release/bl2.img
  done
}
 
package() {
  cd "${srcdir}"
  install -m755 -vDt "$pkgdir/usr/bin" bpir64-writefip
  install -Dt "${pkgdir}/usr/share/libalpm/hooks/" -m644 95-atf.hook
  cd "${srcdir}/${_gitname}/tools/fiptool"
  install -m755 -vDt "$pkgdir/usr/bin" fiptool
  cd "${srcdir}/${_gitname}/build/mt7622/release"
  install -Dt "$pkgdir/boot" -m644 bpir64-atf-*.bin
}
