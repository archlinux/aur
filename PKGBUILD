# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgbase=linux-clear
__basekernel=4.15
_minor=14
pkgver=${__basekernel}.${_minor}
_clearver=${__basekernel}.14-538
pkgrel=1
arch=('x86_64')
url="https://github.com/clearlinux-pkgs/linux"
license=('GPL2')
makedepends=('bc' 'git' 'inetutils' 'kmod' 'libelf' 'linux-firmware' 'xmlto')
options=('!strip')
source=(
  "https://www.kernel.org/pub/linux/kernel/v4.x/linux-${__basekernel}.tar.xz"
  "https://www.kernel.org/pub/linux/kernel/v4.x/linux-${__basekernel}.tar.sign"
  "https://www.kernel.org/pub/linux/kernel/v4.x/patch-${pkgver}.xz"
  "https://www.kernel.org/pub/linux/kernel/v4.x/patch-${pkgver}.sign"
  "clearlinux::git+https://github.com/clearlinux-pkgs/linux.git#tag=${_clearver}"
  'https://downloadmirror.intel.com/27591/eng/microcode-20180312.tgz'
  '60-linux.hook'  # pacman hook for depmod
  '90-linux.hook'  # pacman hook for initramfs regeneration
  '99-linux.hook'  # pacman hook for remove initramfs
  'linux.preset'   # standard config files for mkinitcpio ramdisk
)
validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
)
sha256sums=('5a26478906d5005f4f809402e981518d2b8844949199f60c4b6e1f986ca2a769'
            'SKIP'
            '6be2c185839d730769a8e6bcf46ca0962845732e25ed4801fe1ea995218b1133'
            'SKIP'
            'SKIP'
            '0b381face2df1b0a829dc4fa8fa93f47f39e11b1c9c22ebd44f8614657c1e779'
            'ae2e95db94ef7176207c690224169594d49445e04249d2499e9d2fbc117a0b21'
            '75f99f5239e03238f88d1a834c50043ec32b1dc568f2cc291b07d04718483919'
            '5f6ba52aaa528c4fa4b1dc097e8930fad0470d7ac489afcb13313f289ca32184'
            'ad6344badc91ad0630caacde83f7f9b97276f80d26a20619a87952be65492c65')

_kernelname=${pkgbase#linux}

prepare() {
  cd linux-${__basekernel}
  
  # add upstream patch
  patch -p1 -i ../patch-${pkgver}
  
  cp -Tf $srcdir/clearlinux/config .config
  cp -a /usr/lib/firmware/i915 firmware/
  cp -a ${srcdir}/intel-ucode firmware/
  rm -f firmware/intel-ucode/0f*

  # Apply clearlinux patches
  for i in $(grep "^Patch" ${srcdir}/clearlinux/linux.spec | grep -v 'zero-regs.patch' | sed -n 's/.*: //p'); do
    msg "Applying ${i}"
    patch -p1 -i "$srcdir/clearlinux/${i}"
  done
  
  if [ "${_kernelname}" != "" ]; then
    sed -i "s|CONFIG_LOCALVERSION=.*|CONFIG_LOCALVERSION=\"${_kernelname}\"|g" ./.config
    sed -i "s|CONFIG_LOCALVERSION_AUTO=.*|CONFIG_LOCALVERSION_AUTO=n|" ./.config
  fi

  # set extraversion to pkgrel and empty localversion
  sed -e "/^EXTRAVERSION =/s/=.*/= -${pkgrel}/" \
      -e "/^EXTRAVERSION =/aLOCALVERSION =" \
      -i Makefile

  # don't run depmod on 'make install'. We'll do this ourselves in packaging
  sed -i '2iexit 0' scripts/depmod.sh

  make olddefconfig
}

build() {
  cd linux-${__basekernel}

  make bzImage modules
}

_package() {
  pkgdesc="The ${pkgbase/linux/Linux} kernel and modules"
  depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7')
  optdepends=('crda: to set the correct wireless channels of your country')
  backup=("etc/mkinitcpio.d/${pkgbase}.preset")
  install=linux.install

  cd linux-${__basekernel}

  # get kernel version
  _kernver="$(make kernelrelease)"
  _basekernel=${_kernver%%-*}
  _basekernel=${_basekernel%.*}

  mkdir -p "${pkgdir}"/{boot,usr/lib/modules}
  make INSTALL_MOD_PATH="${pkgdir}/usr" modules_install
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
  sed "${_subst}" ../linux.preset |
    install -Dm644 /dev/stdin "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"

  # install pacman hooks
  sed "${_subst}" ../60-linux.hook |
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/libalpm/hooks/60-${pkgbase}.hook"
  sed "${_subst}" ../90-linux.hook |
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/libalpm/hooks/90-${pkgbase}.hook"
  sed "${_subst}" ../99-linux.hook |
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/libalpm/hooks/99-${pkgbase}.hook"
}

_package-headers() {
  pkgdesc="Header files and scripts for building modules for ${pkgbase/linux/Linux} kernel"

  cd linux-${__basekernel}
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
  pkgdesc="Kernel hackers manual - HTML documentation that comes with the ${pkgbase/linux/Linux} kernel"

  cd linux-${__basekernel}
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
