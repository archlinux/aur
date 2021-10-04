# Arch64 kernel for Beikeyun P1
# Maintainer: yjun <jerrysteve1101 at gmail dot com>

# PKGBUILD and config: https://github.com/archlinuxarm/PKGBUILDs/tree/master/core/linux-aarch64

# Patches: these patches are extracted from commits in https://github.com/unifreq/linux-5.14.y

# Beikeyun dts: https://github.com/unifreq/linux-5.14.y/blob/main/arch/arm64/boot/dts/rockchip/rk3328-beikeyun-*.dts

pkgbase=linux-rk3328
_srcname=linux-5.14
_kernelname=${pkgbase#linux}
_desc="AArch64 kernel for RK3328"
pkgver=5.14.8
pkgrel=1
arch=('aarch64')
url="http://www.kernel.org/"
license=('GPL2')
makedepends=('xmlto' 'docbook-xsl' 'kmod' 'inetutils' 'bc' 'git' 'uboot-tools' 'vboot-utils' 'dtc')
replaces=("linux-beikeyun-p1", "linux-a5x-max")
options=('!strip')
source=("http://cdn.kernel.org/pub/linux/kernel/v5.x/${_srcname}.tar.xz"
        "rk3328-beikeyun-p1.dts"
        "rk3328-a5x-max.dts"
        "0001-add-rk3328-usb3-phy-driver.patch"
        "0002-rk3328-add-dmc-driver.patch"
        "0003-rk3328-audio-and-renegade-supplies.patch"
        "0004-rk3328-dtsi-mmc-vdec-usb3-tweaks.patch"
        "0005-rk3328-fix-mali-node.patch"
        "0006-rockchip-rng-driver.patch"
        "0007-fixed-mmc-index.patch"
        "0008-make-proc-cpuinfo-consistent-on-arm64-and-arm.patch"
        "0009-rk33328-enable-opp-table-1512mhz.patch"
        'config'
        'linux.preset'
        '60-linux.hook'
        '90-linux.hook')

[[ ${pkgver##*.} != 0 ]] && \
source+=("https://cdn.kernel.org/pub/linux/kernel/v5.x/patch-${pkgver}.xz")

md5sums=('a082ef5748b813abca0649dab8be5f52'
         'b712c1d1b1de3091acca6f4fd8bca831'
         '5523ed54aef01b095b2075277ab08f7c'
         '1300797c69bf7f6a26672011334c6a96'
         '010810596a08c508c1b57350de3c1ee5'
         'ccb144e753dce358915ed615329d2067'
         'dcc8de3b63a31dc71a7c735032b1345d'
         '9b6fdc9b96013041189fc35bcc32e31d'
         'a9527f30abbbde5c126e93e2bf57b034'
         '966cbe04ab5848bf6972411166adfee4'
         '7a18066683f3351b2bbd2653db783f80'
         '6bd07453ae52a555e90c46e711b7cf8c'
         'f172ba3d699b8d6b7c00ec3d59a3ea2b'
         '66e0ae63183426b28c0ec0c7e10b5e16'
         'ce6c81ad1ad1f8b333fd6077d47abdaf'
         '3dc88030a8f2f5a5f97266d99b149f77'
         '767e2bd13b4f1497f7500877792cbff2')

prepare() {
  cd ${_srcname}

  # add upstream patch
  [[ ${pkgver##*.} != 0 ]] && \
  patch -p1 < "../patch-${pkgver}"

  # dts for Beikeyun P1
  target_dts="rk3328-beikeyun-p1.dts"
  echo "dtb-\$(CONFIG_ARCH_ROCKCHIP) += ${target_dts//dts/dtb}" >> "./arch/arm64/boot/dts/rockchip/Makefile"
  cat "${srcdir}/${target_dts}" > "./arch/arm64/boot/dts/rockchip/${target_dts}"

  # dts for A5X Max
  target_dts="rk3328-a5x-max.dts"
  echo "dtb-\$(CONFIG_ARCH_ROCKCHIP) += ${target_dts//dts/dtb}" >> "./arch/arm64/boot/dts/rockchip/Makefile"
  cat "${srcdir}/${target_dts}" > "./arch/arm64/boot/dts/rockchip/${target_dts}"

  # patches for RK3328
  patch -p1 < ../0001-add-rk3328-usb3-phy-driver.patch
  patch -p1 < ../0002-rk3328-add-dmc-driver.patch
  patch -p1 < ../0003-rk3328-audio-and-renegade-supplies.patch
  patch -p1 < ../0004-rk3328-dtsi-mmc-vdec-usb3-tweaks.patch
  patch -p1 < ../0005-rk3328-fix-mali-node.patch
  patch -p1 < ../0006-rockchip-rng-driver.patch
  patch -p1 < ../0007-fixed-mmc-index.patch
  patch -p1 < ../0008-make-proc-cpuinfo-consistent-on-arm64-and-arm.patch
  patch -p1 < ../0009-rk33328-enable-opp-table-1512mhz.patch

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
# vim: set sw=2 ts=2 et:
