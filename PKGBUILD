# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

### BUILD OPTIONS
# Set these variables to ANYTHING that is not null to enable them


# Running with a 1000 Hz tick rate is recommanded 
# http://ck.kolivas.org/patches/bfs/bfs-faq.txt
_1k_Hz_ticks=y

# Tweak kernel options prior to a build via nconfig
#_makenconfig=

# NUMA is optimized for multi-socket motherboards.
# A single multi-core CPU actually runs slower with NUMA enabled.
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
#_localmodcfg=y

# Use the current kernel's .config file
# Enabling this option will use the .config of the RUNNING kernel rather than
# the ARCH defaults. Useful when the package gets updated and you already went
# through the trouble of customizing your config options.  NOT recommended when
# a new kernel is released, but again, convenient for package bumps.
#_use_current=y

# Alternative I/O scheduler by Paolo Valente
# Set this if you want it enabled globally i.e. for all devices in your system
# If you want it enabled on a device-by-device basis, leave this unset and see:
# https://wiki.archlinux.org/index.php/Linux-ck#How_to_Enable_the_BFQ_I.2FO_Scheduler
_BFQ_enable_=y

### Do no edit below this line unless you know what you're doing

pkgbase=linux-think
pkgdesc="Linux kernel with patches for Lenovo Think T530. It contains: ck, fbcondecor patch and changes required for VGA passthrough (for experiments)"
_srcname=linux-4.6
_ckpatchname="patch-4.6-ck1"
pkgver=4.6.2
pkgrel=3
arch=("i686" "x86_64")
url="http://www.kernel.org/"
license=("GPL2")
makedepends=("xmlto" 
"docbook-xsl" 
"kmod" 
"inetutils" 
"bc")
optdepends=("nvidia-think: nvidia drivers"
"bbswitch-think: optimus support"
"linux-think-firmware: BRCM bluetooth firmware")
options=("!strip")
source=("https://www.kernel.org/pub/linux/kernel/v4.x/${_srcname}.tar.xz"
"https://www.kernel.org/pub/linux/kernel/v4.x/patch-${pkgver}.xz"
# ck1 patchset
"http://ck.kolivas.org/patches/4.0/4.6/4.6-ck1/${_ckpatchname}.xz"
"001-change_default_console_loglevel.patch"
"002-i915_vga_arbiter-4.6.2.patch"
"003-acs_override-4.6.2.patch"
"004-enable_additional_cpu_optimizations_for_gcc_v4.9+.patch"
"005-intel_fifo_underrun_error_to_debug.patch"
"006-microphone_mute_light.patch"
"007-fbcondecor.patch"
# BFQ
"008-cgroups_kconfig_build_bits_for_BFQ-4.5.0.patch"
"009-introduce_the_BFQ-4.5.0.patch"
"010-add_Early_Queue_Merge_to_BFQ-4.5.0.patch"
# The main kernel config files
"config" 
"config.x86_64"
# Standard config files for mkinitcpio ramdisk
"linux.preset")

md5sums=('d2927020e24a76da4ab482a8bc3e9ef3'
         'c064bbe8108b8e5304f3db2130a96845'
         '69281829b5135f1a34ccd393159c74e9'
         'df7fceae6ee5d7e7be7b60ecd7f6bb35'
         'b65081ff1ace9b352f80b23093e79397'
         'c30fe04a9ba0a7c652cecac9320bbb4c'
         '4675e1fe4bd326a50f168c5674bab13c'
         '64c87cfec450389cc158ba0cf6fe7a1e'
         'c96372203aec1ebc0fd8404bdddcc0b8'
         '8b7ca23aa660578023a0a244ae235888'
         'b3b845477eb2e62e745803685bde9057'
         '7e50b0145ed002319a8fb651b72f7cd0'
         'a873c975acf24c3ef0225b9fcd3f3e1e'
         'd122753e36b01f3c4cc614b764fa2777'
         '802a62b556c6f0715fe3eb0933fa7d3b'
         'eb14dcfd80c00852ef81ded6e826826a')

