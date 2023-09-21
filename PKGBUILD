# AArch64 kernel for TQC A01
# Maintainer: yjun <jerrysteve1101 at gmail dot com>

# patches from Armbian and libreELEC
# https://github.com/LibreELEC/LibreELEC.tv/tree/master/projects/Allwinner/devices/H6/patches/linux
# https://github.com/armbian/build/tree/master/patch/kernel/archive/sunxi-5.11

pkgbase=linux-tqc-a01
_srcname=linux-6.5
_kernelname=${pkgbase#linux}
_desc="AArch64 kernel for TQC A01"
pkgver=6.5.4
pkgrel=1
arch=('aarch64')
url="http://www.kernel.org/"
license=('GPL2')
makedepends=('xmlto' 'docbook-xsl' 'kmod' 'inetutils' 'bc' 'git' 'uboot-tools' 'vboot-utils' 'dtc')
options=('!strip')
source=(
        # "http://cdn.kernel.org/pub/linux/kernel/v6.x/${_srcname}.tar.xz"
        "https://mirror.bjtu.edu.cn/kernel/linux/kernel/v6.x/${_srcname}.tar.xz"
        'sun50i-h6-tqc-a01.dts'
        # custom
        '0001-make-proc-cpuinfo-consistent-on-arm64-and-arm.patch'
        # '0011-dts-h6-tqc-a01-cpu-opp-2ghz.patch'
        # '0012-arm64-h6-gpu-devfreq-enable.patch'
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
	'ASOC-sun9i-hdmi-audio-Initial-implementation.patch'
        # audio codec
        '0009-allwinner-h6-support-ac200-audio-codec.patch'
        # misc
        '0010-allwinner-add-sunxi_get_soc_chipid-and-sunxi_get_ser.patch'
        'arm64-dts-sun50i-h6.dtsi-improve-thermals.patch'
        'arm64-dts-allwinner-h6-Add-SCPI-protocol.patch'
        'arm64-dts-allwinner-h6-Protect-SCP-clocks.patch'
        'drv-pinctrl-sunxi-pinctrl-sun50i-h6.c-GPIO-disable_strict_mode.patch'
        # cedrus
        # 'WIP-media-uapi-hevc-add-fields-needed-for-rkvdec.patch'
        # 'HACK-media-uapi-hevc-tiles-and-num_slices.patch'
        # 'Revert-net-Remove-net-ipx.h-and-uapi-linux-ipx.h-hea.patch'
        # 'drv-media-cedrus-10-bit-HEVC-support.patch'
        # 'drv-media-cedrus-Add-callback-for-buffer-cleanup.patch'
        # 'drv-media-cedrus-h264-Improve-buffer-management.patch'
        # 'drv-media-cedrus-hevc-Improve-buffer-management.patch'
        # 'drv-media-cedrus-hevc-tiles-hack.patch'

        'config'
        'linux.preset'
        '60-linux.hook'
        '90-linux.hook')

[[ ${pkgver##*.} != 0 ]] && \
# source+=("https://cdn.kernel.org/pub/linux/kernel/v6.x/patch-${pkgver}.xz")
source+=("https://mirror.bjtu.edu.cn/kernel/linux/kernel/v6.x/patch-${pkgver}.xz")

md5sums=('42c2796f9babe4a1be3f2001c817ff4a'
         '96e26de84bb7215589c2a32df8155113'
         '7a18066683f3351b2bbd2653db783f80'
         '6c58c6697e1275038acf579251c69d31'
         '2d7918618ec227b65d35078b3c7862ce'
         '5cf059c6de6dbee8d20041dcb735f5b1'
         'f0826f12d7b1f597fba32913e8580543'
         'e4161ac261b8a56019ba006c1878c658'
         'f585248da27f4a1a2ae00fcef89ad92e'
         'ab514581687e4bb1f107a3692bba4bf3'
         'b45a181d414c98d99fe3231dc56ee38d'
         'f8aa3197a5c1e6d01cb1809c31cc2d92'
         '151b9f379579573f3b0761421da303aa'
         'eda5ceb6d7f63318bba5ec63c601ae93'
         'a709f3089148690f41c739275e66e9b0'
         '99368425ced226332796b7f69fda3a2b'
         '6ab19f7244b9f82f56edabeb7e1e1004'
         'a95bab65e3009909138c0982ab7234aa'
         '113ec102b9b94a8c8c44dbde7e9b8d59'
         '7feda1e4fab7ff7d481b9181358a77f7'
         '66e0ae63183426b28c0ec0c7e10b5e16'
         'ce6c81ad1ad1f8b333fd6077d47abdaf'
         '3dc88030a8f2f5a5f97266d99b149f77'
         '9bed89cf06996530a6546da089a34af4')

prepare() {
  cd ${_srcname}

  echo "Setting version..."
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "${pkgbase#linux}" > localversion.20-pkgname

  # add upstream patch
  [[ ${pkgver##*.} != 0 ]] && \
  patch -p1 < "../patch-${pkgver}"

  # dts for TQC-A01
  target_dts="sun50i-h6-tqc-a01.dts"
  echo "dtb-\$(CONFIG_ARCH_SUNXI) += ${target_dts//dts/dtb}" >> "./arch/arm64/boot/dts/allwinner/Makefile"
  cat "${srcdir}/${target_dts}" > "./arch/arm64/boot/dts/allwinner/${target_dts}"

  # patches
  patch -p1 < ../0001-make-proc-cpuinfo-consistent-on-arm64-and-arm.patch
  # patch -p1 < ../0011-dts-h6-tqc-a01-cpu-opp-2ghz.patch

  patch -p1 < ../0012-fix-h6-emmc.patch
  patch -p1 < ../0013-x-fix-h6-emmc-dts.patch
  
  patch -p1 < ../arm64-dts-sun50i-h6-Add-AC200-EPHY-related-nodes.patch
  patch -p1 < ../drv-net-phy-Add-support-for-AC200-EPHY.patch
  patch -p1 < ../drv-mfd-Add-support-for-AC200.patch
  patch -p1 < ../net-stmmac-sun8i-Use-devm_regulator_get-for-PHY-regulator.patch
  patch -p1 < ../net-stmmac-sun8i-Rename-PHY-regulator-variable-to-regulator_phy.patch
  patch -p1 < ../net-stmmac-sun8i-Add-support-for-enabling-a-regulator-for-PHY-I.patch

  patch -p1 < ../arm64-dts-allwinner-h6-Add-hdmi-sound-card.patch
  patch -p1 < ../ASOC-sun9i-hdmi-audio-Initial-implementation.patch
  
  patch -p1 < ../0009-allwinner-h6-support-ac200-audio-codec.patch

  patch -p1 < ../0010-allwinner-add-sunxi_get_soc_chipid-and-sunxi_get_ser.patch
  patch -p1 < ../arm64-dts-sun50i-h6.dtsi-improve-thermals.patch
  patch -p1 < ../arm64-dts-allwinner-h6-Add-SCPI-protocol.patch
  patch -p1 < ../arm64-dts-allwinner-h6-Protect-SCP-clocks.patch
  patch -p1 < ../drv-pinctrl-sunxi-pinctrl-sun50i-h6.c-GPIO-disable_strict_mode.patch

  # patch -p1 < ../WIP-media-uapi-hevc-add-fields-needed-for-rkvdec.patch
  # patch -p1 < ../HACK-media-uapi-hevc-tiles-and-num_slices.patch
  # patch -p1 < ../Revert-net-Remove-net-ipx.h-and-uapi-linux-ipx.h-hea.patch
  # patch -p1 < ../drv-media-cedrus-10-bit-HEVC-support.patch
  # patch -p1 < ../drv-media-cedrus-Add-callback-for-buffer-cleanup.patch
  # patch -p1 < ../drv-media-cedrus-h264-Improve-buffer-management.patch
  # patch -p1 < ../drv-media-cedrus-hevc-Improve-buffer-management.patch
  # patch -p1 < ../drv-media-cedrus-hevc-tiles-hack.patch

  cat "${srcdir}/config" > ./.config
}

build() {
  cd ${_srcname}

  # get kernel version
  make prepare
  make -s kernelrelease > version

  # load configuration
  # Configure the kernel. Replace the line below with one of your choice.
  #make menuconfig # CLI menu for configuration
  #make nconfig # new CLI menu for configuration
  #make xconfig # X-based configuration
  make oldconfig # using old config from previous kernel version
  # ... or manually edit .config

  # Copy back our configuration (use with new kernel version)
#   cp ./.config ../${pkgbase}.config

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
  conflicts=('linux')
  backup=("etc/mkinitcpio.d/${pkgbase}.preset")
  install=${pkgname}.install

  cd ${_srcname}
  local kernver="$(<version)"
  local modulesdir="$pkgdir/usr/lib/modules/$kernver"

  echo "Installing boot image and dtbs..."
  install -Dm644 arch/arm64/boot/Image{,.gz} -t "${pkgdir}/boot"
  make INSTALL_DTBS_PATH="${pkgdir}/boot/dtbs" dtbs_install

  echo "Installing modules..."
  make INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 modules_install

  # remove build and source links
  rm "$modulesdir"/{source,build}

  # sed expression for following substitutions
  local _subst="
    s|%PKGBASE%|${pkgbase}|g
    s|%KERNVER%|${kernver}|g
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

  cd $_srcname
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  echo "Installing build files..."
  install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map \
    localversion.* version vmlinux
  install -Dt "$builddir/kernel" -m644 kernel/Makefile
  install -Dt "$builddir/arch/arm64" -m644 arch/arm64/Makefile
  cp -t "$builddir" -a scripts

  # add xfs and shmem for aufs building
  mkdir -p "$builddir"/{fs/xfs,mm}

  echo "Installing headers..."
  cp -t "$builddir" -a include
  cp -t "$builddir/arch/arm64" -a arch/arm64/include
  install -Dt "$builddir/arch/arm64/kernel" -m644 arch/arm64/kernel/asm-offsets.s
  mkdir -p "$builddir/arch/arm"
  cp -t "$builddir/arch/arm" -a arch/arm/include

  install -Dt "$builddir/drivers/md" -m644 drivers/md/*.h
  install -Dt "$builddir/net/mac80211" -m644 net/mac80211/*.h

  # https://bugs.archlinux.org/task/13146
  install -Dt "$builddir/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h

  # https://bugs.archlinux.org/task/20402
  install -Dt "$builddir/drivers/media/usb/dvb-usb" -m644 drivers/media/usb/dvb-usb/*.h
  install -Dt "$builddir/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/*.h
  install -Dt "$builddir/drivers/media/tuners" -m644 drivers/media/tuners/*.h

  # https://bugs.archlinux.org/task/71392
  install -Dt "$builddir/drivers/iio/common/hid-sensors" -m644 drivers/iio/common/hid-sensors/*.h

  echo "Installing KConfig files..."
  find . -name 'Kconfig*' -exec install -Dm644 {} "$builddir/{}" \;

  echo "Removing unneeded architectures..."
  local arch
  for arch in "$builddir"/arch/*/; do
    [[ $arch = */arm64/ || $arch == */arm/ ]] && continue
    echo "Removing $(basename "$arch")"
    rm -r "$arch"
  done

  echo "Removing documentation..."
  rm -r "$builddir/Documentation"

  echo "Removing broken symlinks..."
  find -L "$builddir" -type l -printf 'Removing %P\n' -delete

  echo "Removing loose objects..."
  find "$builddir" -type f -name '*.o' -printf 'Removing %P\n' -delete

  echo "Stripping build tools..."
  local file
  while read -rd '' file; do
    case "$(file -bi "$file")" in
      application/x-sharedlib\;*)      # Libraries (.so)
        strip -v $STRIP_SHARED "$file" ;;
      application/x-archive\;*)        # Libraries (.a)
        strip -v $STRIP_STATIC "$file" ;;
      application/x-executable\;*)     # Binaries
        strip -v $STRIP_BINARIES "$file" ;;
      application/x-pie-executable\;*) # Relocatable binaries
        strip -v $STRIP_SHARED "$file" ;;
    esac
  done < <(find "$builddir" -type f -perm -u+x ! -name vmlinux -print0)

  echo "Adding symlink..."
  mkdir -p "$pkgdir/usr/src"
  ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase"
}

pkgname=("${pkgbase}" "${pkgbase}-headers")
for _p in ${pkgname[@]}; do
  eval "package_${_p}() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#${pkgbase}}
  }"
done
