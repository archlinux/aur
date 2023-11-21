# Arch64 kernel for BananaPi R64
# Maintainer: Eric Woudstra <ericwouds AT gmail DOT com>

#NOEXTRACT="1"

# PKGBUILD: https://github.com/archlinuxarm/PKGBUILDs/tree/master/core/linux-aarch64

# Succesfull boot also depends on devictree-overlays from:
# https://github.com/ericwoud/buildR64arch

# Optional settings:
#_lto="true"      # Uncomment this line to enable CLANG-LTO

_gitroot="https://github.com/ericwoud/linux.git"
_gitbranch="bpir-rolling-stable"
#_gitroot="https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux"
#_gitbranch="linux-rolling-stable"
#_gitbranch="linux-rolling-lts"
#_gitroot="https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next"
#_gitbranch="main"
#_gitroot="https://github.com/frank-w/BPI-Router-Linux.git"
#_gitbranch="6.6-r3mini"

pkgbase=linux-bpir64-git
_srcname=linux
_kernelname=${pkgbase#linux}
_desc="AArch64 kernel for BPI-R64 and BPI-R3"
pkgver=6.3.9.bpi
pkgrel=9
arch=('aarch64')
url="http://www.kernel.org/"
license=('GPL2')
makedepends=('kmod' 'inetutils' 'bc' 'git')
[[ "$_lto" == "true" ]] &&  makedepends+=('clang' 'llvm' 'lld')
options=('!strip')
source=('defconfig'
        'linux.preset'
        '60-linux.hook'
        '90-linux.hook'
        'mkinitcpio.conf'
        'mkinitcpio.hook'
        'mkinitcpio.build'
        'bpir-flash2emmc'
)
md5sums=(SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP)

export CARCH=aarch64
export LOCALVERSION=""
if [[ "$(uname -m)" != "aarch64" ]]; then
  makedepends+=(aarch64-linux-gnu-gcc)
  export MAKEFLAGS+=" ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-"
fi
[[ "$_lto" == "true" ]] && _llvm="LLVM=1" || _llvm=""

prepare() {
  if [[ -d "${srcdir}/${_srcname}/" ]]; then
    cd "${srcdir}/${_srcname}/"
    git remote set-branches origin '*'
    git fetch --all -v --depth=1
    git reset --hard
    git checkout ${_gitbranch}
    echo "LOCAL  HEAD: $(git rev-parse HEAD)"
    echo "REMOTE HEAD: $(git rev-parse @{u})"
    if [ "$(git rev-parse HEAD)" != "$(git rev-parse @{u})" ]; then
      git reset --hard "origin/${_gitbranch}"
    fi
  else
    cd "${srcdir}/"
    git clone --branch "${_gitbranch}" --depth=1 "${_gitroot}" "${srcdir}/${_srcname}/"
  fi
  cd "${srcdir}/${_srcname}/"

  _v1=$(grep '^VERSION = ' Makefile | cut -b 11-)
  _v2=$(grep '^PATCHLEVEL = ' Makefile | cut -b 14-)
  _ver=$(( $_v1*1000 + $_v2 ))

  (
    cd ./arch/arm64/boot/dts/mediatek/
    if [ ! -f "mt7986a.dtsi" ]; then
      curl -O -L https://github.com/torvalds/linux/raw/master/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
    fi
    if [ ! -f "mt7986a-bananapi-bpi-r3.dts" ]; then
      curl -O -L https://github.com/torvalds/linux/raw/master/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
      sed -i 's/mt6795-sony-xperia-m5/mt7986a-bananapi-bpi-r3/g' ./arch/arm64/boot/dts/mediatek/Makefile
    fi
  )

  cp -vf ${startdir}/defconfig ./arch/arm64/configs/bpir_defconfig
  if (( $_ver > 6005 )); then
    sed -i 's/CONFIG_MT7986_WMAC/CONFIG_MT798X_WMAC/g' ./arch/arm64/configs/bpir_defconfig
  else
    sed -i 's/CONFIG_MT798X_WMAC/CONFIG_MT7986_WMAC/g' ./arch/arm64/configs/bpir_defconfig
  fi
  make ${MAKEFLAGS} $_llvm bpir_defconfig
  rm -vf ./arch/arm64/configs/bpir_defconfig

  # Need to patch this in repo when kernel goes v6.6
  #sed -i '/of_overlay_fdt_apply/s/id);/id, NULL);/g' ./drivers/of/configfs.c

  # get kernel version
  make ${MAKEFLAGS} $_llvm prepare
}

pkgver() {
  cd "$srcdir/$_srcname"
  printf "%s" "$(echo  $(make ${MAKEFLAGS} $_llvm -s kernelrelease) | \
                 sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd ${_srcname}
  unset LDFLAGS
  if [[ "$_lto" == "true" ]]; then
    ./scripts/config --enable LTO_CLANG_FULL # LTO_CLANG_THIN
    make ${MAKEFLAGS} $_llvm oldconfig
  fi
  if [[ -v MENUCONFIG ]]; then
    make ${MAKEFLAGS} $_llvm menuconfig
    make ${MAKEFLAGS} $_llvm savedefconfig
    cp -vf ./defconfig ${startdir}/defconfig
  fi
  make ${MAKEFLAGS} $_llvm Image Image.gz modules # KCFLAGS=-w
  # Generate device tree blobs with symbols to support applying device tree overlays in U-Boot
  make ${MAKEFLAGS} $_llvm DTC_FLAGS="-@" dtbs
}

_package() {
  pkgdesc="The Linux Kernel and modules - ${_desc}"
  depends=('coreutils' 'linux-firmware' 'kmod')
  optdepends=('mkinitcpio>=0.7')
  provides=("linux=${pkgver}" "WIREGUARD-MODULE")
  replaces=('linux-armv8')
  conflicts=('linux')
  backup=("etc/mkinitcpio.d/${pkgbase}.preset")
  install=${pkgname}.install

  cd ${_srcname}

  KARCH=arm64

  # get kernel version
  _kernver="$(make ${MAKEFLAGS} $_llvm kernelrelease)"
  _basekernel=${_kernver%%-*}
  _basekernel=${_basekernel%.*}

  mkdir -p "${pkgdir}"/{boot,boot/dtbs,usr/lib/modules}
  make ${MAKEFLAGS} $_llvm INSTALL_MOD_PATH="${pkgdir}/usr" INSTALL_MOD_STRIP=1 \
       DEPMOD=/doesnt/exist modules_install
  cp arch/$KARCH/boot/Image{,.gz} "${pkgdir}/boot"
  cp arch/$KARCH/boot/dts/mediatek/*.dtb "${pkgdir}/boot/dtbs"

  # make room for external modules
  local _extramodules="extramodules-${_basekernel}${_kernelname}"
  ln -s "../${_extramodules}" "${pkgdir}/usr/lib/modules/${_kernver}/extramodules"

  # add real version for building modules and running depmod from hook
  echo "${_kernver}" |
    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modules/${_extramodules}/version"

  # remove build and source links
  rm -f "${pkgdir}"/usr/lib/modules/${_kernver}/{source,build}

  # now we call depmod...
  depmod -b "${pkgdir}/usr" -F System.map "${_kernver}"

  # add vmlinux
  install -Dt "${pkgdir}/usr/lib/modules/${_kernver}/build" -m644 vmlinux

  # sed expression for following substitutions
  local _subst="
    s|%PKGBASE%|${pkgbase}|g
    s|%KERNVER%|${_kernver}|g
    s|%EXTRAMODULES%|${_extramodules}|g
  "

  # install mkinitcpio preset file
  sed "${_subst}" ../linux.preset |
    install -Dm644 /dev/stdin "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"

  # install mkinitcpio conf file
  sed "${_subst}" ../mkinitcpio.conf |
    install -Dm644 /dev/stdin "${pkgdir}/etc/mkinitcpio-${pkgbase}.conf"

  # install mkinitcpio runtime hook
  sed "${_subst}" ../mkinitcpio.hook |
    install -Dm644 /dev/stdin "${pkgdir}/etc/initcpio/hooks/${pkgbase}"

  # install mkinitcpio build hook
  sed "${_subst}" ../mkinitcpio.build |
    install -Dm644 /dev/stdin "${pkgdir}/etc/initcpio/install/${pkgbase}"

  # install R3 EMMC flash script
  sed "${_subst}" ../bpir-flash2emmc |
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/bpir-flash2emmc"

  # install pacman hooks
  sed "${_subst}" ../60-linux.hook |
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/libalpm/hooks/60-${pkgbase}.hook"
  sed "${_subst}" ../90-linux.hook |
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/libalpm/hooks/90-${pkgbase}.hook"
}

_package-headers() {
  pkgdesc="Header files and scripts for building modules for linux kernel - ${_desc}"
  provides=("linux-headers=${pkgver}")
  conflicts=('linux-headers')

  cd ${_srcname}
  local _builddir="${pkgdir}/usr/lib/modules/${_kernver}/build"

  install -Dt "${_builddir}" -m644 Makefile .config Module.symvers
  install -Dt "${_builddir}/kernel" -m644 kernel/Makefile

  mkdir "${_builddir}/.tmp_versions"

  cp -t "${_builddir}" -a include scripts

  install -Dt "${_builddir}/arch/${KARCH}" -m644 arch/${KARCH}/Makefile
  install -Dt "${_builddir}/arch/${KARCH}/kernel" -m644 arch/${KARCH}/kernel/asm-offsets.s

  cp -t "${_builddir}/arch/${KARCH}" -a arch/${KARCH}/include
  mkdir -p "${_builddir}/arch/arm"
  cp -t "${_builddir}/arch/arm" -a arch/arm/include

  install -Dt "${_builddir}/drivers/md" -m644 drivers/md/*.h
  install -Dt "${_builddir}/net/mac80211" -m644 net/mac80211/*.h

  # http://bugs.archlinux.org/task/13146
  install -Dt "${_builddir}/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h

  # http://bugs.archlinux.org/task/20402
  install -Dt "${_builddir}/drivers/media/usb/dvb-usb" -m644 drivers/media/usb/dvb-usb/*.h
  install -Dt "${_builddir}/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/*.h
  install -Dt "${_builddir}/drivers/media/tuners" -m644 drivers/media/tuners/*.h

  # https://bugs.archlinux.org/task/71392
  install -Dt "${_builddir}/drivers/iio/common/hid-sensors" -m644 drivers/iio/common/hid-sensors/*.h

  # add xfs and shmem for aufs building
  mkdir -p "${_builddir}"/{fs/xfs,mm}

  # copy in Kconfig files
  find . -name Kconfig\* -exec install -Dm644 {} "${_builddir}/{}" \;

  # remove unneeded architectures
  local _arch
  for _arch in "${_builddir}"/arch/*/; do
    [[ ${_arch} == */${KARCH}/ || ${_arch} == */arm/ ]] && continue
    rm -r "${_arch}"
  done

  # remove files already in linux-docs package
  rm -r "${_builddir}/Documentation"

  # remove now broken symlinks
  find -L "${_builddir}" -type l -printf 'Removing %P\n' -delete

  # Fix permissions
  chmod -R u=rwX,go=rX "${_builddir}"

  # strip scripts directory
  local _binary _strip
  while read -rd '' _binary; do
    case "$(file -bi "${_binary}")" in
      *application/x-sharedlib*)  _strip="${STRIP_SHARED}"   ;; # Libraries (.so)
      *application/x-archive*)    _strip="${STRIP_STATIC}"   ;; # Libraries (.a)
      *application/x-executable*) _strip="${STRIP_BINARIES}" ;; # Binaries
      *) continue ;;
    esac
    /usr/bin/strip ${_strip} "${_binary}"
  done < <(find "${_builddir}/scripts" -type f -perm -u+w -print0 2>/dev/null)
}

pkgname=("${pkgbase}" "${pkgbase}-headers")
for _p in ${pkgname[@]}; do
  eval "package_${_p}() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#${pkgbase}}
  }"
done
# vim: set sw=2 ts=2 et:
