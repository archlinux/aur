# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>

### BUILD OPTIONS
# Set these variables to ANYTHING that is not null to enable them

### Tweak kernel options prior to a build via nconfig
_makenconfig=

### Tweak kernel options prior to a build via menuconfig
_makemenuconfig=

### Tweak kernel options prior to a build via xconfig
_makexconfig=

### Tweak kernel options prior to a build via gconfig
_makegconfig=

### Running with a 1000 HZ tick rate
_1k_HZ_ticks=y

# NUMA is optimized for multi-socket motherboards.
# A single multi-core CPU actually runs slower with NUMA enabled.
# See, https://bugs.archlinux.org/task/31187
_NUMAdisable=y

# Compile ONLY used modules to VASTLYreduce the number of modules built
# and the build time.
#
# To keep track of which modules are needed for your specific system/hardware,
# give module_db script a try: https://aur.archlinux.org/packages/modprobed-db
# This PKGBUILD read the database kept if it exists
#
# More at this wiki page ---> https://wiki.archlinux.org/index.php/Modprobed-db
_localmodcfg=

# Use the current kernel's .config file
# Enabling this option will use the .config of the RUNNING kernel rather than
# the ARCH defaults. Useful when the package gets updated and you already went
# through the trouble of customizing your config options.  NOT recommended when
# a new kernel is released, but again, convenient for package bumps.
_use_current=

### Do not edit below this line unless you know what you're doing

pkgbase=linux-rt-bfq
# pkgname=('linux-rt-bfq' 'linux-rt-bfq-headers' 'linux-rt-bfq-docs')
_major=5.4
_minor=10
_rtver=5
_rtpatchver=rt${_rtver}
pkgver=${_major}.${_minor}.${_rtpatchver}
_pkgver=${_major}.${_minor}
_srcname=linux-${_pkgver}
pkgrel=3
pkgdesc='Linux RT-BFQ-dev'
arch=('x86_64')
url="https://github.com/sirlucjan/bfq-mq-lucjan"
license=('GPL2')
options=('!strip')
makedepends=('kmod' 'bc' 'libelf' 'python-sphinx' 'python-sphinx_rtd_theme'
             'graphviz' 'imagemagick')
#_lucjanpath="https://raw.githubusercontent.com/sirlucjan/kernel-patches/master/${_major}"
_lucjanpath="https://gitlab.com/sirlucjan/kernel-patches/raw/master/${_major}"
_bfq_path="bfq-dev-lucjan"
_bfq_ver="v11"
_bfq_rel="r2K191206"
_bfq_patch="${_major}-${_bfq_path}-${_bfq_ver}-${_bfq_rel}.patch"
_gcc_path="https://raw.githubusercontent.com/graysky2/kernel_gcc_patch/master"
_gcc_patch="enable_additional_cpu_optimizations_for_gcc_v9.1+_kernel_v4.13+.patch"

source=("https://www.kernel.org/pub/linux/kernel/v5.x/${_srcname}.tar.xz"
        "https://www.kernel.org/pub/linux/kernel/v5.x/${_srcname}.tar.sign"
        "http://www.kernel.org/pub/linux/kernel/projects/rt/${_major}/patch-${_pkgver}-${_rtpatchver}.patch.xz"
        "http://www.kernel.org/pub/linux/kernel/projects/rt/${_major}/patch-${_pkgver}-${_rtpatchver}.patch.sign"
        "${_lucjanpath}/${_bfq_path}/${_bfq_patch}"
        "${_gcc_path}/${_gcc_patch}"
        "${_lucjanpath}/arch-patches-rt-v3-sep/0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-C.patch"
        "${_lucjanpath}/arch-patches-rt-v3-sep/0002-lib-devres-add-a-helper-function-for-ioremap_uc.patch"
        "${_lucjanpath}/arch-patches-rt-v3-sep/0003-mfd-intel-lpss-Use-devm_ioremap_uc-for-MMIO.patch"
        "${_lucjanpath}/arch-patches-rt-v3-sep/0004-PCI-pciehp-Do-not-disable-interrupt-twice-on-suspend.patch"
        "${_lucjanpath}/arch-patches-rt-v3-sep/0005-PCI-pciehp-Prevent-deadlock-on-disconnect.patch"
        "${_lucjanpath}/arch-patches-rt-v3-sep/0006-ACPI-PM-s2idle-Rework-ACPI-events-synchronization.patch"
        "${_lucjanpath}/arch-patches-rt-v3-sep/0007-iwlwifi-pcie-restore-support-for-Killer-Qu-C0-NICs.patch"
        "${_lucjanpath}/arch-patches-rt-v3-sep/0008-drm-i915-save-AUD_FREQ_CNTRL-state-at-audio-domain-s.patch"
        "${_lucjanpath}/arch-patches-rt-v3-sep/0009-x86-intel-Disable-HPET-on-Intel-Ice-Lake-platforms.patch"
        "${_lucjanpath}/arch-patches-rt-v3-sep/0010-drm-i915-Fix-audio-power-up-sequence-for-gen10-displ.patch"
        "${_lucjanpath}/arch-patches-rt-v3-sep/0011-drm-i915-extend-audio-CDCLK-2-BCLK-constraint-to-mor.patch"
        "${_lucjanpath}/arch-patches-rt-v3-sep/0012-drm-i915-Limit-audio-CDCLK-2-BCLK-constraint-back-to.patch"
        "${_lucjanpath}/arch-patches-rt-v3-sep/0013-pinctrl-sunrisepoint-Add-missing-Interrupt-Status-re.patch"
        "${_lucjanpath}/arch-patches-rt-v3-sep/0014-Revert-iwlwifi-mvm-fix-scan-config-command-size.patch"
        "${_lucjanpath}/arch-patches-rt-v3-sep/0015-e1000e-Revert-e1000e-Make-watchdog-use-delayed-work.patch"
        "${_lucjanpath}/arch-patches-rt-v3-sep/0016-drm-amdgpu-Add-DC-feature-mask-to-disable-fractional.patch"
        "${_lucjanpath}/arch-patches-rt-v3-sep/0017-ptp-free-ptp-device-pin-descriptors-properly.patch"
         # the main kernel config files
        'config')

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
    cd $_srcname

    ### Add rt patch
        echo "Add rt patch"
        patch -Np1 -i ../patch-${_pkgver}-${_rtpatchver}.patch

    ### Setting version
        echo "Setting version..."
        scripts/setlocalversion --save-scmversion
        echo "-$pkgrel" > localversion.10-pkgrel
        echo "${pkgbase#linux}" > localversion.20-pkgname

    ### Patching sources
        local src
        for src in "${source[@]}"; do
            src="${src%%::*}"
            src="${src##*/}"
            [[ $src = *.patch ]] || continue
        echo "Applying patch $src..."
        patch -Np1 < "../$src"
        done

    ### Setting config
        echo "Setting config..."
        cp ../config .config
        make olddefconfig

    ### Prepared version
        make -s kernelrelease > version
        echo "Prepared %s version %s" "$pkgbase" "$(<version)"

    ### Optionally use running kernel's config
	# code originally by nous; http://aur.archlinux.org/packages.php?ID=40191
	if [ -n "$_use_current" ]; then
		if [[ -s /proc/config.gz ]]; then
			echo "Extracting config from /proc/config.gz..."
			# modprobe configs
			zcat /proc/config.gz > ./.config
		else
			warning "Your kernel was not compiled with IKCONFIG_PROC!"
			warning "You cannot read the current config!"
			warning "Aborting!"
			exit
		fi
	fi

    ### Optionally set tickrate to 1000
	if [ -n "$_1k_HZ_ticks" ]; then
		echo "Setting tick rate to 1k..."
		sed -i -e 's/^CONFIG_HZ_300=y/# CONFIG_HZ_300 is not set/' \
                    -i -e 's/^# CONFIG_HZ_1000 is not set/CONFIG_HZ_1000=y/' \
                    -i -e 's/^CONFIG_HZ=300/CONFIG_HZ=1000/' ./.config
	fi
	
    ### Optionally disable NUMA for 64-bit kernels only
        # (x86 kernels do not support NUMA)
        if [ -n "$_NUMAdisable" ]; then
            echo "Disabling NUMA from kernel config..."
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

    ### Optionally load needed modules for the make localmodconfig
        # See https://aur.archlinux.org/packages/modprobed-db
        if [ -n "$_localmodcfg" ]; then
            if [ -f $HOME/.config/modprobed.db ]; then
            echo "Running Steven Rostedt's make localmodconfig now"
            make LSMOD=$HOME/.config/modprobed.db localmodconfig
        else
            echo "No modprobed.db data found"
            exit
            fi
        fi

    ### Running make nconfig
	
	[[ -z "$_makenconfig" ]] ||  make nconfig
	
    ### Running make menuconfig
	
	[[ -z "$_makemenuconfig" ]] || make menuconfig
	
    ### Running make xconfig
	
	[[ -z "$_makexconfig" ]] || make xconfig
	
    ### Running make gconfig
	
	[[ -z "$_makegconfig" ]] || make gconfig

    ### Save configuration for later reuse
	cat .config > "${startdir}/config.last"
}

build() {
  cd $_srcname

  make bzImage modules htmldocs
}

_package() {
    pkgdesc="The $pkgdesc kernel and modules"
    depends=('coreutils' 'kmod' 'initramfs')
    optdepends=('crda: to set the correct wireless channels of your country'
                'linux-firmware: firmware images needed for some devices'
                'modprobed-db: Keeps track of EVERY kernel module that has ever been probed - useful for those of us who make localmodconfig')

  cd $_srcname
  local kernver="$(<version)"
  local modulesdir="$pkgdir/usr/lib/modules/$kernver"

  echo "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

  echo "Installing modules..."
  make INSTALL_MOD_PATH="$pkgdir/usr" modules_install

  # remove build and source links
  rm "$modulesdir"/{source,build}

  echo "Fixing permissions..."
  chmod -Rc u=rwX,go=rX "$pkgdir"
}

_package-headers() {
    pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"
    depends=('linux-rt-bfq')

  cd $_srcname
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  echo "Installing build files..."
  install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map \
    localversion.* version vmlinux
  install -Dt "$builddir/kernel" -m644 kernel/Makefile
  install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile
  cp -t "$builddir" -a scripts

  # add objtool for external module building and enabled VALIDATION_STACK option
  install -Dt "$builddir/tools/objtool" tools/objtool/objtool

  # add xfs and shmem for aufs building
  mkdir -p "$builddir"/{fs/xfs,mm}

  echo "Installing headers..."
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

  echo "Installing KConfig files..."
  find . -name 'Kconfig*' -exec install -Dm644 {} "$builddir/{}" \;

  echo "Removing unneeded architectures..."
  local arch
  for arch in "$builddir"/arch/*/; do
    [[ $arch = */x86/ ]] && continue
    echo "Removing $(basename "$arch")"
    rm -r "$arch"
  done

  echo "Removing documentation..."
  rm -r "$builddir/Documentation"

  echo "Removing broken symlinks..."
  find -L "$builddir" -type l -printf 'Removing %P\n' -delete

  echo "Removing loose objects..."
  find "$builddir" -type f -name '*.o' -printf 'Removing %P\n' -delete

  echo "Stripping build tools..."
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

  echo "Adding symlink..."
  mkdir -p "$pkgdir/usr/src"
  ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase"

  echo "Fixing permissions..."
  chmod -Rc u=rwX,go=rX "$pkgdir"
}

_package-docs() {
    pkgdesc="Documentation for the $pkgdesc kernel"
    depends=('linux-rt-bfq')

  cd $_srcname
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  echo "Installing documentation..."
  local src dst
  while read -rd '' src; do
    dst="${src#Documentation/}"
    dst="$builddir/Documentation/${dst#output/}"
    install -Dm644 "$src" "$dst"
  done < <(find Documentation -name '.*' -prune -o ! -type d -print0)

  echo "Adding symlink..."
  mkdir -p "$pkgdir/usr/share/doc"
  ln -sr "$builddir/Documentation" "$pkgdir/usr/share/doc/$pkgbase"

  echo "Fixing permissions..."
  chmod -Rc u=rwX,go=rX "$pkgdir"
}

pkgname=("$pkgbase" "$pkgbase-headers" "$pkgbase-docs")
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done

sha512sums=('6328ad7e18b6fa982415b0de75e3384f58ce8428bd8c212871a31f3885a0819d241138d384b2e6d1b74a1d260229a027f9c1674a65f5b6c48e6b25e3024a0974'
            'SKIP'
            '29906c16cfa4a10dd8cad9da6f3c8e328e9ef5c04abcc23d694444ac9414c9517692866342bf2bfd9e9d646741ee0deb4e723eb7ea793a2892beb78d2184a499'
            'SKIP'
            '10c9bbb02c6a0afe869efae97fe6133062110f46c973fd7b60cdd8a88f14de7646d206d5c2bbbf1170ca0aa9cf7c2d0daab477d12c074dc18e9b98075cd2b57c'
            '2eb574fbfac6e334d3b06e52e466dbf8e88034515729b6571990b10f75a0fe2a52f188615405c5a695b5820669e595deead44d7961a97c5872359be3435fdf63'
            '7c7fa5ff0f8856a203cc1e5ea3e1124f4a812007f39dcf50416a838519dfd33f2676fdc155545ca15bc1a9070025c8c7c4e6b29670cbb6a011c03086a0c95604'
            '779232ec56db6d6cd87e13398a5d2bbba39e1f45a6766d5e37a143aed278d4630be8309e72a2927d895a002288fea527d42c1e96dd16c437fca03eced97ae90a'
            '808c669968006da1aeff5aac9b9d27ae32766da994cf4658899689a7d0e492533c05ae4ea283f55ed791e49078cb0403a6b17694225363fbbd1a554b2e7695b1'
            'e3b123e203d38b0fcba4c662471573b668f27a29ae36afe521e7ed819b745b8f96c1375623d8a9406008ba634e15e6e745854b16df966bcae4509fcb3cd2aa78'
            'f2c6a4c208bbf0869e369a8e5a59713d02864fb639fc205c8f23c4a36ddec8e6366b46e1027323897752fb3005422e8954a8265ff963a3665f6138b2a595e7db'
            '77854636b7958c2d6824a4e7907e93dccaefe93c7c42f0a97b665a624070625ec6eb4a65bfc39f9118b14778072518b9ee56a062169eb7fad4ca140312803df5'
            '18b22268a7596f90961d99a75b2d444190e4a7e4e20382450c8753b9db9998e6325139aba156c339c2f6f4728d5617a38d428c13b869c6d7cf39a9e09cec911e'
            '861d9a32dd86f11fb9b75fa4524ff7f8de30884626057e75581c9608f5dcae006e29a5c8fc8697b83cec30cb1bdb5c5d45702159eb16f2f882d5b7bdce2e9a5f'
            'f2e3905c03f176d000a79b83493957372a4539bf47fe9e2c28b283e54a87900eb2a81c03709c158d00e6012fc446153d37b61ff56f56703ffa645bf518b8c140'
            'a4c3d543812b074bfb29a341d842542d692a06c74e1aac74705d5edbeac5be559ff9deb4179dbe391e2d5e25685d6fd21612f98ab653e53943cd320bb38c82f4'
            '798e27d5820bd9ab84f88f99e5626be6e2617889ec9004c6b47d7580deaae8f17a741b906ed91c020f4402f98a6c747cbe8353f9f436b80640cf9c4ba363f226'
            '67f9c4d3b4161ef5951b7e927824931bdc19a98b469dada8539ffd24e96f5ce754e6ebbd98338d12d197d859f7fdbcd529981e784a82d4e421eb3ec67ce258dd'
            '93b84cef2d25ea896c9a1ff531231b8e2e94a6f16c13e72c28c913dc1ae5ccdcc89af49e2c61aa21b5982d390e199f6eb2da460361c26ec1031e6df4e3217a0e'
            'e8c8b2600c3b4e0859eee541bfcfccf4a93129085951a1409177954d06d1d5eb906e412cac023408ce0c11d6d7bb3b0c0f98ce83ed9e02747feecdf7a9fbe647'
            '997a9712a9e6ed7f4c34cd01f771fc4de552ff9d2edd10c63c1a2438adfbbf52f6b3ec9a95f3687534004717da638d77a5f03c148828665e34a4a6a63370451f'
            '2a11ec15a2ba3d83ba6ecae5d83fe1edd761e20a512aba59c32e8546b27b35a78c73c2e740cc5d03b5fcbb00bdb39d7b63e0b61a810093f8d27d46ddd28401fe'
            '1fe7e0ef2d78a683a737a7d8e1bf19356b1c49eeff18891c2cf3aa02f94383f3477324b2435111f8bb042601a03e60fe0fbe78f28906191c42304592bad109b3'
            '0c0988d868c6c037d6b95adf5db3b60413530b10cd25df899f5794f6d66bbadba60a13477e53802564c634c0bc2109afd3dc01114473c28dbd3f54e216aa62e3')

validpgpkeys=(
              'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linus Torvalds
              '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman
              '64254695FFF0AA4466CC19E67B96E8162A8CF5D1' # Sebastian Andrzej Siewior
              '5ED9A48FC54C0A22D1D0804CEBC26CDB5A56DE73' # Steven Rostedt
              'E644E2F1D45FA0B2EAA02F33109F098506FF0B14' # Thomas Gleixner
              )
