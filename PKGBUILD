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
_minor=13
_rtver=7
_rtpatchver=rt${_rtver}
pkgver=${_major}.${_minor}.${_rtpatchver}
_pkgver=${_major}.${_minor}
_srcname=linux-${_pkgver}
pkgrel=2
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
_bfq_rel="r2K200130"
_bfq_patch="${_major}-${_bfq_path}-${_bfq_ver}-${_bfq_rel}.patch"
_gcc_path="https://raw.githubusercontent.com/graysky2/kernel_gcc_patch/master"
_gcc_patch="enable_additional_cpu_optimizations_for_gcc_v9.1+_kernel_v4.13+.patch"

source=("https://www.kernel.org/pub/linux/kernel/v5.x/${_srcname}.tar.xz"
        "https://www.kernel.org/pub/linux/kernel/v5.x/${_srcname}.tar.sign"
        "http://www.kernel.org/pub/linux/kernel/projects/rt/${_major}/patch-${_pkgver}-${_rtpatchver}.patch.xz"
        "http://www.kernel.org/pub/linux/kernel/projects/rt/${_major}/patch-${_pkgver}-${_rtpatchver}.patch.sign"
        "${_lucjanpath}/${_bfq_path}/${_bfq_patch}"
        "${_gcc_path}/${_gcc_patch}"
        "${_lucjanpath}/arch-patches-v21-sep/0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-C.patch"
        "${_lucjanpath}/arch-patches-v21-sep/0002-lib-devres-add-a-helper-function-for-ioremap_uc.patch"
        "${_lucjanpath}/arch-patches-v21-sep/0003-mfd-intel-lpss-Use-devm_ioremap_uc-for-MMIO.patch"
        "${_lucjanpath}/arch-patches-v21-sep/0004-PCI-pciehp-Prevent-deadlock-on-disconnect.patch"
        "${_lucjanpath}/arch-patches-v21-sep/0005-ACPI-PM-s2idle-Rework-ACPI-events-synchronization.patch"
        "${_lucjanpath}/arch-patches-v21-sep/0006-iwlwifi-pcie-restore-support-for-Killer-Qu-C0-NICs.patch"
        "${_lucjanpath}/arch-patches-v21-sep/0007-drm-i915-save-AUD_FREQ_CNTRL-state-at-audio-domain-s.patch"
        "${_lucjanpath}/arch-patches-v21-sep/0008-drm-i915-Fix-audio-power-up-sequence-for-gen10-displ.patch"
        "${_lucjanpath}/arch-patches-v21-sep/0009-drm-i915-extend-audio-CDCLK-2-BCLK-constraint-to-mor.patch"
        "${_lucjanpath}/arch-patches-v21-sep/0010-drm-i915-Limit-audio-CDCLK-2-BCLK-constraint-back-to.patch"
        "${_lucjanpath}/arch-patches-v21-sep/0011-pinctrl-sunrisepoint-Add-missing-Interrupt-Status-re.patch"
        "${_lucjanpath}/arch-patches-v21-sep/0012-Revert-iwlwifi-mvm-fix-scan-config-command-size.patch"
        "${_lucjanpath}/arch-patches-v21-sep/0013-e1000e-Revert-e1000e-Make-watchdog-use-delayed-work.patch"
        "${_lucjanpath}/arch-patches-v21-sep/0014-drm-amdgpu-Add-DC-feature-mask-to-disable-fractional.patch"
        "${_lucjanpath}/arch-patches-v21-sep/0015-ptp-free-ptp-device-pin-descriptors-properly.patch"
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

sha512sums=('e7aaa541ccf66ca8373fe53794786c8b819da824b17acc497d5080f4fff5bef90bab1da531fa8f62a013f40472f5c1dfafb4bd4f42ecc1bf851042d22e72c4a7'
            'SKIP'
            'c8f339d0ec0be917cf12699d3700998acf7fbb2c420d8fcb758e20fd35b0766ce267af74e259b7dcdb624b3a878dca70fee39d98eb35813bdfc62a7b2a781fa5'
            'SKIP'
            'd3fd1b94ada70725d912be311eceb8529740e2a32aebd0f199e1249c75d104c2f1f67acc6363cdea787a7795879d049e38fc8fd08b6009bdbd7af6dd6606d866'
            '2eb574fbfac6e334d3b06e52e466dbf8e88034515729b6571990b10f75a0fe2a52f188615405c5a695b5820669e595deead44d7961a97c5872359be3435fdf63'
            'a1303a9bb5a0ca81df8d6f991cf8c8d6854ac045b839e1d2d71ff4acff92a59eb102b6647d500c5cb3cee1639176018f6b6ed68cbe8502d71e0d24478a4ba22c'
            'f8ee99e10a7ba396101a952a895bb665375b3da705ee3da05678023b2a57b9ac9690ffc4b2af16e8fa3af94d291cb8958f0477a1531ec23e5455d752a199c46a'
            '60a975640e53692b017b88a581c7f645266fef9806c96197c45271e53400d44c1eb52a3a5aef952129e91f6ae79eee82ffbfa5683638d5296f15d5ef7c789d4f'
            'fecc638528d30a40c8791d2cd850a127a880ddca0286d5c3bed68352e4c0d00afa50821795ede380cc8958e9ebcc51cebf2fcf5897c8b374174f8d901d5aa774'
            'afe4e63760936835f07182eb6a115e4aa3319e8972ea135101f00cb6c591db12648ffd44d636948db3d9600b1cfd566b1a7f8c4b4a7b330593f7b8cfce7a0942'
            '2fcfffcd43c2942d26b49ec5fe541169369dca231ceebff57b05d78e178507c70c58e35627cf8d93fd6423bc4baee50f7014ea10948a8bff13dc01323a6ef9fd'
            'c604009bec6c130d0c74bb3d8be83ebe2f96fcd07f50b9bfc9d4a12681c89a9f175d91245fbe4eb2c2e85c12e258db611dfe06552ea09ac898cfa320d288302f'
            'ecc40e933327b83f67587872f282baeb2497d29152b596fc7530ebc718d7d66a880d5063a87cafa066330df46ab5de41c4ecb3587451fe6b2d83e059a7bbaa7a'
            '1250d75e41e97ff6fae07f523d85691cb1b05e1a63b969dfc17fb3d83c9abef9d52ee8dce0940a32b3ef2f967f0124f8081728dd4ff7a1993be95db85bb824e3'
            'b4232315acfbdcc8f2adda0b51b353c81c53639aa2d97020818377a458b281a1b2c22c672a14abf8f6b3328fc15843bb720a25d5a004be846f263a5689ccc85c'
            '04e5175c451250027c834367459f1d97dc3b092e9880a2b8d1b1e218163156b6373e7e639fe62b79283fdfec82c19c14224b069e5d9e0669a01c2b7fbb12a8a5'
            'cf17844acfd86bab0dce098e9b1d0a45149f7618fe35d58ae23a606aad052e4e846ebc09a4d1a521e4a32313a2e114d33620a2fba32cc118df5278d358e0e30e'
            'd11ea21f8950113fae6f90b88c7892f289c19f2325b1d742c2ce417b8426af5ddb916931f0b25749de0fe5287d9c96061307c487f5c6dfa19a9f160c5bbc2c80'
            '4a6487d5595aefb74569872d0ba4610df6aa6148426e29cfc1497694f35fd5ba7c1c46575919c2af83db88776a6728fee6e8cc91620b65752495fffba7aa0aff'
            'cfd6f76d12cad3aa9b12e73cfbe937e953cb73b59909906343b5ab5b441cffaf4bac9ba951040c12d0ab52e862be430b8deda6462afa6b53f8224c8a5a002008'
            '0c0988d868c6c037d6b95adf5db3b60413530b10cd25df899f5794f6d66bbadba60a13477e53802564c634c0bc2109afd3dc01114473c28dbd3f54e216aa62e3')

validpgpkeys=(
              'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linus Torvalds
              '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman
              '64254695FFF0AA4466CC19E67B96E8162A8CF5D1' # Sebastian Andrzej Siewior
              '5ED9A48FC54C0A22D1D0804CEBC26CDB5A56DE73' # Steven Rostedt
              'E644E2F1D45FA0B2EAA02F33109F098506FF0B14' # Thomas Gleixner
              )
