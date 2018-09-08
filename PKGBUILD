# $Id$
# Maintainer: shmilee <shmilee.zju@gmail.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

# longest and latest "longterm maintenance" kernel releases
# https://www.kernel.org/category/releases.html
# 4.4 Greg Kroah-Hartman 2016-01-10 2022-02
_LLL_VER=4.4
_LLL_SUBVER=136

# NUMA is optimized for multi-socket motherboards.
# A single multi-core CPU can actually run slower with NUMA enabled.
# Most users can disable NUMA.
# see, https://bugs.archlinux.org/task/31187
_NUMA_disable=y

# Add ck patch set
# http://ck.kolivas.org/patches/4.0/
# https://wiki.archlinux.org/index.php/Linux-ck
_CK_VER=1
_CK_PATCH="http://ck.kolivas.org/patches/4.0/${_LLL_VER}/${_LLL_VER}-ck${_CK_VER}/patch-${_LLL_VER}-ck${_CK_VER}.xz"

# Alternative I/O scheduler by Paolo Valente
_BFQ_VER=v7r11
_BFQ_URL="http://algo.ing.unimo.it/people/paolo/disk_sched/patches/4.4.0-${_BFQ_VER}"
_BFQ_PATCHS=("${_BFQ_URL}/0001-block-cgroups-kconfig-build-bits-for-BFQ-v7r11-4.4.0.patch"
             "${_BFQ_URL}/0002-block-introduce-the-BFQ-v7r11-I-O-sched-for-4.4.0.patch"
             "${_BFQ_URL}/0003-block-bfq-add-Early-Queue-Merge-EQM-to-BFQ-v7r11-for.patch")
# Set this if you want it enabled globally i.e. for all devices in your system
# If you want it enabled on a device-by-device basis, leave this unset and see:
# https://wiki.archlinux.org/index.php/Linux-ck#How_to_enable_the_BFQ_I.2FO_Scheduler
_BFQ_enable=

# Ultra Kernel Samepage Merging
_UKSM_VER=0.1.2.6
_UKSM_COMMIT=a00def1b1f3c36b37fdfff4a1b7b220459bbcad2
_UKSM_PATCH="https://raw.githubusercontent.com/dolohow/uksm/${_UKSM_COMMIT}/uksm-${_LLL_VER}.patch"

# CJKTTY patch 
# https://github.com/Gentoo-zh/linux-cjktty
# https://github.com/torvalds/linux/compare/v4.4...Gentoo-zh:4.4-utf8
_CJKTTY_PATCH_FILE=linux-cjktty-${_LLL_VER}.patch
_CJKTTY_PATCH_URL="https://github.com/torvalds/linux/compare/v${_LLL_VER}...Gentoo-zh:${_LLL_VER}-utf8.patch"
_CJKTTY_PATCH="${_CJKTTY_PATCH_FILE}::${_CJKTTY_PATCH_URL}"

_PATHSET_DESC="ck${_CK_VER} bfq-${_BFQ_VER} uksm-${_UKSM_VER} and cjktty"


pkgbase=linux-shmilee
pkgname=("${pkgbase}" "${pkgbase}-headers" "${pkgbase}-docs")
_srcname=linux-${_LLL_VER}
pkgver=${_LLL_VER}.${_LLL_SUBVER}
pkgrel=1
arch=('x86_64')
url="https://www.kernel.org/"
license=('GPL2')
makedepends=('kmod' 'inetutils' 'bc' 'libelf')
options=('!strip')
source=(
        "https://www.kernel.org/pub/linux/kernel/v4.x/${_srcname}.tar.xz"
        "https://www.kernel.org/pub/linux/kernel/v4.x/${_srcname}.tar.sign"
        "https://www.kernel.org/pub/linux/kernel/v4.x/patch-${pkgver}.xz"
        "https://www.kernel.org/pub/linux/kernel/v4.x/patch-${pkgver}.sign"
        ${_CK_PATCH}
        ${_BFQ_PATCHS[@]}
        ${_UKSM_PATCH}
        'uksm-patch-for-4.4.74+.patch'
        ${_CJKTTY_PATCH}
        'linux-cjktty-patch-for-4.4.100+.patch'
        'config'         # the main kernel config file
        '60-linux.hook'  # pacman hook for depmod
        '90-linux.hook'  # pacman hook for initramfs regeneration
        'linux.preset'   # standard config files for mkinitcpio ramdisk
        '0001-add-sysctl-to-disallow-unprivileged-CLONE_NEWUSER-by.patch'
)
validpgpkeys=(
              'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linus Torvalds
              '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman 
)
# https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
sha256sums=('401d7c8fef594999a460d10c72c5a94e9c2e1022f16795ec51746b0d165418b2'
            'SKIP'
            'ce2d693d58bc52c78c9beb93613ea3dc42243d31837c4a290912aaf63f942714'
            'SKIP'
            'a800a076e7f9ab07e8baee33919f8731087f876000f8ab6a327521a7a772838f'
            'd1cf14cc696b0f716454fe8eb9746383700889d5d22ad829611f0433cc77b4ce'
            'b17c3fb18c5b8c20a45a38198f293679ca6aef08d16f12cd816a5cfafac4b2c4'
            '69a21bc286a628128cfc4723558829cb6ff6c2d7c4dfd4468457898674187b25'
            '58fbfa57e46cb480a74d199799d3620bd650e64147a2f05d6ddd5ecde699d84c'
            'cbdfae2079618500533bfdc4edf27382cca2a733b56726d587078c2e0751c060'
            '0b860e2514b0a08d98350ba417877b5f63d35c65cc6fc5fa9f6ab4df7dd2d8c7'
            '2d37c03fc8fd6e3d124e2ec7f9fd9885316bdd2c0654dddb4e427dab3d67d270'
            '71d60594577b59596166add0318a8ce187c8de7787659925371ddc21b40437e5'
            'ae2e95db94ef7176207c690224169594d49445e04249d2499e9d2fbc117a0b21'
            '75f99f5239e03238f88d1a834c50043ec32b1dc568f2cc291b07d04718483919'
            'ad6344badc91ad0630caacde83f7f9b97276f80d26a20619a87952be65492c65'
            '36b1118c8dedadc4851150ddd4eb07b1c58ac5bbf3022cc2501a27c2b476da98')

