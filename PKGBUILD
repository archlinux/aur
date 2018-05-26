# $Id$
# Maintainer: Pieter Lenaerts <pieter dot aj dot lenaerts at gmail>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgbase=linux-x205ta
_srcname=linux-4.16
pkgver=4.16.11
pkgrel=1
arch=('x86_64')
url="https://www.kernel.org/"
license=('GPL2')
makedepends=('xmlto' 'kmod' 'inetutils' 'bc' 'libelf')
options=('!strip')
source=(
  https://www.kernel.org/pub/linux/kernel/v4.x/${_srcname}.tar.{xz,sign}
  https://www.kernel.org/pub/linux/kernel/v4.x/patch-${pkgver}.{xz,sign}
  config         # the main kernel config file
  60-linux.hook  # pacman hook for depmod
  90-linux.hook  # pacman hook for initramfs regeneration
  linux.preset   # standard config files for mkinitcpio ramdisk
  0001-add-sysctl-to-disallow-unprivileged-CLONE_NEWUSER-by.patch
  0002-drm-i915-edp-Only-use-the-alternate-fixed-mode-if-it.patch

  https://raw.githubusercontent.com/harryharryharry/x205ta-iso2usb-files/master/brcmfmac43340-sdio.txt
  https://raw.githubusercontent.com/harryharryharry/x205ta-patches/master/4.16-patches/i915-pm-Be-less-agressive-with-clockfreq-changes-on-Bay-Trail.patch
  https://raw.githubusercontent.com/harryharryharry/x205ta-patches/master/4.16-patches/intel_idle-Disable-C6N-and-C6S-on-Bay-Trail.patch
  https://raw.githubusercontent.com/harryharryharry/x205ta-patches/master/4.16-patches/fix_c-state_patch_v4.16.patch
  https://raw.githubusercontent.com/harryharryharry/x205ta-patches/master/4.16-patches/brcmfmac-p2p-and-normal-ap-access-are-not-always-possible-at-the-same-time.patch

# Not sure if we want these...
#  https://github.com/harryharryharry/x205ta-patches/blob/master/4.16-patches/allow-s0i3-suspend-unified-4.16.patch # Patcher calls them dirty hacky.
#  '9003-brcmfmac-properly-align-buffers-on-certain-platform-swith-64-bit-DMA.patch' # Excluding this patch. Not sure if it helps.

# Old patches
#  https://raw.githubusercontent.com/harryharryharry/x205ta-patches/master/4.15-patches/rpmb.patch # Not needed anymore, this is fixed in commit https://github.com/torvalds/linux/commit/97548575bef38abd06690a5a6f6816200c7e77f7#diff-97193d232cb936779745c948ee14e56e
#  https://raw.githubusercontent.com/harryharryharry/x205ta-patches/master/4.15-patches/fix-null-hwmon-info.patch # Fixed in https://github.com/torvalds/linux/commit/e782bc169cd02d3411a6db6ff0c26d7f27f8b81a
#  https://raw.githubusercontent.com/harryharryharry/x205ta-patches/master/4.15-patches/i2c_touch_fix_initialize_delay.patch # This patch does not apply anymore and the logic setting the var value became a lot smarter. Guessing its not needed anymore.
)
validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
)
sha256sums=('63f6dc8e3c9f3a0273d5d6f4dca38a2413ca3a5f689329d05b750e4c87bb21b9'
            'SKIP'
            'd0d998f193c3feeab95f1378dea15aa6ba145f591661547cc00ef16d161651fe'
            'SKIP'
            'b4961bd274997ba09dc72fb1cd88df4df307fd851871c300250484e233cd1d5f'
            'ae2e95db94ef7176207c690224169594d49445e04249d2499e9d2fbc117a0b21'
            '75f99f5239e03238f88d1a834c50043ec32b1dc568f2cc291b07d04718483919'
            'ad6344badc91ad0630caacde83f7f9b97276f80d26a20619a87952be65492c65'
            'b01e9bd4e0f3cc2b91db1d8c043b2d85329bd0c9a9441a91d337c3c33661b658'
            '09170daf49fe4cb720f331cd2da1c75771eb4f9f124353bf035218b1f8ca57d1'
            'aea75c0b07673f701856e3c2a35db33c041fdaf0bd5ef2927fb25b1bce2c2b62'
            '5ad7e021452deffd387a5b81abcd0f608f8141eaab56fbdd162ca0b7966fc3b4'
            '3845aeb3744372b716c668283b23972d76e482d8c69b107e13a13669e5671d06'
            '3dc0c5c42fa0957086fc8e5e0076baff7234d5aad73b0c71bcae7119d43f40fa'
            'ad0f318809d074ee387f48fdfcb711b0fa3eb378867ac65c6da3d490834e649d')


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

  # Here start x205ta patches
  # Refer to https://github.com/harryharryharry/x205ta-patches for harryharryharry's gathered patches
  # Refer to https://ubuntuforums.org/showthread.php?t=2254322&page=158&p=13625163#post13625163 for harryharryharry's kernel compile guide

  # Install wifi firmware with 5 Ghz support.
  # Refer to https://ubuntuforums.org/showthread.php?t=2254322&page=192&p=13756881#post13756881
  mkdir -p ${pkgdir}/usr/lib/firmware/brcm/
  cp ${srcdir}/brcmfmac43340-sdio.txt ${pkgdir}/usr/lib/firmware/brcm/

  # patch attempts to prevents baytrail kernel freezes - thanks to jbMacAZ
  # refer to https://bugzilla.kernel.org/show_bug.cgi?id=109051#c829 for statement that this seems the more effective patch.
  # refer to https://drive.google.com/file/d/1uZeTQa6sWdtwXBIa8de5hkwEKeDeUR30/view for the patch, but to
  # https://drive.google.com/drive/folders/0B4s5KNXf2Z36Nkxac245LTBGdjQ for an overview of patches for ASUS T100H, where this
  # patch is published.
  patch -Np1 -i ../fix_c-state_patch_v4.16.patch

  # The next two patches come from Hans De Goede and should bring a lower power suspend.
  # Refer to https://github.com/jwrdegoede/linux-sunxi/commit/2a02df1192d2718ac7eaa871e2941840375f1e8c
  # and https://github.com/jwrdegoede/linux-sunxi/commit/bdb7d50f49e758ce78a59e894f9be98db6e15049
  patch -Np1 -i ../i915-pm-Be-less-agressive-with-clockfreq-changes-on-Bay-Trail.patch
  patch -Np1 -i ../intel_idle-Disable-C6N-and-C6S-on-Bay-Trail.patch

  # patch to hide dmesg errors of brcmfmac trying to enable a p2p device
  # refer to https://patchwork.kernel.org/patch/9592913/
  patch -Np1 -i ../brcmfmac-p2p-and-normal-ap-access-are-not-always-possible-at-the-same-time.patch

  # x205ta patches end here

  # copying the x205ta config.
  # harryharryharry's x205ta config file, updated to current package version.
  # Upstream is not always available and not always at the version of core-x86_64.
  # Upstream should be at http://x205ta.myftp.org:1337/kernel/.config

  # Config changes required to build more closely to arch.

  # Harryharryharry seems to prefer STACK_VALIDATION and HAVE_STACK_VALIDATION = n , but arch's default kernel wants that to y.
  # That's related to the unwinder, where arch prefers ORC and not Frame point unwinder like H.
  # Therefore, don't forget to enable ORC unwinder, which enables STACK_VALIDATION, which provides objtool, which is required later on to package headers.
  # In menuconfig, kernel hacking, choose kernel unwinder at bottom, ORC
  #cp -Tf ../config_x205ta .config

  # Remove existing LOCALVERSION stuff from .config

  # Here ends x205ta stuff.
  cat ../config - >.config <<END
CONFIG_LOCALVERSION="${_kernelname}"
CONFIG_LOCALVERSION_AUTO=n
END

  # set extraversion to pkgrel and empty localversion
  sed -e "/^EXTRAVERSION =/s/=.*/= -${pkgrel}/" \
      -e "/^EXTRAVERSION =/aLOCALVERSION =" \
      -i Makefile

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
  pkgdesc="The ${pkgbase/linux/Linux} kernel and modules, with patches and config for ASUS x205ta."
  [ "${pkgbase}" = "linux" ] && groups=('base')
  depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7')
  optdepends=('crda: to set the correct wireless channels of your country')
  backup=("etc/mkinitcpio.d/${pkgbase}.preset")
  install=linux.install

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
