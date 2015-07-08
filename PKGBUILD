# Maintainer: Figue <ffigue@gmail.com>
# Contributor: graysky <graysky AT archlinux DOT us>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

#pkgbase=linux               # Build stock -ARCH kernel
pkgbase=linux-bld       # Build kernel with a different name
_srcname=linux-4.1
pkgname=(linux-bld linux-bld-headers)
_kernelname=-bld
pkgver=4.1.1
pkgrel=2
arch=('i686' 'x86_64')
url="https://github.com/rmullick/linux"
license=('GPL2')
makedepends=( 'kmod' 'inetutils' 'bc')
options=('!strip')
_gcc_patch="enable_additional_cpu_optimizations_for_gcc_v4.9+_kernel_v3.15+.patch"
_bfqpath="http://algo.ing.unimo.it/people/paolo/disk_sched/patches/4.1.0-v7r8"
_BLDpatch="BLD-4.1.patch"
source=("http://www.kernel.org/pub/linux/kernel/v4.x/${_srcname}.tar.xz"
	"https://www.kernel.org/pub/linux/kernel/v4.x/${_srcname}.tar.sign"
	"http://www.kernel.org/pub/linux/kernel/v4.x/patch-${pkgver}.xz"
	"https://www.kernel.org/pub/linux/kernel/v4.x/patch-${pkgver}.sign"
        "http://repo-ck.com/source/gcc_patch/${_gcc_patch}.gz"
        # the main kernel config files
        'config' 'config.x86_64'
        # standard config files for mkinitcpio ramdisk
        'linux-bld.preset'
        'change-default-console-loglevel.patch'
	"${_bfqpath}/0001-block-cgroups-kconfig-build-bits-for-BFQ-v7r8-4.1.patch"
	"${_bfqpath}/0002-block-introduce-the-BFQ-v7r8-I-O-sched-for-4.1.patch"
	"${_bfqpath}/0003-block-bfq-add-Early-Queue-Merge-EQM-to-BFQ-v7r8-for-4.1.0.patch"
        "https://raw.githubusercontent.com/rmullick/bld-patches/master/${_BLDpatch}"
        "0001-block-loop-convert-to-per-device-workqueue.patch"
        "0002-block-loop-avoiding-too-many-pending-per-work-I-O.patch"
        )

sha256sums=('caf51f085aac1e1cea4d00dbbf3093ead07b551fc07b31b2a989c05f8ea72d9f'
            'SKIP'
            '48a813fb6795153f6906759501bea9e290db528894d1c0726667efc8e55dd7ad'
            'SKIP'
            '819961379909c028e321f37e27a8b1b08f1f1e3dd58680e07b541921282da532'
            'f4c6a5c2fc0ee2b792e43f4c1846b995051901a502fb97885d2296af55fa193d'
            '58d49d4a3f6152394d903fd09113116fa3a0939d7d7ee419b2edbbd0c30e1755'
            '8da1d80c0bd568781568da4f669f39fed94523312b9d37477836bfa6faa9527f'
            '1256b241cd477b265a3c2d64bdc19ffe3c9bbcee82ea3994c590c2c76e767d99'
            'ec0ca3c8051ea6d9a27a450998af8162464c224299deefc29044172940e96975'
            'c5c2c48638c2a8180948bd118ffcc33c8b7ff5f9f1e4b04c8e2cafeca2bde87b'
            '4f30f76adbdf49aec8d41ac27ad212734500c272f3cba594f134a7bc263820d9'
            '6b068476a99fa7b5902f20e379f28b0f72e7d8edb6b751b6b28d3d51bcb0e08b'
            '9e1d3fd95d768a46353593f6678513839cedb98ee66e83d9323233104ec3b23f'
            'bbe3631c737ed8329a1b7a9610cc0a07330c14194da5e9afec7705e7f37eeb81')

validpgpkeys=(
              'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linus Torvalds
	      '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman
             )

# Running with a 1000 HZ tick rate (vs the ARCH 300) is reported to solve the
# issues with the bfs/linux 3.1x and suspend. For more see:
# http://ck-hack.blogspot.com/2013/09/bfs-0441-311-ck1.html?showComment=1378756529345#c5266548105449573343
_1k_HZ_ticks=y

# Alternative I/O scheduler by Paolo.
# Set this if you want it enabled globally i.e. for all devices in your system
# If you want it enabled on a device-by-device basis, leave this unset and see:
# https://wiki.archlinux.org/index.php/Linux-ck#How_to_Enable_the_BFQ_I.2FO_Scheduler
_BFQ_enable_=y

# Tweak kernel options prior to a build via nconfig
makenconfig=

