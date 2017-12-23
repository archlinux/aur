# $Id$
# Maintainer:  Joakim Hernberg <jbh@alchemy.lu>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: timbosa <tinny_tim@dodo.com.au>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>

#pkgbase=linux               # Build stock -ARCH kernel
pkgbase=linux-rt             # Build kernel with a different name
_srcname=linux-4.14
_pkgver=4.14.8
_rtpatchver=rt9
pkgver=${_pkgver}_${_rtpatchver}
pkgrel=2
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
  "https://www.kernel.org/pub/linux/kernel/projects/rt/4.14/older/patch-${_pkgver}-${_rtpatchver}.patch.xz"
  "https://www.kernel.org/pub/linux/kernel/projects/rt/4.14/older/patch-${_pkgver}-${_rtpatchver}.patch.sign"
  'config'         # the main kernel config file
  '60-linux-rt.hook'  # pacman hook for depmod
  '90-linux-rt.hook'  # pacman hook for initramfs regeneration
  'linux-rt.preset'   # standard config files for mkinitcpio ramdisk
  0001-add-sysctl-to-disallow-unprivileged-CLONE_NEWUSER-by.patch
  0001-e1000e-Fix-e1000_check_for_copper_link_ich8lan-retur.patch
  0002-dccp-CVE-2017-8824-use-after-free-in-DCCP-code.patch
  0001-drm-i915-Avoid-PPS-HW-SW-state-mismatch-due-to-rounding.patch
  0001-ALSA-usb-audio-Fix-the-missing-ctl-name-suffix-at-pa.patch
  fix-race-in-PRT-wait-for-completion-simple-wait-code_Nvidia-RT-160319.patch
)
validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
  '64254695FFF0AA4466CC19E67B96E8162A8CF5D1'  # Sebastian Andrzej Siewior
  '5ED9A48FC54C0A22D1D0804CEBC26CDB5A56DE73'  # Steven Rostedt
  'E644E2F1D45FA0B2EAA02F33109F098506FF0B14'  # Thomas Gleixner
)
sha256sums=('f81d59477e90a130857ce18dc02f4fbe5725854911db1e7ba770c7cd350f96a7'
            'SKIP'
            '42eaed731b716244514b765c199e8f675d79287d7630e5c2911053ad52a1fa0a'
            'SKIP'
            'd33042049f8c402efd23ae3c730b19259012d8b2490dfcb658e99921daf05d2b'
            'SKIP'
            'b2575e179c4648a771f94bd47f06002615dc8049f24a9dc0ad21149877e9a0f6'
            'ae2e95db94ef7176207c690224169594d49445e04249d2499e9d2fbc117a0b21'
            '75f99f5239e03238f88d1a834c50043ec32b1dc568f2cc291b07d04718483919'
            'ad6344badc91ad0630caacde83f7f9b97276f80d26a20619a87952be65492c65'
            '3ef4c7875f0965ac86aa64ce6c2a7e06ca0066d75df51d07db0f11a52160b8dd'
            'ac203ad289f4b0782fe94487450863aaf796cf06e60a09ee097bd8c4338c9572'
            '93f08a383189664579b07b1d7da2a54a8b758bcf03926bf4947484bb4bf4fb4c'
            'b0396825ecd293499907ad86a0eb642cd5e82e534619f95658438ee6ecff10eb'
            'cbf586270595a89835dc02602983028f4cea80c40a43be3d4871dae4fdb46b84'
            '85f7612edfa129210343d6a4fe4ba2a4ac3542d98b7e28c8896738e7e6541c06')

_kernelname=${pkgbase#linux}

prepare() {
  cd ${_srcname}

  # add upstream patch
  patch -p1 -i ../patch-${_pkgver}

  # security patches

  # add latest fixes from stable queue, if needed
  # http://git.kernel.org/?p=linux/kernel/git/stable/stable-queue.git

  # disable USER_NS for non-root users by default
  patch -Np1 -i ../0001-add-sysctl-to-disallow-unprivileged-CLONE_NEWUSER-by.patch

  # https://bugs.archlinux.org/task/56575
  patch -Np1 -i ../0001-e1000e-Fix-e1000_check_for_copper_link_ich8lan-retur.patch

  # https://nvd.nist.gov/vuln/detail/CVE-2017-8824
  patch -Np1 -i ../0002-dccp-CVE-2017-8824-use-after-free-in-DCCP-code.patch

  # fix a harmless i915 boot up msg
  msg "applying 0001-drm-i915-Avoid-PPS-HW-SW-state-mismatch-due-to-rounding.patch"
  patch -Np1 -i ../0001-drm-i915-Avoid-PPS-HW-SW-state-mismatch-due-to-rounding.patch

  # fix a problem with USB audio
  msg "0001-ALSA-usb-audio-Fix-the-missing-ctl-name-suffix-at-pa.patch"
  patch -Np1 -i ../0001-ALSA-usb-audio-Fix-the-missing-ctl-name-suffix-at-pa.patch

  # add realtime patch
  msg "applying patch-${_pkgver}-${_rtpatchver}.patch"
  patch -Np1 -i ../patch-${_pkgver}-${_rtpatchver}.patch

  # A patch to fix a problem that ought to be fixed in the NVIDIA source code.
  # Stops X from hanging on certain NVIDIA cards
  msg "fix-race-in-PRT-wait-for-completion-simple-wait-code_Nvidia-RT-160319.patch"
  patch -Np1 -i ../fix-race-in-PRT-wait-for-completion-simple-wait-code_Nvidia-RT-160319.patch

  msg "All patches have successfully been applied"

  cp -Tf ../config .config

  if [ "${_kernelname}" != "" ]; then
    sed -i "s|CONFIG_LOCALVERSION=.*|CONFIG_LOCALVERSION=\"-${pkgrel}${_kernelname}\"|g" ./.config
    sed -i "s|CONFIG_LOCALVERSION_AUTO=.*|CONFIG_LOCALVERSION_AUTO=n|" ./.config
  fi

  # set extraversion to pkgrel
#  sed -ri "s|^(EXTRAVERSION =).*|\1 -${pkgrel}|" Makefile

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

  make ${MAKEFLAGS} LOCALVERSION= bzImage modules
}

_package() {
  pkgdesc="The ${pkgbase/linux/Linux} kernel and modules"
  [ "${pkgbase}" = "linux" ] && groups=('base')
  depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7')
  optdepends=('crda: to set the correct wireless channels of your country')
  backup=("etc/mkinitcpio.d/${pkgbase}.preset")
  install="${pkgbase}.install"

  cd ${_srcname}

  # get kernel version
  _kernver="$(make LOCALVERSION= kernelrelease)"
  _basekernel=${_kernver%%-*}
  _basekernel=${_basekernel%.*}

  mkdir -p "${pkgdir}"/{boot,usr/lib/modules}
  make LOCALVERSION= INSTALL_MOD_PATH="${pkgdir}/usr" modules_install
  cp arch/x86/boot/bzImage "${pkgdir}/boot/vmlinuz-${pkgbase}"

  # make room for external modules
  local _extramodules="extramodules-${_basekernel}${_kernelname:--ARCH}"
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

  # http://bugs.archlinux.org/task/9912
  install -Dt "${_builddir}/drivers/media/dvb-core" -m644 drivers/media/dvb-core/*.h

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
