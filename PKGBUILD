# AArch64 kernel for TQC A01
# Maintainer: yjun <jerrysteve1101 at gmail dot com>

# patches from Armbian and libreELEC
# https://github.com/LibreELEC/LibreELEC.tv/tree/master/projects/Allwinner/devices/H6/patches/linux
# https://github.com/armbian/build/tree/master/patch/kernel/archive/sunxi-5.11

pkgbase=linux-tqc-a01
_srcname=linux-5.18
_kernelname=${pkgbase#linux}
_desc="AArch64 kernel for TQC A01"
pkgver=5.18.0
pkgrel=2
arch=('aarch64')
url="http://www.kernel.org/"
license=('GPL2')
makedepends=('xmlto' 'docbook-xsl' 'kmod' 'inetutils' 'bc' 'git' 'uboot-tools' 'vboot-utils' 'dtc')
options=('!strip')
source=(
        # "http://cdn.kernel.org/pub/linux/kernel/v5.x/${_srcname}.tar.xz"
        "https://mirror.bjtu.edu.cn/kernel/linux/kernel/v5.x/${_srcname}.tar.xz"
        'sun50i-h6-tqc-a01.dts'
        # custom
        '0001-make-proc-cpuinfo-consistent-on-arm64-and-arm.patch'
        '0011-dts-h6-tqc-a01-cpu-opp-2ghz.patch'
        '0012-arm64-h6-gpu-devfreq-enable.patch'
        # emmc
        '0012-fix-h6-emmc.patch'
        '0013-x-fix-h6-emmc-dts.patch'
        # ethernet
        'arm64-dts-sun50i-h6-Add-AC200-EPHY-related-nodes.patch'
        'drv-net-phy-Add-support-for-AC200-EPHY.patch'
        'drv-mfd-Add-support-for-AC200.patch'
        'net-stmmac-sun8i-Add-support-for-enabling-a-regulator-for-PHY-I.patch'
        'net-stmmac-sun8i-Rename-PHY-regulator-variable-to-regulator_phy.patch'
        'net-stmmac-sun8i-Use-devm_regulator_get-for-PHY-regulator.patch'
        # hdmi sound
        'arm64-dts-allwinner-h6-Add-hdmi-sound-card.patch'
        # audio codec
        '0009-allwinner-h6-support-ac200-audio-codec.patch'
        # misc
        '0010-allwinner-add-sunxi_get_soc_chipid-and-sunxi_get_ser.patch'
        'arm64-dts-sun50i-h6.dtsi-improve-thermals.patch'
        'arm64-dts-allwinner-h6-Add-SCPI-protocol.patch'
        'arm64-dts-allwinner-h6-Protect-SCP-clocks.patch'
        'drv-pinctrl-sunxi-pinctrl-sun50i-h6.c-GPIO-disable_strict_mode.patch'
        # cedrus
        'WIP-media-uapi-hevc-add-fields-needed-for-rkvdec.patch'
        'HACK-media-uapi-hevc-tiles-and-num_slices.patch'
        'Revert-net-Remove-net-ipx.h-and-uapi-linux-ipx.h-hea.patch'
        'drv-media-cedrus-10-bit-HEVC-support.patch'
        'drv-media-cedrus-Add-callback-for-buffer-cleanup.patch'
        'drv-media-cedrus-h264-Improve-buffer-management.patch'
        'drv-media-cedrus-hevc-Improve-buffer-management.patch'
        'drv-media-cedrus-hevc-tiles-hack.patch'

        'config'
        'linux.preset'
        '60-linux.hook'
        '90-linux.hook')

[[ ${pkgver##*.} != 0 ]] && \
# source+=("https://cdn.kernel.org/pub/linux/kernel/v5.x/patch-${pkgver}.xz")
source+=("https://mirror.bjtu.edu.cn/kernel/linux/kernel/v5.x/patch-${pkgver}.xz")

md5sums=('58e80452e2d8e1993cd7ec95e697ab5a'
         '7d9f4609119a7ae169cf7b7cb9121537'
         '7a18066683f3351b2bbd2653db783f80'
         '74baf0cb243b3abd5e38f0131c95408f'
         '947f64e1c0eec0564cb683940a5af51f'
         '6c58c6697e1275038acf579251c69d31'
         '2d7918618ec227b65d35078b3c7862ce'
         '5cf059c6de6dbee8d20041dcb735f5b1'
         'f0826f12d7b1f597fba32913e8580543'
         '714a3df875f3a05aee07c7c464ad3fe0'
         'f585248da27f4a1a2ae00fcef89ad92e'
         'ab514581687e4bb1f107a3692bba4bf3'
         'b45a181d414c98d99fe3231dc56ee38d'
         'f8aa3197a5c1e6d01cb1809c31cc2d92'
         'eda5ceb6d7f63318bba5ec63c601ae93'
         'a709f3089148690f41c739275e66e9b0'
         '99368425ced226332796b7f69fda3a2b'
         '6ab19f7244b9f82f56edabeb7e1e1004'
         'a95bab65e3009909138c0982ab7234aa'
         '113ec102b9b94a8c8c44dbde7e9b8d59'
         '196331c28fc1c77f78d7c6378cfb9e9e'
         'ec38509f11f44b412f4de990502a3fb7'
         '52d4ddae2d47320b97ce311106b407af'
         '2eb1edf94864c3c0b2a6f82463f84d67'
         '28ce48cd57b8776a75f4fed54569ffd1'
         'f5e2e35d9f0955cef5cf2332f901ff09'
         'b36af4f711a0aeb3f0edeb522a9e97bf'
         'dafb6c0da0e1c6be55c18fc50c850fab'
         '89942cfda812499d82c5307323e1468b'
         '66e0ae63183426b28c0ec0c7e10b5e16'
         'ce6c81ad1ad1f8b333fd6077d47abdaf'
         '3dc88030a8f2f5a5f97266d99b149f77')

prepare() {
  cd ${_srcname}

  # add upstream patch
  [[ ${pkgver##*.} != 0 ]] && \
  patch -p1 < "../patch-${pkgver}"

  # dts for TQC-A01
  target_dts="sun50i-h6-tqc-a01.dts"
  echo "dtb-\$(CONFIG_ARCH_SUNXI) += ${target_dts//dts/dtb}" >> "./arch/arm64/boot/dts/allwinner/Makefile"
  cat "${srcdir}/${target_dts}" > "./arch/arm64/boot/dts/allwinner/${target_dts}"

  # patches
  patch -p1 < ../0001-make-proc-cpuinfo-consistent-on-arm64-and-arm.patch
  patch -p1 < ../0011-dts-h6-tqc-a01-cpu-opp-2ghz.patch
  # patch -p1 < ../0012-arm64-h6-gpu-devfreq-enable.patch

  patch -p1 < ../0012-fix-h6-emmc.patch
  patch -p1 < ../0013-x-fix-h6-emmc-dts.patch
  
  patch -p1 < ../arm64-dts-sun50i-h6-Add-AC200-EPHY-related-nodes.patch
  patch -p1 < ../drv-net-phy-Add-support-for-AC200-EPHY.patch
  patch -p1 < ../drv-mfd-Add-support-for-AC200.patch
  patch -p1 < ../net-stmmac-sun8i-Use-devm_regulator_get-for-PHY-regulator.patch
  patch -p1 < ../net-stmmac-sun8i-Rename-PHY-regulator-variable-to-regulator_phy.patch
  patch -p1 < ../net-stmmac-sun8i-Add-support-for-enabling-a-regulator-for-PHY-I.patch

  patch -p1 < ../arm64-dts-allwinner-h6-Add-hdmi-sound-card.patch
  
  patch -p1 < ../0009-allwinner-h6-support-ac200-audio-codec.patch

  patch -p1 < ../0010-allwinner-add-sunxi_get_soc_chipid-and-sunxi_get_ser.patch
  patch -p1 < ../arm64-dts-sun50i-h6.dtsi-improve-thermals.patch
  patch -p1 < ../arm64-dts-allwinner-h6-Add-SCPI-protocol.patch
  patch -p1 < ../arm64-dts-allwinner-h6-Protect-SCP-clocks.patch
  patch -p1 < ../drv-pinctrl-sunxi-pinctrl-sun50i-h6.c-GPIO-disable_strict_mode.patch

  patch -p1 < ../WIP-media-uapi-hevc-add-fields-needed-for-rkvdec.patch
  patch -p1 < ../HACK-media-uapi-hevc-tiles-and-num_slices.patch
  patch -p1 < ../Revert-net-Remove-net-ipx.h-and-uapi-linux-ipx.h-hea.patch
  patch -p1 < ../drv-media-cedrus-10-bit-HEVC-support.patch
  patch -p1 < ../drv-media-cedrus-Add-callback-for-buffer-cleanup.patch
  patch -p1 < ../drv-media-cedrus-h264-Improve-buffer-management.patch
  patch -p1 < ../drv-media-cedrus-hevc-Improve-buffer-management.patch
  patch -p1 < ../drv-media-cedrus-hevc-tiles-hack.patch

  cat "${srcdir}/config" > ./.config

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
  depends=('coreutils' 'kmod' 'mkinitcpio>=0.7')
  optdepends=('crda: to set the correct wireless channels of your country'
              'firmware-tqc-a01: firmware for TQC A01 WiFi/Bluetooth')
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
