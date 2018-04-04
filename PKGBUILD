# Maintainer: Tom Nguyen <tom81094@gmail.com>
# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
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

### Enable MQ scheduling 
_mq_enable=

### Do no edit below this line unless you know what you're doing

pkgbase=linux-bfq-mq-git
_srcname=bfq-mq
pkgver=4.15.0.g1f77c173aaa8
pkgrel=1
arch=('x86_64')
url="http://www.kernel.org/"
license=('GPL2')
makedepends=('xmlto' 'docbook-xsl' 'kmod' 'inetutils' 'bc' 'git' 'libelf')
options=('!strip')
_gcc_patch='enable_additional_cpu_optimizations_for_gcc_v4.9+_kernel_v4.13+.patch'
_bfqpath="https://gitlab.com/tom81094/custom-patches/raw/master/bfq-mq"
#_lucjanpath="https://raw.githubusercontent.com/sirlucjan/kernel-patches/master/4.14"
_lucjanpath="https://gitlab.com/sirlucjan/kernel-patches/raw/master/4.14"
_bfqgroup="https://groups.google.com/group/bfq-iosched/attach"
_gcc_name="kernel_gcc_patch"
_gcc_rel='20180310'
_gcc_path="https://github.com/graysky2/kernel_gcc_patch/archive"
_gcc_patch="enable_additional_cpu_optimizations_for_gcc_v4.9+_kernel_v4.13+.patch"

source=(# bfq-mq repository
        'git+https://github.com/Algodev-github/bfq-mq'
        "${_gcc_name}-${_gcc_rel}.tar.gz::${_gcc_path}/${_gcc_rel}.tar.gz"
        # tentative patches
        "${_bfqpath}/tentative/T0001-Check-presence-on-tree-of-every-entity-after-every-a.patch"
        # the main kernel config files
        'config'
         # pacman hook for depmod
        '60-linux.hook'
         # pacman hook for initramfs regeneration
        '90-linux.hook'
         # pacman hook for remove initramfs
        '99-linux.hook'
         # standard config files for mkinitcpio ramdisk
        'linux.preset')
sha256sums=('SKIP'
            'b2c1292e06544465b636543e6ac8a01959470d32ce3664460721671f1347c815'
            'eb3cb1a9e487c54346b798b57f5b505f8a85fd1bc839d8f00b2925e6a7d74531'
            '8edcf9bd4d88f149ee496b1418202af1d79d111bccfdcd64367a622a8d8b70d7'
            'ae2e95db94ef7176207c690224169594d49445e04249d2499e9d2fbc117a0b21'
            '75f99f5239e03238f88d1a834c50043ec32b1dc568f2cc291b07d04718483919'
            '5f6ba52aaa528c4fa4b1dc097e8930fad0470d7ac489afcb13313f289ca32184'
            'ad6344badc91ad0630caacde83f7f9b97276f80d26a20619a87952be65492c65')

_kernelname=${pkgbase#linux}

pkgver() {
  cd ${_srcname}

    _ver="$(cat Makefile | grep -m3 -e VERSION -e PATCHLEVEL -e SUBLEVEL | grep -o "[[:digit:]]*" | paste -sd'.')"
    echo "${_ver}.g$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${_srcname}

  ### Patches related to BUG_ON(entity->tree && entity->tree != &st->active) in __bfq_requeue_entity();
  if [ -n "$_use_tentative_patches" ]; then
    msg "Apply tentative patches"
    for p in ../T000*.patch; do patch -Np1 -i "$p"; done
  fi

  # add latest fixes from stable queue, if needed
  # http://git.kernel.org/?p=linux/kernel/git/stable/stable-queue.git

  ### Patch source to enable more gcc CPU optimizatons via the make nconfig
  msg "Patch source with gcc patch to enable more cpus types"
  patch -Np1 -i ../kernel_gcc_patch-${_gcc_rel}/${_gcc_patch}

  # Clean tree and copy ARCH config over
  make mrproper

  cat ../config - >.config <<END
CONFIG_LOCALVERSION="${_kernelname}"
CONFIG_LOCALVERSION_AUTO=n
END

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
  
  ### Enable MQ scheduling
  if [ -n "$_mq_enable" ]; then
    msg "Enable MQ scheduling..."
    sed -i -e s'/^# CONFIG_SCSI_MQ_DEFAULT is not set/CONFIG_SCSI_MQ_DEFAULT=y/' \
        -i -e s'/^# CONFIG_DM_MQ_DEFAULT is not set/CONFIG_DM_MQ_DEFAULT=y/' ./.config
  fi

  # set extraversion to pkgrel and empty localversion
    sed -e "/^EXTRAVERSION =/s/=.*/= -${pkgrel}/" \
        -e "/^EXTRAVERSION =/aLOCALVERSION =" \
        -i Makefile

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
  # ... or manually edit .config

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
  pkgdesc="The ${pkgbase/linux/Linux} kernel and modules with the BFQ-MQ scheduler"
  depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7')
  optdepends=('crda: to set the correct wireless channels of your country' 'modprobed-db: Keeps track of EVERY kernel module that has ever been probed - useful for those of us who make localmodconfig')
  provides=("${pkgbase}=${pkgver}" "linux=${pkgver}")
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
    sed "${_subst}" ../99-linux.hook |
        install -Dm644 /dev/stdin "${pkgdir}/usr/share/libalpm/hooks/99-${pkgbase}.hook"     
}

_package-headers() {
  pkgdesc="Header files and scripts for building modules for ${pkgbase/linux/Linux} kernel"
  provides=("${pkgbase}-headers=${pkgver}" "linux-headers=${pkgver}")
  depends=("${pkgbase}=${pkgver}")

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

    # remove files already in linux-uksml-docs package
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
  provides=("${pkgbase}-docs=${pkgver}" "linux-docs=${pkgver}")
  depends=("${pkgbase}=${pkgver}")

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