_kernelname=${pkgbase#linux}

prepare() {
  cd "${srcdir}/${_srcname}"

  # Add upstream patch
  msg "Patching upstream"
  patch -p1 -i "${srcdir}/patch-${pkgver}"

  # Add latest fixes from stable queue, if needed
  # 
  # http://git.kernel.org/?p=linux/kernel/git/stable/stable-queue.git

  # set DEFAULT_CONSOLE_LOGLEVEL to 4 (same value as the 'quiet' kernel param)
  # remove this when a Kconfig knob is made available by upstream
  # (relevant patch sent upstream: https://lkml.org/lkml/2011/7/26/227)
  msg "Patching default console loglevel"
  patch -p1 -i "${srcdir}/001-change_default_console_loglevel.patch"

  # Patch source with ck patchset with BFS
  msg "Patching source with ck1 including BFS v0.470"
  patch -Np1 -i "${srcdir}/${_ckpatchname}"

  # Patches for vga arbiter fix in intel systems
  patch -p1 -i "${srcdir}/002-i915_vga_arbiter-4.6.2.patch"

  # Overrides for missing acs capabilities
  patch -p1 -i "${srcdir}/003-acs_override-4.6.2.patch"

  # Extra GCC optimizations
  patch -p1 -i "${srcdir}/004-enable_additional_cpu_optimizations_for_gcc_v4.9+.patch"

  # Disabling Lenovo specyfic error
  patch -p1 -i "${srcdir}/005-intel_fifo_underrun_error_to_debug.patch"

  # Microphon light fix
  patch -p1 -i "${srcdir}/006-microphone_mute_light.patch"

  # Enabling fbcondecor
  patch -p1 -i "${srcdir}/007-fbcondecor.patch"

  # BFQ patch
  msg "Patching source with BFQ patches"
  patch -p1 -i "${srcdir}/008-cgroups_kconfig_build_bits_for_BFQ-4.5.0.patch"
  patch -p1 -i "${srcdir}/009-introduce_the_BFQ-4.5.0.patch"
  patch -p1 -i "${srcdir}/010-add_Early_Queue_Merge_to_BFQ-4.5.0.patch"

  # Clean tree and copy ARCH config over
  msg "Running make mrproper to clean source tree"
  make mrproper

  # Copy the default config depanding on architecture
  msg "Copying config..."
  if [ "${CARCH}" = "x86_64" ]; then
    cat "${srcdir}/config.x86_64" > ./.config
  else
    cat "${srcdir}/config" > ./.config
  fi

  ### Optionally set tickrate to 1000 
  if [ -n "$_1k_Hz_ticks" ]; then
    msg "Setting tick rate to 1k..."
    sed -i -e 's/^CONFIG_HZ_300=y/# CONFIG_HZ_300 is not set/' \
      -i -e 's/^# CONFIG_HZ_1000 is not set/CONFIG_HZ_1000=y/' \
      -i -e 's/^CONFIG_HZ=300/CONFIG_HZ=1000/' .config
  fi

  ### Optionally enable BFQ as the default I/O scheduler
  if [ -n "$_BFQ_enable_" ]; then
    msg "Setting BFQ as default I/O scheduler..."
    sed -i -e '/CONFIG_DEFAULT_IOSCHED/ s,cfq,bfq,' \
      -i -e s'/CONFIG_DEFAULT_CFQ=y/# CONFIG_DEFAULT_CFQ is not set\nCONFIG_DEFAULT_BFQ=y/' ./.config
  fi

  # Optionally disable NUMA since >99% of users have mono-socket systems.
  if [ -n "$_NUMAdisable" ]; then
    if [ "${CARCH}" = "x86_64" ]; then
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
  fi

  if [ "${_kernelname}" != "" ]; then
    sed -i "s|CONFIG_LOCALVERSION=.*|CONFIG_LOCALVERSION=\"${_kernelname}\"|g" ./.config
    sed -i "s|CONFIG_LOCALVERSION_AUTO=.*|CONFIG_LOCALVERSION_AUTO=n|" ./.config
  fi

  # Set extraversion to pkgrel
  sed -ri "s|^(EXTRAVERSION =).*|\1 -${pkgrel}|" Makefile

  # Don't run depmod on 'make install'. We'll do this ourselves in packaging
  sed -i '2iexit 0' scripts/depmod.sh

  ### Optionally load needed modules for the make localmodconfig
  # See https://aur.archlinux.org/packages/modprobed-db
    if [ -n "$_localmodcfg" ]; then
    msg "If you have modprobed-db installed, running it in recall mode now"
    if [ -e /usr/bin/modprobed-db ]; then
      [[ ! -x /usr/bin/sudo ]] && echo "Cannot call modprobe with sudo.  Install via pacman -S sudo and configure to work with this user." && exit 1
      sudo /usr/bin/modprobed-db recall
    fi
    msg "Running Steven Rostedt's make localmodconfig now"
    make localmodconfig
  fi

  # Load configuration
  make olddefconfig
  make menuconfig

  # Rewrite configuration
  yes "" | make config >/dev/null
}

build() {
  cd "${srcdir}/${_srcname}"

  make ${MAKEFLAGS} LOCALVERSION= bzImage modules
}

_package() {
  [ "${pkgbase}" = "linux" ] && groups=('base')
  depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7')
  optdepends=('crda: to set the correct wireless channels of your country')
  backup=("etc/mkinitcpio.d/${pkgbase}.preset")
  install=linux.install

  cd "${srcdir}/${_srcname}"

  KARCH=x86

  # get kernel version
  _kernver="$(make LOCALVERSION= kernelrelease)"
  _basekernel=${_kernver%%-*}
  _basekernel=${_basekernel%.*}

  mkdir -p "${pkgdir}"/{lib/modules,lib/firmware,boot}
  make LOCALVERSION= INSTALL_MOD_PATH="${pkgdir}" modules_install
  cp arch/$KARCH/boot/bzImage "${pkgdir}/boot/vmlinuz-${pkgbase}"

  # set correct depmod command for install
  cp -f "${startdir}/${install}" "${startdir}/${install}.pkg"
  true && install=${install}.pkg
  sed \
    -e  "s/KERNEL_NAME=.*/KERNEL_NAME=${_kernelname}/" \
    -e  "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/" \
    -i "${startdir}/${install}"

  # install mkinitcpio preset file for kernel
  install -D -m644 "${srcdir}/linux.preset" "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"
  sed \
    -e "1s|'linux.*'|'${pkgbase}'|" \
    -e "s|ALL_kver=.*|ALL_kver=\"/boot/vmlinuz-${pkgbase}\"|" \
    -e "s|default_image=.*|default_image=\"/boot/initramfs-${pkgbase}.img\"|" \
    -e "s|fallback_image=.*|fallback_image=\"/boot/initramfs-${pkgbase}-fallback.img\"|" \
    -i "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"

  # remove build and source links
  rm -f "${pkgdir}"/lib/modules/${_kernver}/{source,build}
  # remove the firmware
  rm -rf "${pkgdir}/lib/firmware"
  # gzip -9 all modules to save 100MB of space
  find "${pkgdir}" -name '*.ko' -exec gzip -9 {} \;
  # make room for external modules
  ln -s "../extramodules-${_basekernel}${_kernelname:--ARCH}" "${pkgdir}/lib/modules/${_kernver}/extramodules"
  # add real version for building modules and running depmod from post_install/upgrade
  mkdir -p "${pkgdir}/lib/modules/extramodules-${_basekernel}${_kernelname:--ARCH}"
  echo "${_kernver}" > "${pkgdir}/lib/modules/extramodules-${_basekernel}${_kernelname:--ARCH}/version"

  # Now we call depmod...
  depmod -b "${pkgdir}" -F System.map "${_kernver}"

  # move module tree /lib -> /usr/lib
  mkdir -p "${pkgdir}/usr"
  mv "${pkgdir}/lib" "${pkgdir}/usr/"

  # add vmlinux
  install -D -m644 vmlinux "${pkgdir}/usr/lib/modules/${_kernver}/build/vmlinux"
}

_package-headers() {
pkgdesc="Header files and scripts for building modules for ${pkgbase/linux/Linux} kernel"

install -dm755 "${pkgdir}/usr/lib/modules/${_kernver}"

cd "${srcdir}/${_srcname}"
install -D -m644 Makefile \
  "${pkgdir}/usr/lib/modules/${_kernver}/build/Makefile"
install -D -m644 kernel/Makefile \
  "${pkgdir}/usr/lib/modules/${_kernver}/build/kernel/Makefile"
install -D -m644 .config \
  "${pkgdir}/usr/lib/modules/${_kernver}/build/.config"

mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/include"

for i in acpi asm-generic config crypto drm generated keys linux math-emu \
  media net pcmcia scsi sound trace uapi video xen; do
cp -a include/${i} "${pkgdir}/usr/lib/modules/${_kernver}/build/include/"
  done

  # copy arch includes for external modules
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/x86"
  cp -a arch/x86/include "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/x86/"

  # copy files necessary for later builds, like nvidia and vmware
  cp Module.symvers "${pkgdir}/usr/lib/modules/${_kernver}/build"
  cp -a scripts "${pkgdir}/usr/lib/modules/${_kernver}/build"

  # fix permissions on scripts dir
  chmod og-w -R "${pkgdir}/usr/lib/modules/${_kernver}/build/scripts"
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/.tmp_versions"

  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/kernel"

  cp arch/${KARCH}/Makefile "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/"

  if [ "${CARCH}" = "i686" ]; then
    cp arch/${KARCH}/Makefile_32.cpu "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/"
  fi

  cp arch/${KARCH}/kernel/asm-offsets.s "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/kernel/"

  # add docbook makefile
  install -D -m644 Documentation/DocBook/Makefile \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/Documentation/DocBook/Makefile"

  # add dm headers
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/md"
  cp drivers/md/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/md"

  # add inotify.h
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/include/linux"
  cp include/linux/inotify.h "${pkgdir}/usr/lib/modules/${_kernver}/build/include/linux/"

  # add wireless headers
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/net/mac80211/"
  cp net/mac80211/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/net/mac80211/"

  # add dvb headers for external modules
  # in reference to:
  # http://bugs.archlinux.org/task/9912
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-core"
  cp drivers/media/dvb-core/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-core/"
  # and...
  # http://bugs.archlinux.org/task/11194
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/include/config/dvb/"
  cp include/config/dvb/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/include/config/dvb/"

  # add dvb headers for http://mcentral.de/hg/~mrec/em28xx-new
  # in reference to:
  # http://bugs.archlinux.org/task/13146
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-frontends/"
  cp drivers/media/dvb-frontends/lgdt330x.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-frontends/"
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/i2c/"
  cp drivers/media/i2c/msp3400-driver.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/i2c/"

  # add dvb headers
  # in reference to:
  # http://bugs.archlinux.org/task/20402
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/usb/dvb-usb"
  cp drivers/media/usb/dvb-usb/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/usb/dvb-usb/"
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-frontends"
  cp drivers/media/dvb-frontends/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-frontends/"
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/tuners"
  cp drivers/media/tuners/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/tuners/"

  # add xfs and shmem for aufs building
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/fs/xfs"
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/mm"
  # removed in 3.17 series
  # cp fs/xfs/xfs_sb.h "${pkgdir}/usr/lib/modules/${_kernver}/build/fs/xfs/xfs_sb.h"

  # copy in Kconfig files
  for i in $(find . -name "Kconfig*"); do
    mkdir -p "${pkgdir}"/usr/lib/modules/${_kernver}/build/`echo ${i} | sed 's|/Kconfig.*||'`
    cp ${i} "${pkgdir}/usr/lib/modules/${_kernver}/build/${i}"
  done

  chown -R root.root "${pkgdir}/usr/lib/modules/${_kernver}/build"
  find "${pkgdir}/usr/lib/modules/${_kernver}/build" -type d -exec chmod 755 {} \;

  # strip scripts directory
  find "${pkgdir}/usr/lib/modules/${_kernver}/build/scripts" -type f -perm -u+w 2>/dev/null | while read binary ; do
  case "$(file -bi "${binary}")" in
    *application/x-sharedlib*) # Libraries (.so)
      /usr/bin/strip ${STRIP_SHARED} "${binary}";;
    *application/x-archive*) # Libraries (.a)
      /usr/bin/strip ${STRIP_STATIC} "${binary}";;
    *application/x-executable*) # Binaries
      /usr/bin/strip ${STRIP_BINARIES} "${binary}";;
  esac
done

# remove unneeded architectures
rm -rf "${pkgdir}"/usr/lib/modules/${_kernver}/build/arch/{alpha,arc,arm,arm26,arm64,avr32,blackfin,c6x,cris,frv,h8300,hexagon,ia64,m32r,m68k,m68knommu,metag,mips,microblaze,mn10300,openrisc,parisc,powerpc,ppc,s390,score,sh,sh64,sparc,sparc64,tile,unicore32,um,v850,xtensa}
}

_package-docs() {
pkgdesc="Kernel hackers manual - HTML documentation that comes with the ${pkgbase/linux/Linux} kernel"

cd "${srcdir}/${_srcname}"

mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build"
cp -al Documentation "${pkgdir}/usr/lib/modules/${_kernver}/build"
find "${pkgdir}" -type f -exec chmod 444 {} \;
find "${pkgdir}" -type d -exec chmod 755 {} \;

# remove a file already in linux package
rm -f "${pkgdir}/usr/lib/modules/${_kernver}/build/Documentation/DocBook/Makefile"
}

pkgname=("${pkgbase}" "${pkgbase}-headers" "${pkgbase}-docs")
for _p in ${pkgname[@]}; do
  eval "package_${_p}() {
  $(declare -f "_package${_p#${pkgbase}}")
  _package${_p#${pkgbase}}
}"
done