_kernelname=${pkgbase#linux}

prepare() {
  cd ${_srcname}

  # add upstream patch
  patch -p1 -i ../patch-${pkgver}

  # add latest fixes from stable queue, if needed
  # http://git.kernel.org/?p=linux/kernel/git/stable/stable-queue.git

  # disable USER_NS for non-root users by default
  patch -Np1 -i ../0001-add-sysctl-to-disallow-unprivileged-CLONE_NEWUSER-by.patch

  # fix naming schema in EXTRAVERSION of ck patch set
  sed -i -re "s/^(.EXTRAVERSION).*$/\1 = /" "../patch-${_LLL_VER}-ck${_CK_VER}"
  # Patch source with ck patch set
  msg "Patching source with ck${_CK_VER} including BFS"
  patch -Np1 -i "../patch-${_LLL_VER}-ck${_CK_VER}"

  msg "Patching source with BFQ ${_BFQ_VER} patches"
  for p in ${_BFQ_PATCHS[@]}; do
    patch -Np1 -i "../$(basename $p)"
  done

  msg "Patching source with uksm ${_UKSM_VER} patches"
  cp "../uksm-${_LLL_VER}.patch" "../uksm-${_LLL_VER}.${_LLL_SUBVER}.patch"
  patch -i ../uksm-patch-for-4.4.74+.patch "../uksm-${_LLL_VER}.${_LLL_SUBVER}.patch"
  patch -Np1 -i "../uksm-${_LLL_VER}.${_LLL_SUBVER}.patch"

  msg "Patching source with Gentoo-zh/linux-cjktty patches"
  cp "../${_CJKTTY_PATCH_FILE}" "../${_CJKTTY_PATCH_FILE}.${_LLL_SUBVER}.patch"
  patch -i ../linux-cjktty-patch-for-4.4.100+.patch "../${_CJKTTY_PATCH_FILE}.${_LLL_SUBVER}.patch"
  patch -Np1 -i "../${_CJKTTY_PATCH_FILE}.${_LLL_SUBVER}.patch"

  cp -Tf ../config .config

  if [ "${_kernelname}" != "" ]; then
    sed -i "s|CONFIG_LOCALVERSION=.*|CONFIG_LOCALVERSION=\"${_kernelname}\"|g" ./.config
    sed -i "s|CONFIG_LOCALVERSION_AUTO=.*|CONFIG_LOCALVERSION_AUTO=n|" ./.config
  fi

  # set extraversion to pkgrel
  sed -ri "s|^(EXTRAVERSION =).*|\1 -${pkgrel}|" Makefile

  # Optionally disable NUMA for 64-bit kernels only
  if [ -n "$_NUMA_disable" ] && [ "${CARCH}" = "x86_64" ]; then
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

  # Optionally enable BFQ as the default I/O scheduler
  if [ -n "$_BFQ_enable" ]; then
    msg "Setting BFQ as default I/O scheduler..."
    sed -i -e 's|CONFIG_DEFAULT_IOSCHED=.*|CONFIG_DEFAULT_IOSCHED="bfq"|' \
        -i -e 's|CONFIG_DEFAULT_DEADLINE=y|# CONFIG_DEFAULT_DEADLINE is not set\nCONFIG_DEFAULT_BFQ=y|' \
        -i -e 's|CONFIG_DEFAULT_CFQ=y|# CONFIG_DEFAULT_CFQ is not set\nCONFIG_DEFAULT_BFQ=y|' ./.config
  fi

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
  pkgdesc="The ${pkgbase/linux/Linux} kernel and modules with the ${_PATHSET_DESC} patchsets"
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
  local _extramodules="extramodules-${_basekernel}${_kernelname:--ARCH}"
  ln -s "../${_extramodules}" "${pkgdir}/usr/lib/modules/${_kernver}/extramodules"

  # add real version for building modules and running depmod from hook
  echo "${_kernver}" |
    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modules/${_extramodules}/version"

  # remove build and source links
  rm "${pkgdir}"/usr/lib/modules/${_kernver}/{source,build}

  # remove the firmware
  rm -rf "${pkgdir}/usr/lib/firmware"

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

for _p in ${pkgname[@]}; do
  eval "package_${_p}() {
    $(declare -f "_package${_p#${pkgbase}}")
    _package${_p#${pkgbase}}
  }"
done
