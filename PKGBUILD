# Maintainer: Peter Jung ptr1337 <admin@ptr1337.dev> && Piotr Gorski <piotrgorski@cachyos.org>
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
_NUMAdisable=

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

# Disable debug to lower the size of the kernel
_disable_debug=

### Do not edit below this line unless you know what you're doing

pkgbase=linux-sched-ext-git
pkgver=3.1.r921111.g7130c7d74aa3
_srcname=sched_ext
pkgrel=1
pkgdesc='Linux Kernel based on the sched_ext branch'
arch=('x86_64')
url="http://www.kernel.org/"
license=('GPL2')
options=('!strip')
makedepends=('bc' 'libelf' 'git' 'pahole' 'cpio' 'perl' 'tar' 'xz' 'python')
_lucjanver=6.3
#_lucjanpath="https://raw.githubusercontent.com/sirlucjan/kernel-patches/master/${_lucjanver}"
_lucjanpath="https://gitlab.com/sirlucjan/kernel-patches/raw/master/${_lucjanver}"

source=("git+https://github.com/sched-ext/sched_ext.git#branch=sched_ext"
        "${_lucjanpath}/arch-patches/0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-C.patch"
         # the main kernel config files
        'config'
        # sched_ext Schedulers precompiled
        "https://mirror.cachyos.org/bpf-sched/scx_atropos"
        "https://mirror.cachyos.org/bpf-sched/scx-example/scx_example_central"
        "https://mirror.cachyos.org/bpf-sched/scx-example/scx_example_flatcg"
        "https://mirror.cachyos.org/bpf-sched/scx-example/scx_example_pair"
        "https://mirror.cachyos.org/bpf-sched/scx-example/scx_example_qmap"
        "https://mirror.cachyos.org/bpf-sched/scx-example/scx_example_simple"
        "https://mirror.cachyos.org/bpf-sched/scx-example/scx_example_userland"
        )

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

pkgver() {
  cd $_srcname
  git describe --long | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g;s/\.rc/rc/'
}

_make() {
  test -s version
  make KERNELRELEASE="$(<version)" "$@"
}

prepare() {
    cd $_srcname

    ### Setting version
        echo "Setting version..."
        echo "-$pkgrel" > localversion.10-pkgrel
        echo "${pkgbase#linux}" > localversion.20-pkgname
        make defconfig
        make -s kernelrelease > version
        make mrproper

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
        _make olddefconfig
        diff -u ../config .config || :

    ### Prepared version
        echo "Prepared $pkgbase version $(<version)"

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
            scripts/config -d HZ_300 \
                           -e HZ_1000 \
                           --set-val HZ 1000
	fi

    ### Disable NUMA
        if [ -n "$_NUMAdisable" ]; then
            echo "Disabling NUMA from kernel config..."
            scripts/config -d NUMA \
                           -d AMD_NUMA \
                           -d X86_64_ACPI_NUMA \
                           -d NODES_SPAN_OTHER_NODES \
                           -d NUMA_EMU \
                           -d USE_PERCPU_NUMA_NODE_ID \
                           -d ACPI_NUMA \
                           -d ARCH_SUPPORTS_NUMA_BALANCING \
                           -d NODES_SHIFT \
                           -u NODES_SHIFT \
                           -d NEED_MULTIPLE_NODES \
                           -d NUMA_BALANCING \
                           -d NUMA_BALANCING_DEFAULT_ENABLED
        fi

    ### Disable DEBUG
        if [ -n "$_disable_debug" ]; then
            echo "Disabling DEBUG kernel config..."
            scripts/config -d DEBUG_INFO \
                           -d DEBUG_INFO_BTF \
                           -d DEBUG_INFO_DWARF4 \
                           -d DEBUG_INFO_DWARF5 \
                           -d PAHOLE_HAS_SPLIT_BTF \
                           -d DEBUG_INFO_BTF_MODULES \
                           -d SLUB_DEBUG \
                           -d PM_DEBUG \
                           -d PM_ADVANCED_DEBUG \
                           -d PM_SLEEP_DEBUG \
                           -d ACPI_DEBUG \
                           -d SCHED_DEBUG \
                           -d LATENCYTOP \
                           -d DEBUG_PREEMP
        fi

    ### Optionally load needed modules for the make localmodconfig
        # See https://aur.archlinux.org/packages/modprobed-db
        if [ -n "$_localmodcfg" ]; then
            if [ -f $HOME/.config/modprobed.db ]; then
            echo "Running Steven Rostedt's make localmodconfig now"
            _make LSMOD=$HOME/.config/modprobed.db localmodconfig
        else
            echo "No modprobed.db data found"
            exit
            fi
        fi

    ### Running make nconfig
	[[ -z "$_makenconfig" ]] || _make nconfig

    ### Running make menuconfig
	[[ -z "$_makemenuconfig" ]] || _make menuconfig

    ### Running make xconfig
	[[ -z "$_makexconfig" ]] || _make xconfig

    ### Running make gconfig
	[[ -z "$_makegconfig" ]] || _make gconfig

    ### Save configuration for later reuse
	cat .config > "${startdir}/config.last"
}

build() {
  cd $_srcname

  _make all
}

_package() {
    pkgdesc="The $pkgdesc kernel and modules"
    depends=('coreutils' 'kmod' 'initramfs')
    optdepends=('wireless-regdb: to set the correct wireless channels of your country'
                'linux-firmware: firmware images needed for some devices'
                'modprobed-db: Keeps track of EVERY kernel module that has ever been probed - useful for those of us who make localmodconfig')
    provides=(VIRTUALBOX-GUEST-MODULES WIREGUARD-MODULE KSMBD-MODULE)

  cd $_srcname
  local modulesdir="$pkgdir/usr/lib/modules/$(<version)"

  echo "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "$(_make -s image_name)" "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

  echo "Installing modules..."
  _make INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 \
    DEPMOD=/doesnt/exist modules_install  # Suppress depmod

  # remove build and source links
  rm "$modulesdir"/{source,build}
}

