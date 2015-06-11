# Maintainers:
#	Claire Farron <diesal3@googlemail.com> (Submitter)
#	Andes Ho <mxah002@live.rhul.ac.uk> (Secondary Package Tester)
# Contributors of the linux PKGBUILD
#	Tobias Powalowski <tpowa@archlinux.org>
#	Thomas Baechler <thomas@archlinux.org>
# Contributor of the -ck PKGBUILD
#	graysky <graysky AT archlinux DOT us>
# Contributor of PKGBUILD fixes
#	fsckd <fsckdaemon -at- gmail dot com>

### PATCH AND BUILD OPTIONS
# Set these variables to ANYTHING that is not null (y or hello or 2 or "I like icecream") to enable them
#
_makenconfig=   # Tweak kernel options prior to a build via nconfig
_localmodcfg=   # Compile ONLY probed modules
_use_current=   # Use the current kernel's .config file
_NUMAdisable=y	# Disable NUMA in kernel config
_1k_HZ_ticks=y	# Use 1000Hz tick rate
_BFQ_enable_=  # Enable BFQ as the default I/O scheduler

### DOCS
# DETAILS FOR _localmodcfg=
# As of mainline 2.6.32, running with this option will only build the modules that you currently have
# probed in your system VASTLY reducing the number of modules built and the build time to do it.
#
# WARNING - make CERTAIN that all modules are modprobed BEFORE you begin making the pkg!
#
# To keep track of which modules are needed for your specific system/hardware, give my module_db script
# a try: https://aur.archlinux.org/packages/modprobed-db/  Note that if you use my script, this PKGBUILD
# will auto run the 'sudo modprobed_db reload' for you to probe all the modules you have logged!
#
# More at this wiki page ---> https://wiki.archlinux.org/index.php/Modprobed_db

# DETAILS FOR _use_current=
# Enabling this option will use the .config of the RUNNING kernel rather than the ARCH defaults.
# Useful when the package gets updated and you already went through the trouble of customizing your
# config options.  NOT recommended when a new kernel is released, but again, convenient for package bumps.

# DETAILS FOR _NUMAdisable=
# Since >99 % of users do not have multiple CPUs but do have multiple cores in one CPU.
# see, https://bugs.archlinux.org/task/31187

# DETAILS FOR _1k_HZ_ticks=
# Running with a 1000 HZ tick rate (vs the ARCH 300) is reported to solve the
# issues with the bfs/linux 3.1x and suspend. For more see:
# http://ck-hack.blogspot.com/2013/09/bfs-0441-311-ck1.html?showComment=1378756529345#c5266548105449573343

# DETAILS FOR _BFQ_enable_=
# Alternative I/O scheduler by Paolo.
# Set this if you want it enabled globally i.e. for all devices in your system
# If you want it enabled on a device-by-device basis, leave this unset and see:
# https://wiki.archlinux.org/index.php/Linux-ck#How_to_Enable_the_BFQ_I.2FO_Scheduler

### Do not edit below this line unless you know what you're doing

pkgname=linux-lts312-ck
_pkgname=${pkgname}
_kernelname=${_pkgname#linux}
_basekernel=3.12
true && pkgname=(${_pkgname} ${_pkgname}-headers)
pkgver=3.12.40
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.kernel.org/"
license=('GPL2')
makedepends=('kmod' 'inetutils' 'bc')
options=('!strip')
_ckpatchversion=2
_ckpatchname="patch-3.12-ck${_ckpatchversion}"
_gcc_patch="enable_additional_cpu_optimizations_for_gcc_v4.9+.patch"
_bfqpath="http://algo.ing.unimo.it/people/paolo/disk_sched/patches/3.12.0-v7r7"
source=("https://www.kernel.org/pub/linux/kernel/v3.x/linux-3.12.tar.xz"
        "https://www.kernel.org/pub/linux/kernel/v3.x/linux-3.12.tar.sign"
        "https://www.kernel.org/pub/linux/kernel/v3.x/patch-${pkgver}.xz"
        "https://www.kernel.org/pub/linux/kernel/v3.x/patch-${pkgver}.sign"
        "http://ck.kolivas.org/patches/3.0/3.12/3.12-ck${_ckpatchversion}/${_ckpatchname}.bz2"
        "http://repo-ck.com/source/gcc_patch/${_gcc_patch}.gz"
        'linux-lts312-ck.preset'
        'change-default-console-loglevel.patch'
        'config' 'config.x86_64'
        'criu-no-expert.patch'
        '0001-nfs-sunrpc-create-a-new-dummy-pipe-for-gssd-to-hold.patch'
        '0002-nfs-sunrpc-replace-sunrpc_net-gssd_running-flag-with.patch'
        '0003-nfs-check-if-gssd-is-running-before-attempting-to-us.patch'
        '0004-nfs-rpc_pipe-remove-the-clntXX-dir-if-creating-the-p.patch'
        '0005-nfs-sunrpc-add-an-info-file-for-the-dummy-gssd.patch'
        '0006-nfs-rpc_pipe-fix-cleanup-of-dummy-gssd-directory-whe.patch'
        "${_bfqpath}/0001-block-cgroups-kconfig-build-bits-for-BFQ-v7r7-3.12.patch"
        "${_bfqpath}/0002-block-introduce-the-BFQ-v7r7-I-O-sched-for-3.12.patch"
        "${_bfqpath}/0003-block-bfq-add-Early-Queue-Merge-EQM-to-BFQ-v7r7-for-3.12.0.patch")

sha256sums=('2e120ec7fde19fa51dc6b6cc11c81860a0775defcad5a5bf910ed9a50e845a02'
            'SKIP'
            '16b14d54a638b4f5c7c65acf630f79a70c6588c2b893d84996f7b30f4f7f7aa4'
            'SKIP'
            '413def4af24ff70615cf5ef5cc1f1347bd634d87686a84ad0e2c2d3b052da8b8'
            'c6c4a9f77683b95c37636b20c4bc8a1f8214c87feef7fc469e58534fcc32fb4a'
            '136c9f7f099cdccdec0c3d565632907a28ef3d0295e23b45f302fe1c1fe6f95e'
            'faced4eb4c47c4eb1a9ee8a5bf8a7c4b49d6b4d78efbe426e410730e6267d182'
            '533b6d33f534cb7d036d7027b9ada66f4fbd7f824d8e142456d3cddca92870c5'
            '90246624459ed323a5617311931a450efb56da71e520018f5cc9c9eed2ef5217'
            'daa75228a4c45a925cc5dbfeba884aa696a973a26af7695adc198c396474cbd5'
            '6ed0d7b259dca7a3cb4ed5cba10e87d2f9b29ecab6438e47f70d6961cc0eb665'
            '3e3a2f5531b18fa6494bf1d555be981aef288c5d74480569d907629be06b54b3'
            '52d8d897e2a2a1605a904d200ff123b453f2edbeebe623480bf5ee58d87ac4e2'
            'df5c98b5719b97accbee16d387b81781cd9694801cf1f1d831fdf5069942fda1'
            'ed41c98da84dc0003777edca3101d4923be76701d6b494cd7c512a4da39de710'
            'b54af31bf32ea47dd47c48113481cc3288c04d844f5b4814663b108f43f415a7'
            'ef00dfd04a3a22faa6443c47e07746678a56f6bb72277b50a784b9a57ca540c9'
            '768c704c85fb9bf818b22f40ace594a95464f6cff97409959dd851c8f64f6993'
            'c8032c87a844fe11056e39abc40c55cfbcb6503e04258101bdafa9fa87dd0f46')
validpgpkeys=(
              'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linux Torvalds
              '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman
             )

prepare() {
  cd "${srcdir}/linux-${_basekernel}"

  # add upstream patch
  msg "Patching source to v$pkgver"
  patch -p1 -i "${srcdir}/patch-${pkgver}"

  # set DEFAULT_CONSOLE_LOGLEVEL to 4 (same value as the 'quiet' kernel param)
  # remove this when a Kconfig knob is made available by upstream
  # (relevant patch sent upstream: https://lkml.org/lkml/2011/7/26/227)
	patch -p1 -i "${srcdir}/change-default-console-loglevel.patch"

  # allow criu without expert option set
  # patch from fedora
  patch -Np1 -i "${srcdir}/criu-no-expert.patch"
	
  # fix 15 seocnds nfs delay
  # http://git.linux-nfs.org/?p=trondmy/linux-nfs.git;a=commitdiff;h=4b9a445e3eeb8bd9278b1ae51c1b3a651e370cd6
  # http://git.linux-nfs.org/?p=trondmy/linux-nfs.git;a=commitdiff;h=89f842435c630f8426f414e6030bc2ffea0d6f81
  # http://git.linux-nfs.org/?p=trondmy/linux-nfs.git;a=commitdiff;h=6aa23d76a7b549521a03b63b6d5b7880ea87eab7
  # fix nfs kernel oops
  # http://git.linux-nfs.org/?p=trondmy/linux-nfs.git;a=commitdiff;h=3396f92f8be606ea485b0a82d4e7749a448b013b
  # http://git.linux-nfs.org/?p=trondmy/linux-nfs.git;a=commitdiff;h=e2f0c83a9de331d9352185ca3642616c13127539
  # http://git.linux-nfs.org/?p=trondmy/linux-nfs.git;a=commitdiff;h=23e66ba97127ff3b064d4c6c5138aa34eafc492f
  msg "Patching source with NFS patches"
  for p in $(ls ${srcdir}/000{1,2,3,4,5,6}-nfs*.patch); do
    msg " $p"
    patch -Np1 -i "$p"
  done

  # patch source with ck patchset with BFS
  # fix double name in EXTRAVERSION
  sed -i -re "s/^(.EXTRAVERSION).*$/\1 = /" "${srcdir}/${_ckpatchname}"
  msg "Patching source with ck2 including BFS v0.444"
  patch -Np1 -i "${srcdir}/${_ckpatchname}"
 
  # Patch source to enable more gcc CPU optimizatons via the make nconfig
  patch -Np1 -i "${srcdir}/${_gcc_patch}"

  msg "Patching source with BFQ patches"
  for p in $(ls ${srcdir}/000{1,2,3}-block*.patch); do
    msg " $p"
    patch -Np1 -i "$p"
  done

  # Clean tree and copy ARCH config over
  msg "Running make mrproper to clean source tree"
  make mrproper

  if [ "${CARCH}" = "x86_64" ]; then
    cat "${srcdir}/config.x86_64" > ./.config
  else
    cat "${srcdir}/config" > ./.config
  fi

  ### Optionally set tickrate to 1000 to avoid suspend issues as reported here:
  # http://ck-hack.blogspot.com/2013/09/bfs-0441-311-ck1.html?showComment=1379234249615#c4156123736313039413
  if [ -n "$_1k_HZ_ticks" ]; then
  msg "Setting tick rate to 1k..."
    sed -i -e 's/^CONFIG_HZ_300=y/# CONFIG_HZ_300 is not set/' \
        -i -e 's/^# CONFIG_HZ_1000 is not set/CONFIG_HZ_1000=y/' \
        -i -e 's/^CONFIG_HZ=300/CONFIG_HZ=1000/' .config
  fi

  ### Optionally use running kernel's config
  # code originally by nous; http://aur.archlinux.org/packages.php?ID=40191
  if [ -n "$_use_current" ]; then
    if [[ -s /proc/config.gz ]]; then
      msg "Extracting config from /proc/config.gz..."
      # modprobe configs
      zcat /proc/config.gz > ./.config
    else
      warning "You kernel was not compiled with IKCONFIG_PROC!"
      warning "You cannot read the current config!"
      warning "Aborting!"
      exit
    fi
  fi

  if [ "${_kernelname}" != "" ]; then
    sed -i "s|CONFIG_LOCALVERSION=.*|CONFIG_LOCALVERSION=\"${_kernelname}\"|g" ./.config
    sed -i "s|CONFIG_LOCALVERSION_AUTO=.*|CONFIG_LOCALVERSION_AUTO=n|" ./.config
  fi

  ### Optionally disable NUMA since >99% of users have mono-socket systems.
  # For more, see: https://bugs.archlinux.org/task/31187
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

  ### Optionally enable BFQ as the default I/O scheduler
  if [ -n "$_BFQ_enable_" ]; then
    msg "Setting BFQ as default I/O scheduler..."
    sed -i -e '/CONFIG_DEFAULT_IOSCHED/ s,cfq,bfq,' \
        -i -e s'/CONFIG_DEFAULT_CFQ=y/# CONFIG_DEFAULT_CFQ is not set\nCONFIG_DEFAULT_BFQ=y/' ./.config
  fi

  # set extraversion to pkgrel
  sed -ri "s|^(EXTRAVERSION =).*|\1 -${pkgrel}|" Makefile

  # don't run depmod on 'make install'. We'll do this ourselves in packaging
  sed -i '2iexit 0' scripts/depmod.sh

  # get kernel version
  make prepare

  ### Optionally load needed modules for the make localmodconfig
  # See http://aur.archlinux.org/packages.php?ID=41689
  if [ -n "$_localmodcfg" ]; then
    msg "If you have modprobe_db installed, running it in recall mode now"
    if [ -e /usr/bin/modprobed_db ]; then
      [[ ! -x /usr/bin/sudo ]] && echo "Cannot call modprobe with sudo.  Install via pacman -S sudo and configure to work with this user." && exit 1
      sudo /usr/bin/modprobed_db recall
    fi
    msg "Running Steven Rostedt's make localmodconfig now"
    make localmodconfig
  fi

  if [ -n "$_makenconfig" ]; then
    msg "Running make nconfig"
    make nconfig
  fi

  # save configuration for later reuse
#  if [ "${CARCH}" = "x86_64" ]; then
#    cat .config > "${startdir}/config.x86_64.last"
#  else
#    cat .config > "${startdir}/config.last"
#  fi
}

build() {
  cd "${srcdir}/linux-${_basekernel}"

  make ${MAKEFLAGS} LOCALVERSION= bzImage modules
}

package_linux-lts312-ck() {
  pkgdesc='The linux-lts312 kernel and modules with the ck2 patchset featuring the Brain Fuck Scheduler v0.444'
  #_Kpkgdesc='The linux-lts312 kernel and modules with the ck2 patchset featuring the Brain Fuck Scheduler v0.444'
  #pkgdesc="${_Kpkgdesc}"
  depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7')
  optdepends=('crda: to set the correct wireless channels of your country' 'modprobed_db: Keeps track of EVERY kernel module that has ever been probed - useful for those of us who make localmodconfig')
  backup=("etc/mkinitcpio.d/linux-lts312-ck.preset")
  install=linux-lts312-ck.install

  cd "${srcdir}/linux-${_basekernel}"

  KARCH=x86

  # get kernel version
  _kernver="$(make LOCALVERSION= kernelrelease)"

  mkdir -p "${pkgdir}"/{lib/modules,lib/firmware,boot}
  make LOCALVERSION= INSTALL_MOD_PATH="${pkgdir}" modules_install
  cp arch/$KARCH/boot/bzImage "${pkgdir}/boot/vmlinuz-linux-lts312-ck"

  # set correct depmod command for install
  cp -f "${startdir}/${install}" "${startdir}/${install}.pkg"
  true && install=${install}.pkg

  sed \
    -e  "s/KERNEL_NAME=.*/KERNEL_NAME=-lts312-ck/g" \
    -e  "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/g" \
    -i "${startdir}/${install}"

  # install mkinitcpio preset file for kernel
  install -D -m644 "${srcdir}/linux-lts312-ck.preset" "${pkgdir}/etc/mkinitcpio.d/linux-lts312-ck.preset"
  sed \
    -e "1s|'linux.*'|'linux-lts312-ck'|" \
    -e "s|ALL_kver=.*|ALL_kver=\"/boot/vmlinuz-linux-lts312-ck\"|" \
    -e "s|default_image=.*|default_image=\"/boot/initramfs-linux-lts312-ck.img\"|" \
    -e "s|fallback_image=.*|fallback_image=\"/boot/initramfs-linux-lts312-ck-fallback.img\"|" \
    -i "${pkgdir}/etc/mkinitcpio.d/linux-lts312-ck.preset"

  # remove build and source links
  rm -f "${pkgdir}"/lib/modules/${_kernver}/{source,build}
  # remove the firmware
  rm -rf "${pkgdir}/lib/firmware"
  # gzip -9 all modules to save 100MB of space
  find "${pkgdir}" -name '*.ko' -exec gzip -9 {} \;
  # make room for external modules
  ln -s "../extramodules-${_basekernel}${_kernelname:lts312-ck}" "${pkgdir}/lib/modules/${_kernver}/extramodules"
  # add real version for building modules and running depmod from post_install/upgrade
  mkdir -p "${pkgdir}/lib/modules/extramodules-${_basekernel}${_kernelname:lts312-ck}"
  echo "${_kernver}" > "${pkgdir}/lib/modules/extramodules-${_basekernel}${_kernelname:lts312-ck}/version"

  # Now we call depmod...
  depmod -b "${pkgdir}" -F System.map "${_kernver}"

  # move module tree /lib -> /usr/lib
  mkdir -p "${pkgdir}/usr"
  mv "${pkgdir}/lib" "${pkgdir}/usr/"
 
  # add vmlinux
  install -D -m644 vmlinux "${pkgdir}/usr/lib/modules/${_kernver}/build/vmlinux"
}

package_linux-lts312-ck-headers() {
  pkgdesc='Header files and scripts to build modules for linux-lts312-ck.'
  #_Hpkgdesc='Header files and scripts to build modules for linux-lts312-ck.'
  #pkgdesc="${_Hpkgdesc}"	
  depends=('linux-lts312-ck') # added to keep kernel and headers packages matched

  install -dm755 "${pkgdir}/usr/lib/modules/${_kernver}"

  cd "${srcdir}/linux-${_basekernel}"
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

  # add headers for lirc package
  # pci
  for i in bt8xx cx88 saa7134; do
    mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/pci/${i}"
    cp -a drivers/media/pci/${i}/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/pci/${i}"
  done
  # usb
  for i in cpia2 em28xx pwc sn9c102; do
    mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/usb/${i}"
    cp -a drivers/media/usb/${i}/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/usb/${i}"
  done
  # i2c
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/i2c"
  cp drivers/media/i2c/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/i2c/"
  for i in cx25840; do
    mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/i2c/${i}"
    cp -a drivers/media/i2c/${i}/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/i2c/${i}"
  done

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
  [[ -n $(ls include/config/dvb/*.h &>/dev/null) ]] && cp include/config/dvb/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/include/config/dvb/"

  # add dvb headers for http://mcentral.de/hg/~mrec/em28xx-new
  # in reference to:
  # http://bugs.archlinux.org/task/13146
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-frontends/"
  cp drivers/media/dvb-frontends/lgdt330x.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-frontends/"
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
  cp fs/xfs/xfs_sb.h "${pkgdir}/usr/lib/modules/${_kernver}/build/fs/xfs/xfs_sb.h"

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
  rm -rf "${pkgdir}"/usr/src/linux-${_kernver}/arch/{alpha,arc,arm,arm26,arm64,avr32,blackfin,c6x,cris,frv,h8300,hexagon,ia64,m32r,m68k,m68knommu,metag,mips,microblaze,mn10300,openrisc,parisc,powerpc,ppc,s390,score,sh,sh64,sparc,sparc64,tile,unicore32,um,v850,xtensa}
}

# Global pkgdesc and depends are here so that they will be picked up by AUR
pkgdesc="The ${_pkgname} kernel and modules - 3.12 longterm stable kernel"
