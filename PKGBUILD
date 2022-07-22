# Maintainer: Eric Woudstra <ericwouds@gmail.com>

# gsctool is only available in certein branches. It is not in the main/master branch.

_gitname="arm-trusted-firmware"
_gitroot="https://github.com/mtk-openwrt/${_gitname}"
_gitbranch="mtksoc"
pkgname=bpir64-atf-git
pkgver=r20210508214220.d2c75b2
pkgrel=1
pkgdesc='ATF bpir64 images including fiptool'
url='https://github.com/mtk-openwrt/arm-trusted-firmware.git'
arch=(aarch64)
depends=(bpir64-mkimage)
makedepends=(git)
license=(GPL)
source=('bl31-inside-bl2-image.patch'
        'mmc-high-speed.patch'
        'move-bl33-base.patch'
        'no-uboot-bl2.patch'
        'no-uboot-bl31.patch')
sha256sums=(SKIP SKIP SKIP SKIP SKIP)
install=${pkgname}.install
  
pkgver() {
  cd "${srcdir}/${_gitname}/"
  printf "r%s.%s" "$(git show -s --format=%cd --date=format:%Y%m%d%H%M%S HEAD)" "$(git rev-parse --short HEAD)"

}

_patch () {
  patch -p1 -N -r - < "${srcdir}/bl31-inside-bl2-image.patch"
  patch -p1 -N -r - < "${srcdir}/mmc-high-speed.patch"
  patch -p1 -N -r - < "${srcdir}/move-bl33-base.patch"
  patch -p1 -N -r - < "${srcdir}/no-uboot-bl2.patch"
  patch -p1 -N -r - < "${srcdir}/no-uboot-bl31.patch"
}

prepare() {
  if [[ -d "${srcdir}/${_gitname}/" ]]; then
    cd "${srcdir}/${_gitname}/"
    git fetch
    echo "LOCAL  HEAD: $(git rev-parse HEAD)"
    echo "REMOTE HEAD: $(git rev-parse @{u})"
    if [ "$(git rev-parse HEAD)" != "$(git rev-parse @{u})" ]; then
      git reset --hard
      git pull --depth=1 origin "${_gitbranch}:${_gitbranch}"
      git checkout "${_gitbranch}"
      _patch
    fi
    echo
  else
    cd "${srcdir}/"
    git clone --branch "${_gitbranch}" --depth=1 "${_gitroot}" "${srcdir}/${_gitname}/"
    cd "${srcdir}/${_gitname}/"
    _patch
    echo
  fi
}

build() {
  cd "${srcdir}/${_gitname}/tools/fiptool"
  sed -i '/-Werror/d' ./Makefile
  make
  cd "${srcdir}/${_gitname}"
  for _ATFDEVICE in sdmmc emmc; do
    _ATFBUILDARGS="PLAT=mt7622 BOOT_DEVICE=$_ATFDEVICE DDR3_FLYBY=1 LOG_LEVEL=40"
     sed -i 's/.*entry = get_partition_entry.*/\tentry = get_partition_entry("bpir64-'${_ATFDEVICE}'-fip");/' \
           plat/mediatek/mt7622/bl2_boot_mmc.c
    _makeatf="make $_ATFBUILDARGS USE_MKIMAGE=1 MKIMAGE=$(which bpir64-mkimage) DEVICE_HEADER_OFFSET=0"
    touch plat/mediatek/mt7622/platform.mk
    unset LDFLAGS
    unset CFLAGS
    # PRELOADED_BL33_BASE is not being used in mt7622 atf code, so we use it as binairy flags:
    # 0b0001 : incbin BL31.bin inside of BL2 image, disable it during BL31 build because of common code!
    $_makeatf PRELOADED_BL33_BASE=0b0000 bl31
    $_makeatf PRELOADED_BL33_BASE=0b0001 bl2 ${srcdir}/${_gitname}/build/mt7622/release/bl2.img
    dd of=build/mt7622/release/bpir64-atf-${_ATFDEVICE}-header.bin bs=1 count=440 if=build/mt7622/release/bl2.img
    dd of=build/mt7622/release/bpir64-atf-${_ATFDEVICE}-atf.bin         skip=34   if=build/mt7622/release/bl2.img
  done
}

package() {
  cd "${srcdir}/${_gitname}/tools/fiptool"
  install -m755 -vDt $pkgdir/usr/bin fiptool
  cd "${srcdir}/${_gitname}/build/mt7622/release"
  install -Dt "$pkgdir/boot" -m644 bpir64-atf-*.bin
  
}

# Writing:
#    _device="/dev/"$(lsblk -no pkname /dev/disk/by-partlabel/bpir64-${_ATFDEVICE}-atf)
#    _atfdev="/dev/disk/by-partlabel/bpir64-${_ATFDEVICE}-atf"
#  echo dd of="$atfdev"        if=/dev/zero 2>/dev/null
#  echo dd of="${device}" bs=1 if=bpir64-atf-${_ATFDEVICE}-header
#  echo dd of="$atfdev"        if=bpir64-atf-${_ATFDEVICE}-atf


