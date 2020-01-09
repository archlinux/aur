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

### Running with a 1000 HZ tick rate
_1k_HZ_ticks=

### Do not edit below this line unless you know what you're doing

pkgbase=linux-bfq
# pkgname=('linux-bfq' 'linux-bfq-headers' 'linux-bfq-docs')
_major=5.4
_minor=10
pkgver=${_major}.${_minor}
_srcname=linux-${pkgver}
pkgrel=2
pkgdesc='Linux BFQ-dev'
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
        "${_lucjanpath}/${_bfq_path}/${_bfq_patch}"
        "${_gcc_path}/${_gcc_patch}"
        "${_lucjanpath}/arch-patches-v15-sep/0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-C.patch"
        "${_lucjanpath}/arch-patches-v15-sep/0002-lib-devres-add-a-helper-function-for-ioremap_uc.patch"
        "${_lucjanpath}/arch-patches-v15-sep/0003-mfd-intel-lpss-Use-devm_ioremap_uc-for-MMIO.patch"
        "${_lucjanpath}/arch-patches-v15-sep/0004-PCI-pciehp-Do-not-disable-interrupt-twice-on-suspend.patch"
        "${_lucjanpath}/arch-patches-v15-sep/0005-PCI-pciehp-Prevent-deadlock-on-disconnect.patch"
        "${_lucjanpath}/arch-patches-v15-sep/0006-ACPI-PM-s2idle-Rework-ACPI-events-synchronization.patch"
        "${_lucjanpath}/arch-patches-v15-sep/0007-iwlwifi-pcie-restore-support-for-Killer-Qu-C0-NICs.patch"
        "${_lucjanpath}/arch-patches-v15-sep/0008-x86-intel-Disable-HPET-on-Intel-Ice-Lake-platforms.patch"
        "${_lucjanpath}/arch-patches-v15-sep/0009-drm-i915-save-AUD_FREQ_CNTRL-state-at-audio-domain-s.patch"
        "${_lucjanpath}/arch-patches-v15-sep/0010-drm-i915-Fix-audio-power-up-sequence-for-gen10-displ.patch"
        "${_lucjanpath}/arch-patches-v15-sep/0011-drm-i915-extend-audio-CDCLK-2-BCLK-constraint-to-mor.patch"
        "${_lucjanpath}/arch-patches-v15-sep/0012-drm-i915-gt-Detect-if-we-miss-WaIdleLiteRestore.patch"
        "${_lucjanpath}/arch-patches-v15-sep/0013-pinctrl-sunrisepoint-Add-missing-Interrupt-Status-re.patch"
        "${_lucjanpath}/arch-patches-v15-sep/0014-Revert-iwlwifi-mvm-fix-scan-config-command-size.patch"
        "${_lucjanpath}/arch-patches-v15-sep/0015-e1000e-Revert-e1000e-Make-watchdog-use-delayed-work.patch"
         # the main kernel config files
        'config')

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
    cd $_srcname

    ### Setting version
        msg2 "Setting version..."
        sed -e "/^EXTRAVERSION =/s/=.*/=/" -i Makefile
        scripts/setlocalversion --save-scmversion
        echo "-$pkgrel" > localversion.10-pkgrel
        echo "${pkgbase#linux}" > localversion.20-pkgname

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
        make -s kernelrelease > version
        msg2 "Prepared %s version %s" "$pkgbase" "$(<version)"

    ### Optionally use running kernel's config
	# code originally by nous; http://aur.archlinux.org/packages.php?ID=40191
	if [ -n "$_use_current" ]; then
		if [[ -s /proc/config.gz ]]; then
			msg2 "Extracting config from /proc/config.gz..."
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
		msg2 "Setting tick rate to 1k..."
		sed -i -e 's/^CONFIG_HZ_300=y/# CONFIG_HZ_300 is not set/' \
                    -i -e 's/^# CONFIG_HZ_1000 is not set/CONFIG_HZ_1000=y/' \
                    -i -e 's/^CONFIG_HZ=300/CONFIG_HZ=1000/' ./.config
	fi
	
    ### Optionally disable NUMA for 64-bit kernels only
        # (x86 kernels do not support NUMA)
        if [ -n "$_NUMAdisable" ]; then
            msg2 "Disabling NUMA from kernel config..."
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
            msg2 "Running Steven Rostedt's make localmodconfig now"
            make LSMOD=$HOME/.config/modprobed.db localmodconfig
        else
            msg2 "No modprobed.db data found"
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

  msg2 "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

  msg2 "Installing modules..."
  make INSTALL_MOD_PATH="$pkgdir/usr" modules_install

  # remove build and source links
  rm "$modulesdir"/{source,build}

  msg2 "Fixing permissions..."
  chmod -Rc u=rwX,go=rX "$pkgdir"
}

_package-headers() {
   pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"
   depends=('linux-bfq')

  cd $_srcname
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  msg2 "Installing build files..."
  install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map \
    localversion.* version vmlinux
  install -Dt "$builddir/kernel" -m644 kernel/Makefile
  install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile
  cp -t "$builddir" -a scripts

  # add objtool for external module building and enabled VALIDATION_STACK option
  install -Dt "$builddir/tools/objtool" tools/objtool/objtool

  # add xfs and shmem for aufs building
  mkdir -p "$builddir"/{fs/xfs,mm}

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
  ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase"

  msg2 "Fixing permissions..."
  chmod -Rc u=rwX,go=rX "$pkgdir"
}

_package-docs() {
    pkgdesc="Documentation for the $pkgdesc kernel"
    depends=('linux-bfq')

  cd $_srcname
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  msg2 "Installing documentation..."
  local src dst
  while read -rd '' src; do
    dst="${src#Documentation/}"
    dst="$builddir/Documentation/${dst#output/}"
    install -Dm644 "$src" "$dst"
  done < <(find Documentation -name '.*' -prune -o ! -type d -print0)

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

sha512sums=('6328ad7e18b6fa982415b0de75e3384f58ce8428bd8c212871a31f3885a0819d241138d384b2e6d1b74a1d260229a027f9c1674a65f5b6c48e6b25e3024a0974'
            'SKIP'
            '10c9bbb02c6a0afe869efae97fe6133062110f46c973fd7b60cdd8a88f14de7646d206d5c2bbbf1170ca0aa9cf7c2d0daab477d12c074dc18e9b98075cd2b57c'
            '2eb574fbfac6e334d3b06e52e466dbf8e88034515729b6571990b10f75a0fe2a52f188615405c5a695b5820669e595deead44d7961a97c5872359be3435fdf63'
            'ad6e87ab1a63e5bc056ff36de3e2d9b9756d9750043c38001908ecd1dbf0478e4cdc8f1bb36ab1f8e1818f7a43db96a3c47044f5aeb3289440f28fb96cb16b3f'
            '39c9da4fe7405e71e321573f378de29e75b2e15369c67792c2f1ade8ade8689b0a9500d9dce15ed6429e06ece5f5bcb946c6c82eddc20dafbf70f8f294685f87'
            '11965f6fa95b6e7c251235e2134e4b171e8b6e82b6d7d1293b705417768bf7ab6302a741c6728f7ea99f3882b440eb89c5bf23db9ea38ae0c062bb62c830a485'
            'e1289d34fc090b4a7646fa4f278ec57f849ea14d1f83bc9ff571b73090ceffcfde006d85dfc833e65c3f19b3c50535c11fdab462bcc45cba6dda44136b040d26'
            '3b0a8d14c54f12c267ede796b890df1173aef484cc49e3a01c9023cd3013b70a24fa6189201153ea17ea242e52199c1374942f67a87bed6f7b8f002f33985b39'
            'a343e23485d35666fb87f511c6b538588ad6ce71445aadaad1a0605d0eeee952f5d5f87b5be67a9436f66d6da86d5f2f6b9df30c610ca9fc4816e4f4071edb13'
            '1123e1e8d139379f6a457146fd1c11bdf2dd75a764bcb4892a46760afb341419e4259ad4debcafdeeaef2f570bf345bc31fd5779ed11c19a97bb4183215062c4'
            '4c03e6ae79401b56a03c7d44d595d3a28331b4ccc14f62359368b534f81a42e4f7e76341541224067e0eed95f0885a71eceee1485b9647f87dc484b7183c733f'
            '8d11b6dab826160d5692ba3e4eb6f3d0b46801c26d84521081c03b68321f7dd76119956a8ba0575f5a6e54a1595ddb0d10c31f9a1678a866102ee48231b40fef'
            'b1b7cecea1d3bbdd3d67468684071a4dfbaabf512906cb2e5508f0d94427e7ad3e5d7888cfd64ec37e70de569edf210003a57dcabf231676a50b6fe4900151fe'
            '48598e6244ffd0649741ffbec2ddbc686957880a1a65cc38317e0b6c46616f9d795fdf7f63bbc55549852359efe4af22bd02710cd905f88e390f6737a24b2af0'
            'b2e7fec77b008c2baefa84186f649a71afbb8a0baa69db7f97d420916a394d8b2cbf06a5bee305f1cb8c195f326967c3babb02d0a47539be8bbb0538c3b072b2'
            '55270fe7889eb5f697b75b770e6b3abcf3d4e38e22535570912c01730ba7ecd191b4c37755a00e5866d199290c84d426a48276cd0ec15d5862cb4eb83a8ccfa4'
            'ea5ae98f27e0370d13f7db9211a457c7598e1a102a3afa81f10519850f2487fe097f78109cb62bf91b5bc106463aa2fefcd12e941fba320dd3b8c4aacf282535'
            '8526aed248faec97050cb3b88f5da5e22f87ac6e4d2a836af9a47c09a8bade85483787712ccf42eefd0c9ea6c538ba2b450512b24954f0bae9ffbd3ab222c565'
            '3676012d94515b66561fcf5e642d483b75431618b4acf0dc7c591b7dca27648b1fd24fd218e86f1c29af878b0d69a830f39ce1ab983e344914086c8b1b0b64de')

validpgpkeys=(
              'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linus Torvalds
              '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman
             )
