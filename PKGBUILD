# $Id$
# Maintainer:  Joakim Hernberg <jbh@alchemy.lu>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: timbosa <tinny_tim@dodo.com.au>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>

#pkgbase=linux               # Build stock -ARCH kernel
pkgbase=linux-rt             # Build kernel with a different name
_srcname=linux-4.16
_pkgver=4.16.12
_rtpatchver=rt5
pkgver=${_pkgver}_${_rtpatchver}
pkgrel=1
arch=('x86_64')
url="https://www.kernel.org/"
license=('GPL2')
makedepends=('xmlto' 'kmod' 'inetutils' 'bc' 'libelf')
options=('!strip')
source=(
  "https://www.kernel.org/pub/linux/kernel/v4.x/${_srcname}.tar.xz"
  "https://www.kernel.org/pub/linux/kernel/v4.x/${_srcname}.tar.sign"
  "https://www.kernel.org/pub/linux/kernel/v4.x/patch-${_pkgver}.xz"
  "https://www.kernel.org/pub/linux/kernel/v4.x/patch-${_pkgver}.sign"
  "https://www.kernel.org/pub/linux/kernel/projects/rt/4.16/older/patch-${_pkgver}-${_rtpatchver}.patch.xz"
  "https://www.kernel.org/pub/linux/kernel/projects/rt/4.16/older/patch-${_pkgver}-${_rtpatchver}.patch.sign"
  'config'         # the main kernel config file
  '60-linux-rt.hook'  # pacman hook for depmod
  '90-linux-rt.hook'  # pacman hook for initramfs regeneration
  'linux-rt.preset'   # standard config files for mkinitcpio ramdisk
  0001-add-sysctl-to-disallow-unprivileged-CLONE_NEWUSER-by.patch
  0002-drm-i915-edp-Only-use-the-alternate-fixed-mode-if-it.patch
  0003-Partially-revert-swiotlb-remove-various-exports.patch
  0001-objtool_Fix_noreturn_detection_for_recursive_sibling_calls.patch
  0002-objtool_support_GCC8_cold_subfunctions.patch
  0003-objtool_support_GCC8_switch_tables.patch
  fix-race-in-PRT-wait-for-completion-simple-wait-code_Nvidia-RT-160319.patch
)
validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
  '64254695FFF0AA4466CC19E67B96E8162A8CF5D1'  # Sebastian Andrzej Siewior
  '5ED9A48FC54C0A22D1D0804CEBC26CDB5A56DE73'  # Steven Rostedt
  'E644E2F1D45FA0B2EAA02F33109F098506FF0B14'  # Thomas Gleixner
)
sha256sums=('63f6dc8e3c9f3a0273d5d6f4dca38a2413ca3a5f689329d05b750e4c87bb21b9'
            'SKIP'
            '70a6381aca28b1d271e85bc38fab05af4525d9fdc2c5bb87182b3351db8c4fa2'
            'SKIP'
            '753a22311c369dd10d26b7c8696494f14c5015c6723e4bf81eb11687d196332e'
            'SKIP'
            'bac64c4b5d015f5f047e2dd558f4643dc2a2afafbfe5bbd124f68811da07c484'
            'ae2e95db94ef7176207c690224169594d49445e04249d2499e9d2fbc117a0b21'
            '75f99f5239e03238f88d1a834c50043ec32b1dc568f2cc291b07d04718483919'
            'ad6344badc91ad0630caacde83f7f9b97276f80d26a20619a87952be65492c65'
            '7fb607fe384dd814e9e45d7fc28f7b5b23a51d80784c54bf9209486ad428be14'
            'ceaa19e0af3842c62eb666a4ac5c79d89b3e6d00593442f18d6508ca6d74bbaa'
            '5b397cf9eccdad0c1f2865842c29ba6f4e32ad7dbe4e0c6ef6ca6f07d2963cea'
            '558b63fa72c1b62cdab92812b279f24188308e0e89b5a8ae0c5f23cef1e2f75e'
            '31d95ce07a1635251fdc8a1d0ba67c2397d1c035d21cf3ac8c0d08a564aafcee'
            'cd54a177a70788d385f02d934ac4501a31334615c9c81917d6e711f7ec7e7baa'
            '85f7612edfa129210343d6a4fe4ba2a4ac3542d98b7e28c8896738e7e6541c06')

_kernelname=${pkgbase#linux}
: ${_kernelname:=-ARCH}

prepare() {
  cd ${_srcname}

  # add upstream patch
  patch -p1 -i ../patch-${_pkgver}

  # add latest fixes from stable queue, if needed
  # http://git.kernel.org/?p=linux/kernel/git/stable/stable-queue.git

  # gcc8 ojtool patches
  msg "gcc8 objtool patches..."
  patch -p1 -i ../0001-objtool_Fix_noreturn_detection_for_recursive_sibling_calls.patch
  patch -p1 -i ../0002-objtool_support_GCC8_cold_subfunctions.patch
  patch -p1 -i ../0003-objtool_support_GCC8_switch_tables.patch

  # disable USER_NS for non-root users by default
  patch -Np1 -i ../0001-add-sysctl-to-disallow-unprivileged-CLONE_NEWUSER-by.patch

  # https://bugs.archlinux.org/task/56711
  patch -Np1 -i ../0002-drm-i915-edp-Only-use-the-alternate-fixed-mode-if-it.patch

  # NVIDIA driver compat
  patch -Np1 -i ../0003-Partially-revert-swiotlb-remove-various-exports.patch

  # add realtime patch
  msg "applying patch-${_pkgver}-${_rtpatchver}.patch"
  patch -Np1 -i ../patch-${_pkgver}-${_rtpatchver}.patch

  # A patch to fix a problem that ought to be fixed in the NVIDIA source code.
  # Stops X from hanging on certain NVIDIA cards
  msg "fix-race-in-PRT-wait-for-completion-simple-wait-code_Nvidia-RT-160319.patch"
  patch -Np1 -i ../fix-race-in-PRT-wait-for-completion-simple-wait-code_Nvidia-RT-160319.patch

  msg "All patches have successfully been applied"

  cat ../config - >.config <<END
CONFIG_LOCALVERSION="-${pkgrel}${_kernelname}"
CONFIG_LOCALVERSION_AUTO=n
END

  # set extraversion to pkgrel and empty localversion
#  sed -e "/^EXTRAVERSION =/s/=.*/= -${pkgrel}/" \
#      -e "/^EXTRAVERSION =/aLOCALVERSION =" \
#      -i Makefile

  # don't run depmod on 'make install'. We'll do this ourselves in packaging
  sed -i '2iexit 0' scripts/depmod.sh

  # get kernel version
  make prepare

  # load configuration
  # Configure the kernel. Replace the line below with one of your choice.
  #make menuconfig # CLI menu for configuration
  #make nconfig # new CLI menu for configuration
  #make xconfig # X-based configuration
  #make oldconfig # using old config from previous kernel version
  # ... or manually edit .config

  # rewrite configuration
  yes "" | make config >/dev/null
}

build() {
  cd ${_srcname}

  make bzImage modules
}

_package() {
  pkgdesc="The ${pkgbase/linux/Linux} kernel and modules"
  [ "${pkgbase}" = "linux" ] && groups=('base')
  depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7')
  optdepends=('crda: to set the correct wireless channels of your country')
  backup=("etc/mkinitcpio.d/${pkgbase}.preset")
  install="linux-rt.install"

  cd ${_srcname}

  # get kernel version
  _kernver="$(make kernelrelease)"
  _basekernel=${_kernver%%-*}
  _basekernel=${_basekernel%.*}

  mkdir -p "${pkgdir}"/{boot,usr/lib/modules}
  make INSTALL_MOD_PATH="${pkgdir}/usr" modules_install
  cp arch/x86/boot/bzImage "${pkgdir}/boot/vmlinuz-${pkgbase}"

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

  # hack to allow specifying an initially nonexisting install file
  sed "${_subst}" "${startdir}/${install}" > "${startdir}/${install}.pkg"
  true && install=${install}.pkg

  # install mkinitcpio preset file
  sed "${_subst}" ../linux-rt.preset |
    install -Dm644 /dev/stdin "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"

  # install pacman hooks
  sed "${_subst}" ../60-linux-rt.hook |
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/libalpm/hooks/60-${pkgbase}.hook"
  sed "${_subst}" ../90-linux-rt.hook |
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/libalpm/hooks/90-${pkgbase}.hook"
}

_package-headers() {
  pkgdesc="Header files and scripts for building modules for ${pkgbase/linux/Linux} kernel"

  cd ${_srcname}
  local _builddir="${pkgdir}/usr/lib/modules/${_kernver}/build"

  install -Dt "${_builddir}" -m644 Makefile .config Module.symvers
  install -Dt "${_builddir}/kernel" -m644 kernel/Makefile

  mkdir "${_builddir}/.tmp_versions"

  cp -t "${_builddir}" -a include scripts

  install -Dt "${_builddir}/arch/x86" -m644 arch/x86/Makefile
  install -Dt "${_builddir}/arch/x86/kernel" -m644 arch/x86/kernel/asm-offsets.s

  cp -t "${_builddir}/arch/x86" -a arch/x86/include

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

  # add objtool for external module building and enabled VALIDATION_STACK option
  install -Dt "${_builddir}/tools/objtool" tools/objtool/objtool

  # remove unneeded architectures
  local _arch
  for _arch in "${_builddir}"/arch/*/; do
    [[ ${_arch} == */x86/ ]] && continue
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

_package-docs() {
  pkgdesc="Kernel hackers manual - HTML documentation that comes with the ${pkgbase/linux/Linux} kernel"

  cd ${_srcname}
  local _builddir="${pkgdir}/usr/lib/modules/${_kernver}/build"

  mkdir -p "${_builddir}"
  cp -t "${_builddir}" -a Documentation

  # Fix permissions
  chmod -R u=rwX,go=rX "${_builddir}"
}

pkgname=("${pkgbase}" "${pkgbase}-headers" "${pkgbase}-docs")
for _p in ${pkgname[@]}; do
  eval "package_${_p}() {
    $(declare -f "_package${_p#${pkgbase}}")
    _package${_p#${pkgbase}}
  }"
done

# vim:set ts=8 sts=2 sw=2 et:
