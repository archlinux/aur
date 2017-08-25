# Maintainer: Tom Nguyen <tom81094@gmail.com>
# Contributor: Boohbah <boohbah at gmail.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jonathan Chan <jyc@fastmail.fm>
# Contributor: misc <tastky@gmail.com>
# Contributor: NextHendrix <cjones12 at sheffield.ac.uk>

### BUILD OPTIONS
# Set these variables to ANYTHING that is not null to enable them

# Use tentative patches from https://groups.google.com/forum/#!forum/bfq-iosched
_use_tentative_patches=

### Use mailing-list patches; many thanks to Piotr "sir_lucjan" Gorski
# ML1 - [PATCH V2 00/20] blk-mq-sched: improve SCSI-MQ performance: http://marc.info/?l=linux-block&m=150191624318513&w=2
_use_ml_patches=

# Running with a 1000 HZ tick rate
_1k_HZ_ticks=

### Enable fancontrol for DELL
_dell_fancontrol=

### Set performance governor as default
_per_gov=

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

# Use the current kernel's .config file
# Enabling this option will use the .config of the RUNNING kernel rather than
# the ARCH defaults. Useful when the package gets updated and you already went
# through the trouble of customizing your config options.  NOT recommended when
# a new kernel is released, but again, convenient for package bumps.
_use_current=

### Disable Deadline I/O scheduler
_deadline_disable=

### Disable CFQ I/O scheduler
_CFQ_disable=

### Disable Kyber I/O scheduler
_kyber_disable=

### Do no edit below this line unless you know what you're doing

pkgbase=linux-bfq-mq-git
_pkgver=4.13-rc3
_srcname=bfq-mq
pkgver=4.13rc3.27af2752129c
pkgrel=2
arch=('i686' 'x86_64')
url="http://www.kernel.org/"
license=('GPL2')
makedepends=('xmlto' 'docbook-xsl' 'kmod' 'inetutils' 'bc' 'git' 'libelf')
options=('!strip')

_bfqpath="https://gitlab.com/tom81094/custom-patches/raw/master/bfq-mq"
_mlpath_1="${_bfqpath}/mailing-list/blk-mq-sched-improve-SCSI-MQ-performance"
_bfqgroup="https://groups.google.com/group/bfq-iosched/attach"
source=(# bfq-mq repository
        'git+https://github.com/Algodev-github/bfq-mq'
        # tentative patches
        "${_bfqpath}/tentative/T0001-Check-presence-on-tree-of-every-entity-after-every-a.patch"
        # mailing-list (ML1) patches
        "${_mlpath_1}/ML1-0001-blk-mq-sched-fix-scheduler-bad-performance.patch"
        "${_mlpath_1}/ML1-0002-sbitmap-introduce-__sbitmap_for_each_set.patch"
        "${_mlpath_1}/ML1-0003-blk-mq-introduce-blk_mq_dispatch_rq_from_ctx.patch"
        "${_mlpath_1}/ML1-0004-blk-mq-sched-move-actual-dispatching-into-one-helper.patch"
        "${_mlpath_1}/ML1-0005-blk-mq-sched-improve-dispatching-from-sw-queue.patch"
        "${_mlpath_1}/ML1-0006-blk-mq-sched-don-t-dequeue-request-until-all-in-disp.patch"
        "${_mlpath_1}/ML1-0007-blk-mq-sched-introduce-blk_mq_sched_queue_depth.patch"
        "${_mlpath_1}/ML1-0008-blk-mq-sched-use-q-queue_depth-as-hint-for-q-nr_requ.patch"
        "${_mlpath_1}/ML1-0009-blk-mq-introduce-BLK_MQ_F_SHARED_DEPTH.patch"
        "${_mlpath_1}/ML1-0010-blk-mq-sched-introduce-helpers-for-query-change-busy.patch"
        "${_mlpath_1}/ML1-0011-blk-mq-introduce-helpers-for-operating-dispatch-list.patch"
        "${_mlpath_1}/ML1-0012-blk-mq-introduce-pointers-to-dispatch-lock-list.patch"
        "${_mlpath_1}/ML1-0013-blk-mq-pass-request_queue-to-several-helpers-of-oper.patch"
        "${_mlpath_1}/ML1-0014-blk-mq-sched-improve-IO-scheduling-on-SCSI-devcie.patch"
        "${_mlpath_1}/ML1-0015-block-introduce-rqhash-helpers.patch"
        "${_mlpath_1}/ML1-0016-block-move-actual-bio-merge-code-into-__elv_merge.patch"
        "${_mlpath_1}/ML1-0017-block-add-check-on-elevator-for-supporting-bio-merge.patch"
        "${_mlpath_1}/ML1-0018-block-introduce-.last_merge-and-.hash-to-blk_mq_ctx.patch"
        "${_mlpath_1}/ML1-0019-blk-mq-sched-refactor-blk_mq_sched_try_merge.patch"
        "${_mlpath_1}/ML1-0020-blk-mq-improve-bio-merge-from-blk-mq-sw-queue.patch"
        # the main kernel config files
        'config.i686' 'config.x86_64'
        # pacman hook for initramfs regeneration
        '90-linux.hook'
        # standard config files for mkinitcpio ramdisk
        'linux.preset')
sha256sums=(# bfq-mq repository
            'SKIP'
            # tentative patches
            'eb3cb1a9e487c54346b798b57f5b505f8a85fd1bc839d8f00b2925e6a7d74531'
            # mailing-list (ML1) patches
            '65e96b9922da50fafbb20e1f466fac00fa467fba032f9cee40e87f4f352623c5'
            '2065492541ffa62d7cf88b11428dc47de2089645f9bb3030dbb46bb496726960'
            '1a120273880249ca9e04aef713e2f2dbd96e020cf2e2ab6b6750524afee68d26'
            'f7faa4d3246b220d79ad2f17ecf5872ac4b7ee6c7b20e967a53ac7fec22a73e1'
            'ea250a90e9c654bd28f84f7d2441eebe255aa0df338691451097403390902dbc'
            'a9eba2301546ddce09b758c8680064f724aec1c1f5b3f537e8386441186c4908'
            'e7c330bdf9348f6b9b91a7450bbf86b08b4090b63004c9d0ae2517cebba36f10'
            '7a2bf65e7929bfd0d9d330b45f5f0a65749a2063e8e40e8bfebebbf9a295c95d'
            '7e33f1ac2e4e455a204352b1ce57982b78644b1d201d6a8390165e81e900d90e'
            'e1e3603c08134bbea1268fc013179cc8bbccae6c8a5bc14c5a6c6ef9fd8d33bb'
            '084d1d69bfa199659ca05ec41dc0767e8a0bd0fc9a211cd5cd3b32b267c3f4db'
            '07d2bd9e0f9f4e8daabf98361479148b82224d5bf85981fdc86efbe66c7fc050'
            '050a3bc2c418440cb07d59af04a158cdc738f1995f9fbf55435cacc5b327cdc1'
            '0dac1e1b66af0ce386fccd637088a23548b663d235e0d177f1e463d156062d1f'
            '712d1325ddda8645e7bf2dd3c25464b71bbe936776cde0b796c804d04d6db2c4'
            '67e5d9d1cef1e24bb33fff731ddba09d696c8f24fa7a9831ed4cf54ed6401f1e'
            '038288b840ea24f70ba2114a0e7c27597855b102ddaa9b806e78fb9edef60bdc'
            '29d9e8140d36e637cf8c4ccaafc80a163bfd15a9db24259d4c6c6b7c7241243f'
            'd729b76f056e022876d78d2a6b50e2287c2c7b44712ab959ecf2a1075e1ad533'
            'acb932dca6cff9ea0f678161eb96e3bf90ce8db2bc7d3a2fac44e9ad585a94dc'
            # the main kernel config files
            'baff5c7eb82c1e10d05a9575d95004da7855f7f69de3af30f780b31ead3dfe9d'
            'bb799d15e72c379fb25a76e060f907444351336bfd9eeaf46168f991cea6d7ec'
            # pacman hook for initramfs regeneration
            '834bd254b56ab71d73f59b3221f056c72f559553c04718e350ab2a3e2991afe0'
            # standard config files for mkinitcpio ramdisk
            'ad6344badc91ad0630caacde83f7f9b97276f80d26a20619a87952be65492c65')

_kernelname=${pkgbase#linux}

pkgver() {
  cd "${_srcname}"

  #git describe --long | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g;s/\.rc/rc/'
  echo "$(echo ${_pkgver}. && git rev-parse --short HEAD)" | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g;s/\.rc/rc/;s/ //g'
}

prepare() {
  cd "${_srcname}"

  # Patches related to BUG_ON(entity->tree && entity->tree != &st->active) in __bfq_requeue_entity();
  if [ -n "$_use_tentative_patches" ]; then
    msg "Apply tentative patches"
    for p in "${srcdir}"/0001*.patch*; do patch -Np1 -i "$p"; done
  fi

  ### Patches from mailing-list
  # ML1 - [PATCH V2 00/20] blk-mq-sched: improve SCSI-MQ performance: http://marc.info/?l=linux-block&m=150191624318513&w=2
  if [ -n "$_use_ml_patches" ]; then
    msg "Apply mailing-list patches"
    for p in "${srcdir}"/ML*.patch; do
      msg " $p"
    patch -Np1 -i "$p"; done
  fi

  # Clean tree and copy ARCH config over
  make mrproper

  cat "${srcdir}/config.${CARCH}" > ./.config

  ### Optionally set tickrate to 1000
  if [ -n "$_1k_HZ_ticks" ]; then
    msg "Setting tick rate to 1k..."
    sed -i -e 's/^CONFIG_HZ_300=y/# CONFIG_HZ_300 is not set/' \
        -i -e 's/^# CONFIG_HZ_1000 is not set/CONFIG_HZ_1000=y/' \
        -i -e 's/^CONFIG_HZ=300/CONFIG_HZ=1000/' .config
  fi

  ### Enable fancontrol
  if [ -n "$_dell_fancontrol" ]; then
    msg "Enabling I8K for Dell..."
    sed -i -e s'/CONFIG_I8K=m/CONFIG_I8K=y/' ./.config
    sed -i -e s'/CONFIG_SENSORS_DELL_SMM=m/CONFIG_SENSORS_DELL_SMM=y/' ./.config
  fi

  ### Set performance governor
  if [ -n "$_per_gov" ]; then
    msg "Setting performance governor.."
    sed -i -e s'/CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL=y/# CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL is not set/' ./.config
    sed -i -e s'/# CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set/CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y/' ./.config
    msg "Disabling uneeded governors..."
    sed -i -e s'/CONFIG_CPU_FREQ_GOV_ONDEMAND=m/# CONFIG_CPU_FREQ_GOV_ONDEMAND is not set/' ./.config
    sed -i -e s'/CONFIG_CPU_FREQ_GOV_CONSERVATIVE=m/# CONFIG_CPU_FREQ_GOV_CONSERVATIVE is not set/' ./.config
    sed -i -e s'/CONFIG_CPU_FREQ_GOV_USERSPACE=m/# CONFIG_CPU_FREQ_GOV_USERSPACE is not set/' ./.config
    sed -i -e s'/CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y/# CONFIG_CPU_FREQ_GOV_SCHEDUTIL is not set/' ./.config
  fi

  ### Optionally disable NUMA for 64-bit kernels only
  # (x86 kernels do not support NUMA)
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

  ### Optionally use running kernel's config
  # code originally by nous; http://aur.archlinux.org/packages.php?ID=40191
  if [ -n "$_use_current" ]; then
    if [[ -s /proc/config.gz ]]; then
      msg "Extracting config from /proc/config.gz..."
      # modprobe configs
      zcat /proc/config.gz > ./.config
    else
      warning "Your kernel was not compiled with IKCONFIG_PROC!"
      warning "You cannot read the current config!"
      warning "Aborting!"
      exit
    fi
  fi

  ### Disable Deadline I/O scheduler
  if [ -n "$_deadline_disable" ]; then
    msg "Disabling Deadline I/O scheduler..."
    sed -i -e s'/CONFIG_IOSCHED_DEADLINE=y/# CONFIG_IOSCHED_DEADLINE is not set/' ./.config
    sed -i -e s'/CONFIG_MQ_IOSCHED_DEADLINE=y/# CONFIG_MQ_IOSCHED_DEADLINE is not set/' ./.config
  fi

  ### Disable CFQ I/O scheduler
  if [ -n "$_CFQ_disable" ]; then
    msg "Disabling CFQ I/O scheduler..."
    sed -i -e s'/CONFIG_IOSCHED_CFQ=y/# CONFIG_IOSCHED_CFQ is not set/' ./.config
    sed -i -e s'/CONFIG_CFQ_GROUP_IOSCHED=y/# CONFIG_CFQ_GROUP_IOSCHED is not set/' ./.config
  fi

  ### Disable Kyber I/O scheduler
  if [ -n "$_kyber_disable" ]; then
    msg "Disabling Kyber I/O scheduler..."
    sed -i -e s'/CONFIG_MQ_IOSCHED_KYBER=y/# CONFIG_MQ_IOSCHED_KYBER is not set/' ./.config
  fi

  # set localversion to git commit
  sed -i "s|CONFIG_LOCALVERSION=.*|CONFIG_LOCALVERSION=\"-${pkgver##*.}\"|g" ./.config
  sed -i "s|CONFIG_LOCALVERSION_AUTO=.*|CONFIG_LOCALVERSION_AUTO=n|" ./.config

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

  # load configuration
  # Configure the kernel. Replace the line below with one of your choice.
  #make menuconfig # CLI menu for configuration
  #make nconfig # new CLI menu for configuration
  #make xconfig # X-based configuration
  #make oldconfig # using old config from previous kernel version
  #make olddefconfig # old config from previous kernel, defaults for new options
  # ... or manually edit .config

  # rewrite configuration
  yes "" | make config >/dev/null

  # save configuration for later reuse
  cat .config > "${startdir}/config.${CARCH}.last"
}

build() {
  cd "${_srcname}"

  make ${MAKEFLAGS} LOCALVERSION= bzImage modules
}

_package() {
  pkgdesc="The ${pkgbase/linux/Linux} kernel and modules with the BFQ-MQ scheduler"
  depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7')
  optdepends=('crda: to set the correct wireless channels of your country' 'modprobed-db: Keeps track of EVERY kernel module that has ever been probed - useful for those of us who make localmodconfig')
  provides=("${pkgbase}=${pkgver}" "linux=${pkgver}")
  backup=("etc/mkinitcpio.d/${pkgbase}.preset")
  install=linux.install

  cd "${_srcname}"

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
  sed "s|%PKGBASE%|${pkgbase}|g" "${srcdir}/linux.preset" |
  install -D -m644 /dev/stdin "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"

  # install pacman hook for initramfs regeneration
  sed "s|%PKGBASE%|${pkgbase}|g" "${srcdir}/90-linux.hook" |
    install -D -m644 /dev/stdin "${pkgdir}/usr/share/libalpm/hooks/90-${pkgbase}.hook"

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

  # add System.map
  install -D -m644 System.map "${pkgdir}/boot/System.map-${_kernver}"
}

_package-headers() {
pkgdesc="Header files and scripts for building modules for ${pkgbase/linux/Linux} kernel (git version)"
  provides=("${pkgbase}-headers=${pkgver}" "linux-headers=${pkgver}")
  depends=("${pkgbase}=${pkgver}")

  install -dm755 "${pkgdir}/usr/lib/modules/${_kernver}"

  cd "${_srcname}"
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
  #install -D -m644 Documentation/DocBook/Makefile \
  #  "${pkgdir}/usr/lib/modules/${_kernver}/build/Documentation/DocBook/Makefile"

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

  # Fix file conflict with -doc package
  rm "${pkgdir}/usr/lib/modules/${_kernver}/build/Documentation/kbuild"/Kconfig.*-*

  # Add objtool for CONFIG_STACK_VALIDATION
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/tools"
  cp -a tools/objtool "${pkgdir}/usr/lib/modules/${_kernver}/build/tools"

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
  provides=("${pkgbase}-docs=${pkgver}" "linux-docs=${pkgver}")
  depends=("${pkgbase}=${pkgver}")

  cd "${_srcname}"

  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build"
  cp -al Documentation "${pkgdir}/usr/lib/modules/${_kernver}/build"
  find "${pkgdir}" -type f -exec chmod 444 {} \;
  find "${pkgdir}" -type d -exec chmod 755 {} \;

  # remove a file already in linux package
  #rm -f "${pkgdir}/usr/lib/modules/${_kernver}/build/Documentation/DocBook/Makefile"
}

pkgname=("${pkgbase}" "${pkgbase}-headers" "${pkgbase}-docs")
for _p in ${pkgname[@]}; do
  eval "package_${_p}() {
    $(declare -f "_package${_p#${pkgbase}}")
    _package${_p#${pkgbase}}
  }"
done

# vim:set ts=8 sts=2 sw=2 et:
