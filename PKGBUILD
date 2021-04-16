# Maintainer: yjun <jerrysteve1101 at gmail dot com>
# Contributor: Peter Cai <peter at typeblog dot net>
# Origin Maintainer: Kevin Mihelich <kevin@archlinuxarm.org>

# dts and config for phicomm-n1 :
# https://github.com/archlinux-jerry/pkgbuilds/blob/master/linux-phicomm-n1

# PKGBUILD: 
# https://github.com/archlinuxarm/PKGBUILDs/blob/master/core/linux-aarch64/PKGBUILD

# 02-revert-TEXT_OFFSET-deletion.patch: 
# https://github.com/SuzukiHonoka/s905d-kernel-precompiled/tree/master/patch

pkgbase=linux-phicomm-n1
_srcname=linux-5.11
_kernelname=${pkgbase#linux}
_desc="AArch64 kernel for Phicomm N1"
pkgver=5.11.14
pkgrel=1
arch=('aarch64')
url="https://www.kernel.org/"
license=('GPL2')
depends=('uboot-tools')
makedepends=('xmlto' 'docbook-xsl' 'kmod' 'inetutils' 'bc' 'git' 'uboot-tools' 'vboot-utils' 'dtc')
options=('!strip')
source=("https://cdn.kernel.org/pub/linux/kernel/v5.x/${_srcname}.tar.xz"
        'meson-gxl-s905d-phicomm-n1.dts'
        'config'
        'linux.preset'
        '60-linux.hook'
        '90-linux.hook'
	'01-aegis-crypto-gcc10.patch'
	'02-revert-TEXT_OFFSET-deletion.patch'
	'03-make-proc-cpuinfo-consistent-on-arm64-and-arm.patch')

[[ ${pkgver##*.} != 0 ]] && \
source+=("https://cdn.kernel.org/pub/linux/kernel/v5.x/patch-${pkgver}.xz")

md5sums=('d2985a3f16ef1ea3405c04c406e29dcc'
         'e21d126e18d32bd49bca6a27efdece0e'
         'b5c494212ef9c09cac5bcc68e2af7a14'
         '30130b4dcd8ad4364ddbfd56c3058d5e'
         'ce6c81ad1ad1f8b333fd6077d47abdaf'
         '0d0435888ecad675870ecda4045a9d45'
         'e25f537f53ffe2850318ed541f0b3460'
         'd891085afff175033cd2cfc3c8241759'
         '7a18066683f3351b2bbd2653db783f80'
         'fa1de6efc060f5428c9784142ae4fda1')

prepare() {
  cd ${_srcname}

  # add upstream patch
  [[ ${pkgver##*.} != 0 ]] && \
  patch -p1 < "../patch-${pkgver}"

  cat "${srcdir}/config" > ./.config

  # Fix latest gcc compiling errors with the aegis crypto module.
  patch -p1 -i "${srcdir}/01-aegis-crypto-gcc10.patch"

  # Amlogic meson SoC TEXT_OFFSET
  # Attention: since kernel 5.10, TEXT_OFFSET support is removed entriely, but it is required for the old BSP uboot to boot the kernel, so just revert it.
  # [arm64: get rid of TEXT_OFFSET](https://github.com/torvalds/linux/commit/120dc60d0bdbadcad7460222f74c9ed15cdeb73e)
  patch -p1 < "${srcdir}/02-revert-TEXT_OFFSET-deletion.patch"

  # Make proc cpuinfo consistent on arm64 and arm
  patch -p1 < "${srcdir}/03-make-proc-cpuinfo-consistent-on-arm64-and-arm.patch"

  # Dts for Phicomm-N1
  target_dts="meson-gxl-s905d-phicomm-n1.dts"
  cat "${srcdir}/${target_dts}" > "./arch/arm64/boot/dts/amlogic/${target_dts}"
  
  # Disable USB2 LPM. This works around several broken USB2 LPM implementations found in USB3 devices.
  # https://isolated.site/2019/03/05/several-patches-im-using-for-running-linux-5-0-on-phicomm-n1/
  sed -i '/snps,dis_u2_susphy_quirk;/a usb2-lpm-disable;' arch/arm64/boot/dts/amlogic/meson-gxl.dtsi

  # add pkgrel to extraversion
  sed -ri "s|^(EXTRAVERSION =)(.*)|\1 \2-${pkgrel}|" Makefile

  # don't run depmod on 'make install'. We'll do this ourselves in packaging
  sed -i '2iexit 0' scripts/depmod.sh
}

build() {
  cd ${_srcname}
  
  # use default settings for new options
  make olddefconfig

  # add back newly generated .config for new builds, disabled by default
  #cp ./.config ../../config
  
  # get kernel version
  make prepare

  # load configuration
  # Configure the kernel. Replace the line below with one of your choice.
  #make menuconfig # CLI menu for configuration
  #make nconfig # new CLI menu for configuration
  #make xconfig # X-based configuration
  #make oldconfig # using old config from previous kernel version
  # ... or manually edit .config

  # Copy back our configuration (use with new kernel version)
  #cp ./.config ../${pkgbase}.config

  ####################
  # stop here
  # this is useful to configure the kernel
  #msg "Stopping build"
  #return 1
  ####################

  #yes "" | make config

  # build!
  unset LDFLAGS
  make ${MAKEFLAGS} Image modules
  # Generate device tree blobs with symbols to support applying device tree overlays in U-Boot
  make ${MAKEFLAGS} DTC_FLAGS="-@" dtbs
}

_package() {
  pkgdesc="The Linux kernel and modules - ${_desc}"
  depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7')
  optdepends=('crda: to set the correct wireless channels of your country')
  provides=("linux=${pkgver}" "WIREGUARD-MODULE")
  replaces=('linux-armv8')
  conflicts=('linux')
  backup=("etc/mkinitcpio.d/${pkgbase}.preset")
  install=${pkgname}.install

  cd ${_srcname}

  KARCH=arm64

  # get kernel version
  _kernver="$(make kernelrelease)"
  _basekernel=${_kernver%%-*}
  _basekernel=${_basekernel%.*}

  mkdir -p "${pkgdir}"/{boot,usr/lib/modules}
  make INSTALL_MOD_PATH="${pkgdir}/usr" modules_install
  make INSTALL_DTBS_PATH="${pkgdir}/boot/dtbs" dtbs_install
  cp arch/$KARCH/boot/Image "${pkgdir}/boot/"

  # make room for external modules
  local _extramodules="extramodules-${_basekernel}${_kernelname}"
  ln -s "../${_extramodules}" "${pkgdir}/usr/lib/modules/${_kernver}/extramodules"

  # add real version for building modules and running depmod from hook
  echo "${_kernver}" |
    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modules/${_extramodules}/version"

  # remove build and source links
  rm "${pkgdir}"/usr/lib/modules/${_kernver}/{source,build}

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