prepare() {
  cd "${srcdir}/${_srcname}"

  if [ "$(echo $pkgver | cut -d'.' -f3)" != "" ]; then
    msg2 "Appliyng upstream patch only if a sub-version is detected"
    patch -p1 -i "${srcdir}/patch-${pkgver}"
  else
    msg2 "Upstream patch not needed"
  fi

  #msg2 "Applying latest fixes from stable queue, if needed"
  # http://git.kernel.org/?p=linux/kernel/git/stable/stable-queue.git

  # Fix deadlock with stacked loop devices (FS#45129)
  # http://marc.info/?l=linux-kernel&m=143280649731902&w=2
  patch -Np1 -i ../0001-block-loop-convert-to-per-device-workqueue.patch
  patch -Np1 -i ../0002-block-loop-avoiding-too-many-pending-per-work-I-O.patch

  msg2 "set DEFAULT_CONSOLE_LOGLEVEL to 4 (same value as the 'quiet' kernel param)"
  # remove this when a Kconfig knob is made available by upstream
  # (relevant patch sent upstream: https://lkml.org/lkml/2011/7/26/227)
  patch -p1 -i "${srcdir}/change-default-console-loglevel.patch"

  msg2 "BLD patches"
  patch -Np1 -i "${srcdir}/${_BLDpatch}"

  msg2 "Patch source to enable more gcc CPU optimizatons via the make nconfig"
  patch -Np1 -i "${srcdir}/${_gcc_patch}"

  msg "Patching source with BFQ patches"
  for p in $(ls ${srcdir}/000{1,2,3}-block*BFQ*.patch); do
      patch -Np1 -i "$p"
  done

#  msg2 "Patches from Archlinux"

  if [ "${CARCH}" = "x86_64" ]; then
    cat "${srcdir}/config.x86_64" > ./.config
  else
    cat "${srcdir}/config" > ./.config
  fi

  if [ "${_kernelname}" != "" ]; then
    sed -i "s|CONFIG_LOCALVERSION=.*|CONFIG_LOCALVERSION=\"${_kernelname}\"|g" ./.config
    sed -i "s|CONFIG_LOCALVERSION_AUTO=.*|CONFIG_LOCALVERSION_AUTO=n|" ./.config
  fi

  msg2 "The Barbershop Load Distribution algorithm is not suitable for NUMA."
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

  ### Optionally enable BFQ as the default I/O scheduler
  if [ -n "$_BFQ_enable_" ]; then
    msg "Setting BFQ as default I/O scheduler..."
    sed -i -e '/CONFIG_DEFAULT_IOSCHED/ s,cfq,bfq,' \
        -i -e s'/CONFIG_DEFAULT_CFQ=y/# CONFIG_DEFAULT_CFQ is not set\nCONFIG_DEFAULT_BFQ=y/' ./.config
  fi

  msg2 "Optionally set tickrate to 1000 to avoid suspend issues"
  # as reported here: http://ck-hack.blogspot.com/2013/09/bfs-0441-311-ck1.html?showComment=1379234249615#c4156123736313039413
  if [ -n "$_1k_HZ_ticks" ]; then
    msg "Setting tick rate to 1k..."
    sed -i -e 's/^CONFIG_HZ_300=y/# CONFIG_HZ_300 is not set/' \
        -i -e 's/^# CONFIG_HZ_1000 is not set/CONFIG_HZ_1000=y/' \
        -i -e 's/^CONFIG_HZ=300/CONFIG_HZ=1000/' .config
  fi

  ### Add CONFIG_BLD=y directly in .config
  echo "CONFIG_BLD=y" >> .config

  # set extraversion to pkgrel
  sed -ri "s|^(EXTRAVERSION =).*|\1 -${pkgrel}|" Makefile

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
  if [ -n "$_makenconfig" ]; then
    msg "Running make nconfig"
    make nconfig
  fi

  # rewrite configuration
  yes "" | make config >/dev/null
}

build() {
  cd "${srcdir}/${_srcname}"

  make ${MAKEFLAGS} LOCALVERSION= bzImage modules
}

package_linux-bld() {
  pkgdesc="The ${pkgbase/linux/Linux} kernel and modules with BLD patches"
  [ "${pkgbase}" = "linux" ] && groups=('base')
  depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7')
  optdepends=('crda: to set the correct wireless channels of your country')
  provides=("kernel26${_kernelname}=${pkgver}")
  conflicts=("kernel26${_kernelname}")
  replaces=("kernel26${_kernelname}")
  backup=("etc/mkinitcpio.d/${pkgbase}.preset")
  install=linux-bld.install

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
  install -D -m644 "${srcdir}/linux-bld.preset" "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"
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

package_linux-bld-headers() {
  pkgdesc="Header files and scripts for building modules for ${pkgbase/linux/Linux} kernel"
  provides=("kernel26${_kernelname}-headers=${pkgver}")
  conflicts=("kernel26${_kernelname}-headers")
  replaces=("kernel26${_kernelname}-headers")

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

#_package-linux-bld-docs() {
#  pkgdesc="Kernel hackers manual - HTML documentation that comes with the ${pkgbase/linux/Linux} kernel"
#  provides=("kernel26${_kernelname}-docs=${pkgver}")
#  conflicts=("kernel26${_kernelname}-docs")
#  replaces=("kernel26${_kernelname}-docs")
#
#  cd "${srcdir}/${_srcname}"
#
#  mkdir -p "${pkgdir}/usr/src/linux-${_kernver}"
#  cp -al Documentation "${pkgdir}/usr/src/linux-${_kernver}"
#  find "${pkgdir}" -type f -exec chmod 444 {} \;
#  find "${pkgdir}" -type d -exec chmod 755 {} \;
#
#  # remove a file already in linux package
#  rm -f "${pkgdir}/usr/src/linux-${_kernver}/Documentation/DocBook/Makefile"
#}
#
##pkgname=("${pkgbase}" "${pkgbase}-headers" "${pkgbase}-docs")
#pkgname=("${pkgbase}" "${pkgbase}-headers")
#for _p in ${pkgname[@]}; do
#  eval "package_${_p}() {
#    _package${_p#${pkgbase}}
#  }"
#done

# vim:set ts=8 sts=2 sw=2 et:
