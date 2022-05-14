# Maintainer: yjun <jerrysteve1101 at gmail dot com>
# Contributor: Peter Cai <peter at typeblog dot net>
# Origin Maintainer: Kevin Mihelich <kevin@archlinuxarm.org>

# dts for phicomm-n1 :
# https://github.com/cattyhouse/pkgbuild-linux-phicomm-n1/

# PKGBUILD: 
# https://github.com/archlinuxarm/PKGBUILDs/blob/master/core/linux-aarch64/PKGBUILD

# 02-revert-TEXT_OFFSET-deletion.patch: 
# https://github.com/SuzukiHonoka/s905d-kernel-precompiled/tree/master/patch

# Armbina patches
# https://github.com/armbian/build/tree/master/patch/kernel/archive/meson64-5.17

pkgbase=linux-phicomm-n1
_srcname=linux-5.17
_kernelname=${pkgbase#linux}
_desc="AArch64 kernel for Phicomm N1"
pkgver=5.17.7
pkgrel=1
arch=('aarch64')
url="https://www.kernel.org/"
license=('GPL2')
depends=('uboot-tools')
makedepends=('xmlto' 'docbook-xsl' 'kmod' 'inetutils' 'bc' 'git' 'uboot-tools' 'vboot-utils' 'dtc')
options=('!strip')
source=(
        "https://mirror.bjtu.edu.cn/kernel/linux/kernel/v5.x/${_srcname}.tar.xz"
        # "https://cdn.kernel.org/pub/linux/kernel/v5.x/${_srcname}.tar.xz"
        'meson-gxl-s905d-phicomm-n1.dts'
        'config'
        'linux.preset'
        '60-linux.hook'
        '90-linux.hook'
        '02-revert-TEXT_OFFSET-deletion.patch'
        '03-make-proc-cpuinfo-consistent-on-arm64-and-arm.patch'
        # patches from armbian
        "general-meson-gx-mmc-fix-deferred-probing.patch"
        "general-meson-gx-mmc-set-core-clock-phase-to-270-degres.patch"
        "general-meson-aiu-Fix-HDMI-codec-control-selection.patch"
        "general-gpu-drm-add-new-display-resolution-2560x1440.patch"
        "general-drm-dw-hdmi-call-hdmi_set_cts_n-after-clock.patch"
        "general-hdmi-codec-reorder-channel-allocation-list.patch"
        "general-revert-meson_drv_shutdown.patch"
        "general-meson-vdec-remove-redundant-if-statement.patch"
        "general-meson-vdec-add-HEVC-decode-codec.patch"
        "general-meson-vdec-check-if-parser-has-really-parser.patch"
        "general-meson-vdec-add-handling-to-HEVC-decoder-.patch"
        "general-meson-vdec-improve-mmu-and-fbc-handling-.patch"
        "general-memory-marked-nomap.patch"
        "general-usb-core-improve-handling-of-hubs-with-no-ports.patch"
        "general-increase-cma-pool-896MB.patch"
        "general-sound-soc-remove-mono-channel-as-it-curren.patch"
)

[[ ${pkgver##*.} != 0 ]] && \
# source+=("https://cdn.kernel.org/pub/linux/kernel/v5.x/patch-${pkgver}.xz")
source+=("https://mirror.bjtu.edu.cn/kernel/linux/kernel/v5.x/patch-${pkgver}.xz")

md5sums=('07321a70a48d062cebd0358132f11771'
         '14b9c040a7a9320ea91a779cd8f14f02'
         'cf6bfafe79c9dc3e5fb9e9979b85855d'
         '30130b4dcd8ad4364ddbfd56c3058d5e'
         'ce6c81ad1ad1f8b333fd6077d47abdaf'
         '0d0435888ecad675870ecda4045a9d45'
         '614a77d2f4c92817ab4e5f989f9a76c9'
         '7a18066683f3351b2bbd2653db783f80'
         '55f160f63da3d642dc274b9830622187'
         '679e90aa8d00df767dbd9315238bcecc'
         '353091ec7dc615e242a6e00a712668b2'
         'd590f2af9d150f00bf9e5e4239e16105'
         '116c87fd40aa252e6702ad61af27b824'
         'd3ce443630c8c9768637d4b123dd8c70'
         '06d09873c61527e9488bf65973dc96c5'
         'c7f753fbb98202b9148ad7b4aed8ecad'
         '87d3fc334bc0309968948a084a1c3459'
         '90b82b89d96283e1f03d302676ecfe78'
         'eed9d1f3957af438f1c60d3d405dbb2d'
         'a4643fd62a9bf5b042d41cd0ddfa6906'
         '3c2bada63ca2427c78e224db5ded7c09'
         '425ec378dc6973e6185895d7a13a8d66'
         '38e3b2c9490ac3b8201db37e73ff2534'
         'dfcd0e763405a425b3f277394ed65a5d'
         'c942f79b0f310ca6e8d5828fad539a7f')

prepare() {
  cd ${_srcname}

  echo "Setting version..."
  scripts/setlocalversion --save-scmversion
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "${pkgbase#linux}" > localversion.20-pkgname

  # add upstream patch
  [[ ${pkgver##*.} != 0 ]] && \
  patch -p1 < "../patch-${pkgver}"

  # Amlogic meson SoC TEXT_OFFSET
  # Attention: since kernel 5.10, TEXT_OFFSET support is removed entriely, but it is required for the old BSP uboot to boot the kernel, so just revert it.
  # [arm64: get rid of TEXT_OFFSET](https://github.com/torvalds/linux/commit/120dc60d0bdbadcad7460222f74c9ed15cdeb73e)
  patch -p1 < "${srcdir}/02-revert-TEXT_OFFSET-deletion.patch"

  # Make proc cpuinfo consistent on arm64 and arm
  patch -p1 < "${srcdir}/03-make-proc-cpuinfo-consistent-on-arm64-and-arm.patch"

  # Patches from Armbian
  # MMC
  patch -p1 < "${srcdir}/general-meson-gx-mmc-set-core-clock-phase-to-270-degres.patch"
  patch -p1 < "${srcdir}/general-meson-gx-mmc-fix-deferred-probing.patch"

  # DRM and HDMI
  patch -p1 < "${srcdir}/general-meson-aiu-Fix-HDMI-codec-control-selection.patch"
  patch -p1 < "${srcdir}/general-gpu-drm-add-new-display-resolution-2560x1440.patch"
  patch -p1 < "${srcdir}/general-drm-dw-hdmi-call-hdmi_set_cts_n-after-clock.patch"
  patch -p1 < "${srcdir}/general-hdmi-codec-reorder-channel-allocation-list.patch"
  patch -p1 < "${srcdir}/general-revert-meson_drv_shutdown.patch"

  # MESON-VDEC
  patch -p1 < "${srcdir}/general-meson-vdec-remove-redundant-if-statement.patch"
  patch -p1 < "${srcdir}/general-meson-vdec-add-HEVC-decode-codec.patch"
  patch -p1 < "${srcdir}/general-meson-vdec-check-if-parser-has-really-parser.patch"
  patch -p1 < "${srcdir}/general-meson-vdec-add-handling-to-HEVC-decoder-.patch"
  patch -p1 < "${srcdir}/general-meson-vdec-improve-mmu-and-fbc-handling-.patch"

  # MISC
  patch -p1 < "${srcdir}/general-memory-marked-nomap.patch"
  patch -p1 < "${srcdir}/general-usb-core-improve-handling-of-hubs-with-no-ports.patch"
  patch -p1 < "${srcdir}/general-increase-cma-pool-896MB.patch"
  patch -p1 < "${srcdir}/general-sound-soc-remove-mono-channel-as-it-curren.patch"

  # Dts for Phicomm-N1
  target_dts="meson-gxl-s905d-phicomm-n1.dts"
  cat "${srcdir}/${target_dts}" > "./arch/arm64/boot/dts/amlogic/${target_dts}"
  
  cat "${srcdir}/config" > ./.config
}

build() {
  cd ${_srcname}

  # get kernel version
  make prepare
  make -s kernelrelease > version

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

  cd $_srcname
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

# vim: set sw=2 ts=2 et:
