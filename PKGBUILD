# Maintainer: Leonidas Spyropoulos <artafinde AT gmail DOT com>
# Credit to graysky for shamelessly copying PKGBUILD from linux-ck

### BUILD OPTIONS
# Set these variables to ANYTHING that is not null to enable them

# Tweak kernel options prior to a build via nconfig
_makenconfig=

# NUMA is optimized for multi-socket motherboards. A single multi-core CPU can
# actually run slower with NUMA enabled. Most users will want to set this option
# to enabled ... in other words, do not use NUMA on a single CPU system.
#
# See, https://bugs.archlinux.org/task/31187
_NUMAdisable=y

# Compile ONLY probed modules
# As of mainline 2.6.32, running with this option will only build the modules
# that you currently have probed in your system VASTLY reducing the number of
# modules built and the build time to do it.
#
# WARNING - ALL modules must be probed BEFORE you begin making the pkg!
#
# To keep track of which modules are needed for your specific system/hardware,
# give module_db script a try: https://aur.archlinux.org/packages/modprobed-db
# This PKGBUILD will call it directly to probe all the modules you have logged!
#
# More at this wiki page ---> https://wiki.archlinux.org/index.php/Modprobed-db
_localmodcfg=

### IMPORTANT: Do no edit below this line unless you know what you're doing

pkgbase=linux-gc             # Build kernel with a different name
_srcname=linux-4.15
pkgver=4.15.13
pkgrel=1
_pdsversion=098k
arch=('x86_64')
url="https://www.kernel.org/"
license=('GPL2')
makedepends=('kmod' 'inetutils' 'bc' 'libelf')
options=('!strip')
_psd_patch="v4.15_pds${_pdsversion}.patch"
_gcc_more_v='20180310'
source=(
  https://www.kernel.org/pub/linux/kernel/v4.x/${_srcname}.tar.{xz,sign}
  https://www.kernel.org/pub/linux/kernel/v4.x/patch-${pkgver}.{xz,sign}
  config         # the main kernel config file
  60-linux.hook  # pacman hook for depmod
  90-linux.hook  # pacman hook for initramfs regeneration
  linux.preset   # standard config files for mkinitcpio ramdisk
  "enable_additional_cpu_optimizations-$_gcc_more_v.tar.gz::https://github.com/graysky2/kernel_gcc_patch/archive/$_gcc_more_v.tar.gz" # enable_additional_cpu_optimizations_for_gcc
  "$_psd_patch::https://bitbucket.org/alfredchen/linux-gc/downloads/v4.15_pds098k.patch"
  0001-add-sysctl-to-disallow-unprivileged-CLONE_NEWUSER-by.patch
  0002-drm-i915-edp-Only-use-the-alternate-fixed-mode-if-it.patch
)
validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
)
sha256sums=('5a26478906d5005f4f809402e981518d2b8844949199f60c4b6e1f986ca2a769'
            'SKIP'
            'f1bc5cfc7316daa463cd0ed366e376eb24a29072491c29a68732e1edf8a6ef8b'
            'SKIP'
            'de916051cb9ed866d494184da6355be199b1794a9b2b480a5e36d156942f50fb'
            'ae2e95db94ef7176207c690224169594d49445e04249d2499e9d2fbc117a0b21'
            '75f99f5239e03238f88d1a834c50043ec32b1dc568f2cc291b07d04718483919'
            'ad6344badc91ad0630caacde83f7f9b97276f80d26a20619a87952be65492c65'
            'b2c1292e06544465b636543e6ac8a01959470d32ce3664460721671f1347c815'
            'feb342d7f560730908ce1d5a795a5cd817dbe28a5286d727d93666dfa0d8749c'
            '19b17156ea5aec86e4eb87fc855789375a5184faf564b4ac2cd0f279de7b3bf9'
            'f49e23e2a00357f8a5f6cc5caadd56a4df2b0a3e2b53d76a514ca508f25a62a7')

_kernelname=${pkgbase#linux}

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

  # add PDS scheduler
  patch -Np1 -i "../${_psd_patch}"

  # Patch source to unlock additional gcc CPU optimizatons
  # https://github.com/graysky2/kernel_gcc_patch
  patch -Np1 -i "../kernel_gcc_patch-$_gcc_more_v/enable_additional_cpu_optimizations_for_gcc_v4.9+_kernel_v4.13+.patch"

  make mrproper

  cat ../config - >.config <<END
CONFIG_LOCALVERSION="${_kernelname}"
CONFIG_LOCALVERSION_AUTO=n
END

  # set extraversion to pkgrel and empty localversion
  sed -e "/^EXTRAVERSION =/s/=.*/= -${pkgrel}/" \
      -e "/^EXTRAVERSION =/aLOCALVERSION =" \
      -i Makefile

  ### Optionally disable NUMA for 64-bit kernels only
  # (x86 kernels do not support NUMA)
  if [ -n "$_NUMAdisable" ]; then
    msg "Disabling NUMA from kernel config..."
    sed -i -e 's/CONFIG_NUMA=y/# CONFIG_NUMA is not set/' \
      -i -e '/CONFIG_AMD_NUMA=y/d' \
      -i -e '/CONFIG_X86_64_ACPI_NUMA=y/d' \
      -i -e '/CONFIG_NODES_SPAN_OTHER_NODES=y/d' \
      -i -e '/# CONFIG_NUMA_EMU is not set/d' \
      -i -e '/CONFIG_NODES_SHIFT=6/d' \
      -i -e '/CONFIG_NEED_MULTIPLE_NODES=y/d' \
      -i -e '/# CONFIG_MOVABLE_NODE is not set/d' \
      -i -e '/CONFIG_USE_PERCPU_NUMA_NODE_ID=y/d' \
      -i -e '/CONFIG_ACPI_NUMA=y/d' ./.config
  fi

  # don't run depmod on 'make install'. We'll do this ourselves in packaging
  sed -i '2iexit 0' scripts/depmod.sh

  # get kernel version
  make prepare

  ### Optionally load needed modules for the make localmodconfig
  # See https://aur.archlinux.org/packages/modprobed-db
    if [ -n "$_localmodcfg" ]; then
    msg "If you have modprobed-db installed, running it in recall mode now"
    if [ -e /usr/bin/modprobed-db ]; then
      [[ -x /usr/bin/sudo ]] || {
      echo "Cannot call modprobe with sudo. Install sudo and configure it to work with this user."
      exit 1; }
      sudo /usr/bin/modprobed-db recall
    fi
    msg "Running Steven Rostedt's make localmodconfig now"
    make localmodconfig
  fi

  [[ -z "$_makenconfig" ]] || make nconfig

  # rewrite configuration
  yes "" | make config >/dev/null

  # save configuration for later reuse
  cat .config > "${startdir}/config.last"
}

build() {
  cd ${_srcname}

  make bzImage modules
}

_package() {
  pkgdesc="The ${pkgbase/linux/Linux} kernel and modules with the PDS-mq CPU scheduler"
  depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7')
  optdepends=('crda: to set the correct wireless channels of your country')
  provides=("linux-gc=${pkgver}")
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
  pkgdesc="Header files and scripts for building modules for ${pkgbase/linux/Linux} kernel"
  depends=('linux-gc')
  provides=("linux-gc-headers=${pkgver}" "linux-headers=${pkgver}")

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

pkgname=("${pkgbase}" "${pkgbase}-headers")
for _p in ${pkgname[@]}; do
  eval "package_${_p}() {
    $(declare -f "_package${_p#${pkgbase}}")
    _package${_p#${pkgbase}}
  }"
done

# vim:set ts=8 sts=2 sw=2 et:
