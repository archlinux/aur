# Maintainer: Dave Higham <pepedog@archlinuxarm.org>
# Maintainer: Kevin Mihelich <kevin@archlinuxarm.org>
# Maintainer: Oleg Rakhmanov <oleg@archlinuxarm.org>
# Maintainer: Daniel Edgecumbe <git@esotericnonsense.com>

buildarch=8

pkgbase=linux-raspberrypi4-aarch64
_commit=623ca2ba45d86eb1b0323637330295c3f8d93c76
_srcname=linux-${_commit}
_kernelname=${pkgbase#linux}
_desc="Raspberry Pi 4"
pkgver=5.10.17
pkgrel=1
arch=('aarch64')
url="http://www.kernel.org/"
license=('GPL2')
makedepends=('xmlto' 'docbook-xsl' 'kmod' 'inetutils' 'bc' 'git')
options=('!strip')
source=("https://github.com/raspberrypi/linux/archive/${_commit}.tar.gz"
        'config.txt'
        'cmdline.txt'
        'rpi4-kernel-config'
        'linux.preset'
        '60-linux.hook'
        '90-linux.hook')
b2sums=('38905d20c8ea9abf9ec5193ed31db5bdfcfa8d7904829522f16c59f449dc1b62a21987709934860a09b1c47b9ee15a40fe2cabe83d987fe47542633aab8c14bc'
        'f5d8ea1a0dd69fc616e8a55b74ca4288cce9f9e87a6dd26325711c8dbae420c472ee48738977d11bb1f30bb98d2aff0942d69020f28b37a6684f4d834fd376fe'
        '40ca3d551bdb28e8ca915a93c82aa714178227fe401c7d37385d739fe595e548ff3511d5949812d19903e291ee15cf16837965baa2c2f8216f1ea4e23ae7d5fb'
        '852e61e084da8a7d3c8935857ee87d1b1d2f989f30734a4e787ceba302119e7e565b13c3b6b4fa251efa83ee7abb3a7506614f802f158c7a3e504a4f817a3f0a'
        'f0cb39a8e448dc93cd830f1680303ecfcda6c729030ecf0bbf6dd8c57777a12ab33bbd991da4f735ba5869afb59d39f5cf5c7c725cc9ba6a78c235c2fd00251a'
        '40e2e0ac9eec9f9c08593875ca5bb8a26f835e33ae42e3718b98e83d76bbbc51a68395215c707fe58269954127261f7f8d12ec47341d28c672de973f3c4e71e8'
        '8edd95fb949c3282bc70043af19cd6afc5201c2889a4d4c2a0b65862d27ed7bbcfdcfb75cb2a91bae852f9a2294b5c947d71ce742458bf98f6937429130a64b0')

prepare() {
  cd "${srcdir}/${_srcname}"

  cat "${srcdir}/rpi4-kernel-config" > ./.config

  # add pkgrel to extraversion
  sed -ri "s|^(EXTRAVERSION =)(.*)|\1 \2-${pkgrel}|" Makefile

  # don't run depmod on 'make install'. We'll do this ourselves in packaging
  sed -i '2iexit 0' scripts/depmod.sh
}

build() {
  cd "${srcdir}/${_srcname}"

  # get kernel version
  make prepare

  # load configuration
  # Configure the kernel. Replace the line below with one of your choice.
  #make menuconfig # CLI menu for configuration
  #make nconfig # new CLI menu for configuration
  #make xconfig # X-based configuration
  #make oldconfig # using old config from previous kernel version
  #make bcmrpi_defconfig # using RPi defconfig
  # ... or manually edit .config

  # Copy back our configuration (use with new kernel version)
  #cp ./.config ../${pkgver}.config

  ####################
  # stop here
  # this is useful to configure the kernel
  #msg "Stopping build"
  #return 1
  ####################

  #yes "" | make config

  make ${MAKEFLAGS} Image modules dtbs
}

_package() {
  pkgdesc="The Linux Kernel and modules - ${_desc}"
  depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7' 'firmware-raspberrypi')
  optdepends=('crda: to set the correct wireless channels of your country')
  provides=("linux=${pkgver}")
  conflicts=('linux-aarch64' 'uboot-raspberrypi')
  install=${pkgname}.install
  backup=('boot/config.txt' 'boot/cmdline.txt')
  replaces=('linux-raspberrypi4' 'linux-raspberrypi-latest')

  cd "${srcdir}/${_srcname}"

  KARCH=arm64

  # get kernel version
  _kernver="$(make kernelrelease)"
  _basekernel=${_kernver%%-*}
  _basekernel=${_basekernel%.*}

  mkdir -p "${pkgdir}"/{boot,usr/lib/modules}

  make INSTALL_MOD_PATH="${pkgdir}/usr" modules_install
  make INSTALL_DTBS_PATH="${pkgdir}/boot" dtbs_install

  cp arch/$KARCH/boot/Image "${pkgdir}/boot/kernel8.img"
  cp arch/$KARCH/boot/dts/overlays/README "${pkgdir}/boot/overlays"

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

  # install boot files
  install -m644 ../config.txt ../cmdline.txt "${pkgdir}/boot"
}

_package-headers() {
  pkgdesc="Header files and scripts for building modules for linux kernel - ${_desc}"
  provides=("linux-headers=${pkgver}")
  conflicts=('linux-headers')
  replaces=('linux-raspberrypi4-headers' 'linux-raspberrypi-latest-headers')

  cd ${_srcname}
  local _builddir="${pkgdir}/usr/lib/modules/${_kernver}/build"

  install -Dt "${_builddir}" -m644 Makefile .config Module.symvers
  install -Dt "${_builddir}/kernel" -m644 kernel/Makefile

  mkdir "${_builddir}/.tmp_versions"

  cp -t "${_builddir}" -a include scripts

  install -Dt "${_builddir}/arch/${KARCH}" -m644 arch/${KARCH}/Makefile
  install -Dt "${_builddir}/arch/${KARCH}/kernel" -m644 arch/${KARCH}/kernel/asm-offsets.s scripts/module.lds

  cp -t "${_builddir}/arch/${KARCH}" -a arch/${KARCH}/include

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
    [[ ${_arch} == */${KARCH}/ ]] && continue
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
    /usr/bin/${CROSS_COMPILE}strip ${_strip} "${_binary}"
  done < <(find "${_builddir}/scripts" -type f -perm -u+w -print0 2>/dev/null)
}

pkgname=("${pkgbase}" "${pkgbase}-headers")
for _p in ${pkgname[@]}; do
  eval "package_${_p}() {
    _package${_p#${pkgbase}}
  }"
done