_package-headers() {
   pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"
   depends=('linux-sched-ext-git' 'pahole')

  cd $_srcname
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  echo "Installing build files..."
  install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map \
    localversion.* version vmlinux
  install -Dt "$builddir/kernel" -m644 kernel/Makefile
  install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile
  cp -t "$builddir" -a scripts

  # required when STACK_VALIDATION is enabled
  install -Dt "$builddir/tools/objtool" tools/objtool/objtool

  # required when DEBUG_INFO_BTF_MODULES is enabled
  if [ -f tools/bpf/resolve_btfids/resolve_btfids ]; then
      install -Dt "$builddir/tools/bpf/resolve_btfids" tools/bpf/resolve_btfids/resolve_btfids
  fi

  echo "Installing headers..."
  cp -t "$builddir" -a include
  cp -t "$builddir/arch/x86" -a arch/x86/include
  install -Dt "$builddir/arch/x86/kernel" -m644 arch/x86/kernel/asm-offsets.s

  install -Dt "$builddir/drivers/md" -m644 drivers/md/*.h
  install -Dt "$builddir/net/mac80211" -m644 net/mac80211/*.h

  # https://bugs.archlinux.org/task/13146
  install -Dt "$builddir/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h

  # https://bugs.archlinux.org/task/20402
  install -Dt "$builddir/drivers/media/usb/dvb-usb" -m644 drivers/media/usb/dvb-usb/*.h
  install -Dt "$builddir/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/*.h
  install -Dt "$builddir/drivers/media/tuners" -m644 drivers/media/tuners/*.h

  # https://bugs.archlinux.org/task/71392
  install -Dt "$builddir/drivers/iio/common/hid-sensors" -m644 drivers/iio/common/hid-sensors/*.h

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
    case "$(file -Sib "$file")" in
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

  echo "Stripping vmlinux..."
  strip -v $STRIP_STATIC "$builddir/vmlinux"

  echo "Adding symlink..."
  mkdir -p "$pkgdir/usr/src"
  ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase"
}

_package-scheduler() {
   pkgdesc="Precompiled Schedulers for $pkgdesc kernel"
   
   cd $srcdir

   # ATTENTION!
   # Since currently llvm 16 is required for building these schedukers
   # They come precompiled
   # As soon arch did push llvm 16 to the repo's the schedulers can be build correctly
   # So right now just install them
   
   install -Dm755 scx_example_central "$pkgdir"/usr/bin/scx_example_central
   install -Dm755 scx_example_flatcg "$pkgdir"/usr/bin/scx_example_flatcg
   install -Dm755 scx_example_pair "$pkgdir"/usr/bin/scx_example_pair
   install -Dm755 scx_example_qmap "$pkgdir"/usr/bin/scx_example_qmap
   install -Dm755 scx_example_simple "$pkgdir"/usr/bin/scx_example_simple
   install -Dm755 scx_example_userland "$pkgdir"/usr/bin/scx_example_userland
   install -Dm755 scx_atropos "$pkgdir"/usr/bin/scx_atropos
   

}

pkgname=("$pkgbase" "$pkgbase-headers" "$pkgbase-scheduler")
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done

b2sums=('SKIP'
        '07b4e2f4ce58c29fa811799b4caabbf4a73cb95db2637a3c4f980cbf169aad76963d5add3cc9956d0a9abd6b66bf0b27f5dd1a9cec6211596d711017636f9a4e'
        '3ebf9af689982e628b9bbef3d998183b02350f96ea70dcf6077f3e4dd6eb4b972c2a8f6fae59de9bcd156cf529f1ddbeb8942826d6cbd2f3dac15dc2f2bde80f'
        'd13ab55728b87f18e16f23831aed6d5677f14a77733f030a2477514bfb46fd6eb8f108e060e349c9232349ff225284b8c6e3516c6a9d9afe64514b49f52d4352'
        'a6d9c881ab2ce1fa9c5ce1fb0cd1fadd76e3bcbe1b09572aca561b49ccb373ca94e2127cfdb6dc64b517d531108390f3dcb8684a2be4f17899db8c92232a48ef'
        '98c81b50f301c5c409de53ff5466189ddc3aa33cc924685ddec92cf7137d7f8bfd0fd8d7658f4ae5504bea162b330f3b973c408acf873f5958ef73da745a9c79'
        '9ce29ea136cdbaf7bbaed771a9218ac8bd80da199ff10f92e15cd66894d82ae4f4408b4b71f6315559a5e3a9ffc3131279ab084fe697579fb7871909a58c6551'
        'a530b5ce84c91eb57a64b7f6f07b8f20eabd823cf67154da5c9d4d18a14ad8a661a68f241babf3ce7515c25f5ecfabaf06a922e58bd5fa5ec405ff956c4aecf2'
        '87afb2f3b2d220444be1879d46d6de562f549c35344153ced9a8af282e8693ff4c5db6493fec174bf35f762b024de4f7a1f33fb78e407b60a1b48c56242d7702'
        '4f0c708c49eb54709a646962c93d35426d5beb0ff53460ebe3601d9832cbd71664cfad9c5e18d8097d616674c6dd2067926dae90866f83319e354c4376e96463')
