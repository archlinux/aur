# Maintainer: Tom Nguyen <tom81094@gmail.com>
# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>

### BUILD OPTIONS
# Set these variables to ANYTHING that is not null to enable them

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

### Disable MQ scheduling
_mq_disable=

### Running with a 1000 HZ tick rate
_1k_HZ_ticks=

### Do no edit below this line unless you know what you're doing

pkgbase=linux-bfq-mq
#pkgbase=linux-custom       # Build kernel with a different name
_major=4.19
pkgver=4.19.11
_srcpatch="${pkgver}"
_srcname="linux-${pkgver}"
pkgrel=3
arch=('x86_64')
url="https://github.com/Algodev-github/bfq-mq/"
license=('GPL2')
makedepends=('kmod' 'inetutils' 'bc' 'libelf' 'python-sphinx' 'graphviz')
options=('!strip')
_bfqpath="https://gitlab.com/tom81094/custom-patches/raw/master/bfq-mq"
_lucjanpath="https://gitlab.com/sirlucjan/kernel-patches/raw/master/4.19"
#_lucjanpath="https://raw.githubusercontent.com/sirlucjan/kernel-patches/master/4.19"
_gcc_path="https://raw.githubusercontent.com/graysky2/kernel_gcc_patch/master"
_gcc_patch="enable_additional_cpu_optimizations_for_gcc_v8.1+_kernel_v4.13+.patch"
_bfq_sq_mq_path="bfq-sq-mq"
_bfq_sq_mq_ver='v9r1'
_bfq_sq_mq_rel='2K181212-rc1'
_bfq_sq_mq_patch="${_major}-bfq-sq-mq-${_bfq_sq_mq_ver}-${_bfq_sq_mq_rel}.patch"

source=(# mainline kernel patches
        "https://www.kernel.org/pub/linux/kernel/v4.x/${_srcname}.tar.xz"
        "https://www.kernel.org/pub/linux/kernel/v4.x/${_srcname}.tar.sign"
        # gcc cpu optimizatons from graysky and ck
        "${_gcc_path}/${_gcc_patch}"
        # bfq-mq patch
        "${_lucjanpath}/${_bfq_sq_mq_path}/${_bfq_sq_mq_patch}"
        "${_lucjanpath}/0100-Check-presence-on-tree-of-every-entity-after-every-a.patch"
        "${_lucjanpath}/arch-patches/0001-add-sysctl-to-disallow-unprivileged-CLONE_NEWUSER-by.patch"
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

sha256sums=('1a5eb3452103803feb568d948538a97b4046d6c77f9c26b6c2c9af0ddc5c79ec'
            'SKIP'
            '9f7177679c8d3f8d699ef0566a51349d828436dba04603bc2223f98c60d2d178'
            '8761152216a204b0bbf2bd581abc3f5cdf851cec8b807316528b72a7b552ef12'
            'eb3cb1a9e487c54346b798b57f5b505f8a85fd1bc839d8f00b2925e6a7d74531'
            '1bc55e0c12f1ea9bf4b823fc78b91e12cf1cf1972f778484fbd5fa0d9e8264f2'
            'b4af416fab79b5ef8c8c62647d704658ce60d83a9c106e9f6aa9113077a5893c'
            'ae2e95db94ef7176207c690224169594d49445e04249d2499e9d2fbc117a0b21'
            'c043f3033bb781e2688794a59f6d1f7ed49ef9b13eb77ff9a425df33a244a636'
            'ed9d35cb7d7bd829ff6253353efa5e2d119820fe4f4310aea536671f5e4caa37'
            'ad6344badc91ad0630caacde83f7f9b97276f80d26a20619a87952be65492c65')
validpgpkeys=(
              '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman
             )

_kernelname=${pkgbase#linux}
: ${_kernelname:=-bfq-mq} 

prepare() {
  cd ${_srcname}

  ### Setting version
        msg2 "Setting version..."
        sed -e "/^EXTRAVERSION =/s/=.*/=/" -i Makefile
        scripts/setlocalversion --save-scmversion
        echo "-$pkgrel" > localversion.10-pkgrel
        echo "$_kernelname" > localversion.20-pkgname

    ### Patching sources
        local src
        for src in "${source[@]}"; do
            src="${src%%::*}"
            src="${src##*/}"
            [[ $src = *.patch ]] || continue
        msg2 "Applying patch $src..."
        patch -Np1 < "../$src"
        done

    ### Setting config
        msg2 "Setting config..."
        cp ../config .config
        make olddefconfig

    ### Prepared version
        make -s kernelrelease > ../version
        msg2 "Prepared %s version %s" "$pkgbase" "$(<../version)"

    ### Optionally set tickrate to 1000 
        if [ -n "$_1k_HZ_ticks" ]; then
        msg "Setting tick rate to 1k..."
        sed -i -e 's/^CONFIG_HZ_300=y/# CONFIG_HZ_300 is not set/' \
            -i -e 's/^# CONFIG_HZ_1000 is not set/CONFIG_HZ_1000=y/' \
            -i -e 's/^CONFIG_HZ=300/CONFIG_HZ=1000/' ./.config
        fi

    ### Enable fancontrol
        if [ -n "$_dell_fancontrol" ]; then
        msg "Enabling I8K for Dell..."
        sed -i -e s'/^CONFIG_I8K=m/CONFIG_I8K=y/' \
            -i -e s'/^CONFIG_SENSORS_DELL_SMM=m/CONFIG_SENSORS_DELL_SMM=y/' ./.config    
        fi

    ### Set performance governor
        if [ -n "$_per_gov" ]; then
        msg "Setting performance governor.."
        sed -i -e s'/^CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL=y/# CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL is not set/' \
            -i -e s'/^# CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set/CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y/' ./.config
        msg "Disabling uneeded governors..."
        sed -i -e s'/^CONFIG_CPU_FREQ_GOV_ONDEMAND=m/# CONFIG_CPU_FREQ_GOV_ONDEMAND is not set/' \
            -i -e s'/^CONFIG_CPU_FREQ_GOV_CONSERVATIVE=m/# CONFIG_CPU_FREQ_GOV_CONSERVATIVE is not set/' \
            -i -e s'/^CONFIG_CPU_FREQ_GOV_USERSPACE=m/# CONFIG_CPU_FREQ_GOV_USERSPACE is not set/' \
            -i -e s'/^CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y/# CONFIG_CPU_FREQ_GOV_SCHEDUTIL is not set/' ./.config
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
        sed -i -e s'/^CONFIG_IOSCHED_CFQ=y/# CONFIG_IOSCHED_CFQ is not set/' \
        -i -e s'/^CONFIG_CFQ_GROUP_IOSCHED=y/# CONFIG_CFQ_GROUP_IOSCHED is not set/' ./.config	
        fi

    ### Disable Kyber I/O scheduler
        if [ -n "$_kyber_disable" ]; then
        msg "Disabling Kyber I/O scheduler..."
        sed -i -e s'/CONFIG_MQ_IOSCHED_KYBER=y/# CONFIG_MQ_IOSCHED_KYBER is not set/' ./.config
        fi

    ### Disable MQ scheduling
	if [ -n "$_mq_disable" ]; then
		msg2 "Disabling MQ scheduling..."
		sed -i -e s'/^CONFIG_SCSI_MQ_DEFAULT=y/# CONFIG_SCSI_MQ_DEFAULT is not set/' \
		    -i -e s'/^CONFIG_DM_MQ_DEFAULT=y/# CONFIG_DM_MQ_DEFAULT is not set/' ./.config
        fi



    ### Optionally load needed modules for the make localmodconfig
        # See https://aur.archlinux.org/packages/modprobed-db
        if [ -n "$_localmodcfg" ]; then
        msg2 "If you have modprobed-db installed, running it in recall mode now"
            if [ -e /usr/bin/modprobed-db ]; then
            [[ -x /usr/bin/sudo ]] || {
            echo "Cannot call modprobe with sudo. Install sudo and configure it to work with this user."
            exit 1; }
            sudo /usr/bin/modprobed-db recall
            make localmodconfig
            fi
        fi

    # save configuration for later reuse
    cat .config > "${startdir}/config.last"
}

build() {
  cd ${_srcname}

  make bzImage modules htmldocs
}

_package() {
  pkgdesc="The ${pkgbase/linux/Linux} kernel and modules with the BFQ-MQ scheduler"
  depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7')
  optdepends=('crda: to set the correct wireless channels of your country' 'modprobed-db: Keeps track of EVERY kernel module that has ever been probed - useful for those of us who make localmodconfig')
  provides=("${pkgbase}=${pkgver}" "linux=${pkgver}")
  backup=("etc/mkinitcpio.d/${pkgbase}.preset")
  install=linux.install

  local kernver="$(<version)"
  local modulesdir="$pkgdir/usr/lib/modules/$kernver"

  cd $_srcname

  msg2 "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"
  install -Dm644 "$modulesdir/vmlinuz" "$pkgdir/boot/vmlinuz-$pkgbase"

  msg2 "Installing modules..."
  make INSTALL_MOD_PATH="$pkgdir/usr" modules_install

  # a place for external modules,
  # with version file for building modules and running depmod from hook
  local extramodules="extramodules$_kernelname"
  local extradir="$pkgdir/usr/lib/modules/$extramodules"
  install -Dt "$extradir" -m644 ../version
  ln -sr "$extradir" "$modulesdir/extramodules"

  # remove build and source links
  rm "$modulesdir"/{source,build}

  msg2 "Installing hooks..."

  # sed expression for following substitutions
  local subst="
    s|%PKGBASE%|$pkgbase|g
    s|%KERNVER%|$kernver|g
    s|%EXTRAMODULES%|$extramodules|g
  "

  # hack to allow specifying an initially nonexisting install file
  sed "$subst" "$startdir/$install" > "$startdir/$install.pkg"
  true && install=$install.pkg

  # fill in mkinitcpio preset and pacman hooks
  sed "$subst" ../linux.preset | install -Dm644 /dev/stdin \
    "$pkgdir/etc/mkinitcpio.d/$pkgbase.preset"
  sed "$subst" ../60-linux.hook | install -Dm644 /dev/stdin \
    "$pkgdir/usr/share/libalpm/hooks/60-${pkgbase}.hook"
  sed "$subst" ../90-linux.hook | install -Dm644 /dev/stdin \
    "$pkgdir/usr/share/libalpm/hooks/90-${pkgbase}.hook"
  sed "$subst" ../99-linux.hook | install -Dm644 /dev/stdin \
    "$pkgdir/usr/share/libalpm/hooks/99-${pkgbase}.hook"

  msg2 "Fixing permissions..."
  chmod -Rc u=rwX,go=rX "$pkgdir"
}

_package-headers() {
  pkgdesc="Header files and scripts for building modules for ${pkgbase/linux/Linux} kernel"
  provides=("${pkgbase}-headers=${pkgver}" "linux-headers=${pkgver}")
  depends=("${pkgbase}=${pkgver}")

    local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  cd $_srcname

  msg2 "Installing build files..."
  install -Dt "$builddir" -m644 Makefile .config Module.symvers System.map vmlinux
  install -Dt "$builddir/kernel" -m644 kernel/Makefile
  install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile
  cp -t "$builddir" -a scripts

  # add objtool for external module building and enabled VALIDATION_STACK option
  install -Dt "$builddir/tools/objtool" tools/objtool/objtool

  # add xfs and shmem for aufs building
  mkdir -p "$builddir"/{fs/xfs,mm}

  # ???
  mkdir "$builddir/.tmp_versions"

  msg2 "Installing headers..."
  cp -t "$builddir" -a include
  cp -t "$builddir/arch/x86" -a arch/x86/include
  install -Dt "$builddir/arch/x86/kernel" -m644 arch/x86/kernel/asm-offsets.s

  install -Dt "$builddir/drivers/md" -m644 drivers/md/*.h
  install -Dt "$builddir/net/mac80211" -m644 net/mac80211/*.h

  # http://bugs.archlinux.org/task/13146
  install -Dt "$builddir/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h

  # http://bugs.archlinux.org/task/20402
  install -Dt "$builddir/drivers/media/usb/dvb-usb" -m644 drivers/media/usb/dvb-usb/*.h
  install -Dt "$builddir/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/*.h
  install -Dt "$builddir/drivers/media/tuners" -m644 drivers/media/tuners/*.h

  msg2 "Installing KConfig files..."
  find . -name 'Kconfig*' -exec install -Dm644 {} "$builddir/{}" \;

  msg2 "Removing unneeded architectures..."
  local arch
  for arch in "$builddir"/arch/*/; do
    [[ $arch = */x86/ ]] && continue
    echo "Removing $(basename "$arch")"
    rm -r "$arch"
  done

  msg2 "Removing documentation..."
  rm -r "$builddir/Documentation"

  msg2 "Removing broken symlinks..."
  find -L "$builddir" -type l -printf 'Removing %P\n' -delete

  msg2 "Removing loose objects..."
  find "$builddir" -type f -name '*.o' -printf 'Removing %P\n' -delete

  msg2 "Stripping build tools..."
  local file
  while read -rd '' file; do
    case "$(file -bi "$file")" in
      application/x-sharedlib\;*)      # Libraries (.so)
        strip -v $STRIP_SHARED "$file" ;;
      application/x-archive\;*)        # Libraries (.a)
        strip -v $STRIP_STATIC "$file" ;;
      application/x-executable\;*)     # Binaries
        strip -v $STRIP_BINARIES "$file" ;;
      application/x-pie-executable\;*) # Relocatable binaries
        strip -v $STRIP_SHARED "$file" ;;
    esac
  done < <(find "$builddir" -type f -perm -u+x ! -name vmlinux -print0)

  msg2 "Adding symlink..."
  mkdir -p "$pkgdir/usr/src"
  ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase-$pkgver"
  
  msg2 "Fixing permissions..."
  chmod -Rc u=rwX,go=rX "$pkgdir"
}

_package-docs() {
  pkgdesc="Kernel hackers manual - HTML documentation that comes with the ${pkgbase/linux/Linux} kernel"
  provides=("${pkgbase}-docs=${pkgver}" "linux-docs=${pkgver}")
  depends=("${pkgbase}=${pkgver}")

  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  cd $_srcname

  msg2 "Installing documentation..."
  mkdir -p "$builddir"
  cp -t "$builddir" -a Documentation

  msg2 "Removing doctrees..."
  rm -r "$builddir/Documentation/output/.doctrees"

  msg2 "Moving HTML docs..."
  local src dst
  while read -rd '' src; do
    dst="$builddir/Documentation/${src#$builddir/Documentation/output/}"
    mkdir -p "${dst%/*}"
    mv "$src" "$dst"
    rmdir -p --ignore-fail-on-non-empty "${src%/*}"
  done < <(find "$builddir/Documentation/output" -type f -print0)

  msg2 "Adding symlink..."
  mkdir -p "$pkgdir/usr/share/doc"
  ln -sr "$builddir/Documentation" "$pkgdir/usr/share/doc/$pkgbase"

  msg2 "Fixing permissions..."
  chmod -Rc u=rwX,go=rX "$pkgdir"
}

pkgname=("$pkgbase" "$pkgbase-headers" "$pkgbase-docs")
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done

# vim:set ts=8 sts=2 sw=2 et:
