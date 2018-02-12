# $Id$
# Maintainer: Pieter Lenaerts <pieter dot aj dot lenaerts at gmail>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgbase=linux-x205ta
_srcname=linux-4.15
pkgver=4.15.2
pkgrel=1
arch=('x86_64')
url="https://www.kernel.org/"
license=('GPL2')
makedepends=('xmlto' 'kmod' 'inetutils' 'bc' 'libelf')
options=('!strip')
source=(
  https://www.kernel.org/pub/linux/kernel/v4.x/${_srcname}.tar.{xz,sign}
  https://www.kernel.org/pub/linux/kernel/v4.x/patch-${pkgver}.{xz,sign}
  60-linux.hook  # pacman hook for depmod
  90-linux.hook  # pacman hook for initramfs regeneration
  linux.preset   # standard config files for mkinitcpio ramdisk
  0001-add-sysctl-to-disallow-unprivileged-CLONE_NEWUSER-by.patch
  0002-drm-i915-edp-Only-use-the-alternate-fixed-mode-if-it.patch
  0003-ssb-Do-not-disable-PCI-host-on-non-Mips.patch
  https://raw.githubusercontent.com/harryharryharry/x205ta-patches/master/4.15-patches/fix_c-state_patch_v4.15.patch
  https://raw.githubusercontent.com/harryharryharry/x205ta-patches/master/4.15-patches/Revert-several-pm-4.15-rc1-merges-for-low-power-suspend.patch
  https://raw.githubusercontent.com/harryharryharry/x205ta-patches/master/4.15-patches/Revert-several-pm-4.15-rc1-merges-for-low-power-suspend-2-rc6.patch
  https://raw.githubusercontent.com/harryharryharry/x205ta-patches/master/4.15-patches/rpmb.patch
  https://raw.githubusercontent.com/harryharryharry/x205ta-patches/master/4.15-patches/brcmfmac-p2p-and-normal-ap-access-are-not-always-possible-at-the-same-time.patch
  https://raw.githubusercontent.com/harryharryharry/x205ta-patches/master/4.15-patches/fix-null-hwmon-info.patch
  https://raw.githubusercontent.com/harryharryharry/x205ta-patches/master/4.15-patches/i2c_touch_fix_initialize_delay.patch
  #'9003-brcmfmac-properly-align-buffers-on-certain-platform-swith-64-bit-DMA.patch' # Excluding this patch. Not sure if it helps.
  'config_x205ta'  
)
validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
)
sha256sums=('5a26478906d5005f4f809402e981518d2b8844949199f60c4b6e1f986ca2a769'
            'SKIP'
            '812499c5d0cc5183606dc9388084df162ca2eb5fa374d8f8b00136fd82825847'
            'SKIP'
            'ae2e95db94ef7176207c690224169594d49445e04249d2499e9d2fbc117a0b21'
            '75f99f5239e03238f88d1a834c50043ec32b1dc568f2cc291b07d04718483919'
            'ad6344badc91ad0630caacde83f7f9b97276f80d26a20619a87952be65492c65'
            'b20e25656c9423591afd0325fe26320f50bc3421ff204acbfe5dd88ffb3866fe'
            '68575230693b374eb68e6100e719c71a196db57fe0ac79ddae02fe72b404e09e'
            'b21406c060cf601f879528cfa1b83f524c44d8ecd99689c331a7c6326653d0be'
            'e576fcf6b61c50b7ea358e9980c4d04901adfe9b050b87bf45506a8452202505'
            'dfc7fe519d8b95fbe263889ad8e432c55a89d915e905b7729a2ffc958c310754'
            '1772125253dbe3cd6e191bc8ab5c0297e294d4778857c9e90e22e4999af00929'
            'f69b0f127f8f1a2b4b34dedaf3c37ef3e561e75fea4de031993341a93c0456d9'
            'ad0f318809d074ee387f48fdfcb711b0fa3eb378867ac65c6da3d490834e649d'
            'e3e3873d7d5d781913e1e2f3a7968d0cf0967ee70be0db58bff91c31b37fabe8'
            'e9d407c4e437c6e93d8c985fcd496dee0115dcc6c616ee56129fe7a9e96bb746'
            '2d8638cc71ffa3277315a171a60bcb5fd7fd07e2c6e9c0a6d1615e15f9f647d7')


_kernelname=${pkgbase#linux}
: ${_kernelname:=-ARCH}

prepare() {
  cd ${_srcname}

  # add upstream patch
  patch -p1 -i ../patch-${pkgver}

  # add latest fixes from stable queue, if needed
  # http://git.kernel.org/?p=linux/kernel/git/stable/stable-queue.git

  # disable USER_NS for non-root users by default
  patch -Np1 -i ../0001-add-sysctl-to-disallow-unprivileged-CLONE_NEWUSER-by.patch

  # https://bugs.archlinux.org/task/56711
  patch -Np1 -i ../0002-drm-i915-edp-Only-use-the-alternate-fixed-mode-if-it.patch

  # https://bugs.archlinux.org/task/57327
  patch -Np1 -i ../0003-ssb-Do-not-disable-PCI-host-on-non-Mips.patch

  # Here start x205ta patches, refer to https://goo.gl/dcXIM0 for harryharryharry's guide which is the main starting point
  # for info on these patches.
  
  # patch attempts to prevents baytrail kernel freezes - thanks to jbMacAZ
  # refer to https://bugzilla.kernel.org/show_bug.cgi?id=109051#c829 for statement that this seems the more effective patch.
  # refer to https://drive.google.com/file/d/1uZeTQa6sWdtwXBIa8de5hkwEKeDeUR30/view for the patch, but to
  # https://drive.google.com/drive/folders/0B4s5KNXf2Z36Nkxac245LTBGdjQ for an overview of patches for ASUS T100H, where this
  # patch is published.
  patch -Np1 -i ../fix_c-state_patch_v4.15.patch

  # The next two patches come from harryharryharry and should bring a lower power suspend.
  # Refer to https://ubuntuforums.org/showthread.php?t=2254322&page=188&p=13735931#post13735931
  # and https://bugzilla.kernel.org/show_bug.cgi?id=198631
  patch -Rp1 -i ../Revert-several-pm-4.15-rc1-merges-for-low-power-suspend.patch
  patch -Rp1 -i ../Revert-several-pm-4.15-rc1-merges-for-low-power-suspend-2-rc6.patch

  # patch not needed anymore? Hide unnecessary mmcblkXrpmb block devices, which can cause hangups)
  # refer to https://dev-nell.com/rpmb-emmc-errors-under-linux.html
  # This patch is no longer needed, refer to https://github.com/torvalds/linux/commit/97548575bef38abd06690a5a6f6816200c7e77f7
  #patch -Np1 -i ../rpmb.patch

  # patch to hide dmesg errors of brcmfmac trying to enable a p2p device
  # refer to https://patchwork.kernel.org/patch/9592913/
  patch -Np1 -i ../brcmfmac-p2p-and-normal-ap-access-are-not-always-possible-at-the-same-time.patch

  # Sources for next two patches to be looked up.
  patch -Np1 -i ../fix-null-hwmon-info.patch
  patch -Np1 -i ../i2c_touch_fix_initialize_delay.patch

  # next patch reverts a patch in the mainline kernel which reduces wifi stability.
  # refer to https://github.com/torvalds/linux/commit/6e84ab604bdedaa16239bd1c6e5fcb5660309f02.diff
  # This patch does not work at this point. Not clear if it is needed either... TODO: find out if we need it...
  # patch -Np1 -i ../9003-brcmfmac-properly-align-buffers-on-certain-platform-swith-64-bit-DMA.patch

  # x205ta patches end here

  # copying the x205ta config.
  # harryharryharry's x205ta config file, updated to current package version.
  # Upstream is not always available and not always at the version of core-x86_64.
  # Upstream should be at http://x205ta.myftp.org:1337/kernel/.config

  # Config changes required to build more closely to arch.
  # Set the kernel name with a local version suffix: LOCALVERSION=-x205ta
  #
  # Harryharryharry seems to prefer STACK_VALIDATION and HAVE_STACK_VALIDATION = n , but arch's default kernel wants that to y.
  # That's related to the unwinder, where arch prefers ORC and not Frame point unwinder like H.
  # Therefore, don't forget to enable ORC unwinder, which enables STACK_VALIDATION, which provides objtool
  # In menuconfig, kernel hacking, choose kernel unwinder at bottom, ORC
  cp -Tf ../config_x205ta .config

  # Here ends x205ta stuff.

  # set extraversion to pkgrel
  sed -i "/^EXTRAVERSION =/s/=.*/= -${pkgrel}/" Makefile

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
  pkgdesc="The ${pkgbase/linux/Linux} kernel and modules, with patches and config for ASUS x205ta."
  [ "${pkgbase}" = "linux" ] && groups=('base')
  depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7')
  optdepends=('crda: to set the correct wireless channels of your country')
  backup=("etc/mkinitcpio.d/${pkgbase}.preset")
  install=linux.install

  cd ${_srcname}

  # get kernel version
  _kernver="$(make LOCALVERSION= kernelrelease)"
  _basekernel=${_kernver%%-*}
  _basekernel=${_basekernel%.*}

  mkdir -p "${pkgdir}"/{boot,usr/lib/modules}
  make LOCALVERSION= INSTALL_MOD_PATH="${pkgdir}/usr" modules_install
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
  sed "${_subst}" ../linux.preset |
    install -Dm644 /dev/stdin "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"

  # install pacman hooks
  sed "${_subst}" ../60-linux.hook |
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/libalpm/hooks/60-${pkgbase}.hook"
  sed "${_subst}" ../90-linux.hook |
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/libalpm/hooks/90-${pkgbase}.hook"
}

_package-headers() {
  pkgdesc="Header files and scripts for building modules for ${pkgbase/linux/Linux} kernel, with patches for ASUS x205ta."

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
  pkgdesc="Kernel hackers manual - HTML documentation that comes with the ${pkgbase/linux/Linux} kernel, with patches for ASUS x205ta."

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
