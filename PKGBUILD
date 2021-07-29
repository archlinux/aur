# AArch64 kernel for TQC A01
# Maintainer: yjun <jerrysteve1101 at gmail dot com>

# patches from Armbian and libreELEC
# https://github.com/LibreELEC/LibreELEC.tv/tree/master/projects/Allwinner/devices/H6/patches/linux
# https://github.com/armbian/build/tree/master/patch/kernel/archive/sunxi-5.11

pkgbase=linux-tqc-a01
_srcname=linux-5.11
_kernelname=${pkgbase#linux}
_desc="AArch64 kernel for TQC A01"
pkgver=5.11.4
pkgrel=6
arch=('aarch64')
url="http://www.kernel.org/"
license=('GPL2')
makedepends=('xmlto' 'docbook-xsl' 'kmod' 'inetutils' 'bc' 'git' 'uboot-tools' 'vboot-utils' 'dtc')
options=('!strip')
source=("http://cdn.kernel.org/pub/linux/kernel/v5.x/${_srcname}.tar.xz"
        'sun50i-h6-tqc-a01.dts'
        '0001-mfd-Add-support-for-AC200.patch'
        '0001-HACK-h6-Add-HDMI-sound-card.patch'
        '0001-net-smsc95xx-Allow-mac-address-to-be-set-as-a-parame.patch'
        '0002-net-phy-Add-support-for-AC200-EPHY.patch'
        '0002-net-stmmac-sun8i-Use-devm_regulator_get-for-PHY-regu.patch'
        '0003-net-stmmac-sun8i-Rename-PHY-regulator-variable-to-re.patch'
        '0003-arm64-dts-allwinner-h6-Add-AC200-EPHY-related-nodes.patch'
        '0004-net-stmmac-sun8i-Add-support-for-enabling-a-regulato.patch'
        '0005-drm-gem-cma-Export-with-handle-allocator.patch'
        '0006-drm-sun4i-Add-GEM-allocator.patch'
        '0010-general-h6-add-dma-i2c-ir-spi-uart.patch'
        '0011-mmc-sunxi-fix-unusuable-eMMC-on-some-H6-boards-by-di.patch'
        'fix-missing-H6-spi-pins.patch'
        'config'
        'kernel.its'
        'kernel.keyblock'
        'kernel_data_key.vbprivk'
        'linux.preset'
        '60-linux.hook'
        '90-linux.hook')

[[ ${pkgver##*.} != 0 ]] && \
source+=("https://cdn.kernel.org/pub/linux/kernel/v5.x/patch-${pkgver}.xz")

md5sums=('d2985a3f16ef1ea3405c04c406e29dcc'
         'f5de0dfcddc871280a60d99ea3284317'
         '17aa0c69176c68cd98b4522740a1b747'
         '2285d81ec6fb859d34b7abfd46a59550'
         'f9b6f367eef351eaa89b23a9b1ffc5a2'
         'bc7904920675ba8d38f21d46ffac33b5'
         '94a69594f90309c50c83a5cc8579fb54'
         'e1868e41094baff9eceba481fc097c79'
         '5a15e321aa56da359a8b0c62cda99013'
         '5d42a68276c8f9e8b3de040fa2579b84'
         '335382823f6dc2aae2f6038b7aee339e'
         'cb38b30491472097c3b9b475de39127f'
         'bc65c0b9e4d6fb2fe3a81b8358886885'
         'f27a8190e862a7edcf2b09cc27aef180'
         '11dfddadb815a896a2db65812e66e6fa'
         'a81cb45032d0ce8b9d26a4585eeb75c5'
         '7f1a96e24f5150f790df94398e9525a3'
         '61c5ff73c136ed07a7aadbf58db3d96a'
         '584777ae88bce2c5659960151b64c7d8'
         '66e0ae63183426b28c0ec0c7e10b5e16'
         'ce6c81ad1ad1f8b333fd6077d47abdaf'
         '3dc88030a8f2f5a5f97266d99b149f77'
         'afcc9a617c2b4e09c2da1411318a26da')

prepare() {
  cd ${_srcname}

  # add upstream patch
  [[ ${pkgver##*.} != 0 ]] && \
  patch -p1 < "../patch-${pkgver}"

  # patches for TQC A01
  patch -p1 < ../0001-mfd-Add-support-for-AC200.patch
  patch -p1 < ../0001-HACK-h6-Add-HDMI-sound-card.patch
  patch -p1 < ../0001-net-smsc95xx-Allow-mac-address-to-be-set-as-a-parame.patch
  patch -p1 < ../0002-net-phy-Add-support-for-AC200-EPHY.patch
  patch -p1 < ../0002-net-stmmac-sun8i-Use-devm_regulator_get-for-PHY-regu.patch
  patch -p1 < ../0003-net-stmmac-sun8i-Rename-PHY-regulator-variable-to-re.patch
  patch -p1 < ../0003-arm64-dts-allwinner-h6-Add-AC200-EPHY-related-nodes.patch
  patch -p1 < ../0004-net-stmmac-sun8i-Add-support-for-enabling-a-regulato.patch
  patch -p1 < ../0005-drm-gem-cma-Export-with-handle-allocator.patch
  patch -p1 < ../0006-drm-sun4i-Add-GEM-allocator.patch
  patch -p1 < ../0010-general-h6-add-dma-i2c-ir-spi-uart.patch
  patch -p1 < ../0011-mmc-sunxi-fix-unusuable-eMMC-on-some-H6-boards-by-di.patch
  patch -p1 < ../fix-missing-H6-spi-pins.patch

  cat "${srcdir}/config" > ./.config

  # dts for TQC-A01
  target_dts="sun50i-h6-tqc-a01.dts"
  echo "dtb-\$(CONFIG_ARCH_SUNXI) += ${target_dts//dts/dtb}" >> "./arch/arm64/boot/dts/allwinner/Makefile"
  cat "${srcdir}/${target_dts}" > "./arch/arm64/boot/dts/allwinner/${target_dts}"

  # add pkgrel to extraversion
  sed -ri "s|^(EXTRAVERSION =)(.*)|\1 \2-${pkgrel}|" Makefile

  # don't run depmod on 'make install'. We'll do this ourselves in packaging
  sed -i '2iexit 0' scripts/depmod.sh
}

build() {
  cd ${_srcname}

  # get kernel version
  make prepare

  # load configuration
  # Configure the kernel. Replace the line below with one of your choice.
  #make menuconfig # CLI menu for configuration
  #make nconfig # new CLI menu for configuration
  #make xconfig # X-based configuration
  make oldconfig # using old config from previous kernel version
  # ... or manually edit .config

  # Copy back our configuration (use with new kernel version)
  cp ./.config ../${pkgbase}.config

  ####################
  # stop here
  # this is useful to configure the kernel
  #msg "Stopping build"
  #return 1
  ####################

  #yes "" | make config

  # build!
  unset LDFLAGS
  make ${MAKEFLAGS} Image Image.gz modules
  # Generate device tree blobs with symbols to support applying device tree overlays in U-Boot
  make ${MAKEFLAGS} DTC_FLAGS="-@" dtbs
}

_package() {
  pkgdesc="The Linux Kernel and modules - ${_desc}"
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
  cp arch/$KARCH/boot/Image{,.gz} "${pkgdir}/boot"

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
