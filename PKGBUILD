# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor:  Timofey Titovets <nefelim4ag@gmail.com>

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
_disable_debug=y

### Do not edit below this line unless you know what you're doing

pkgbase=linux-next-git
pkgver=20230225.r0.g8232539f864c
_srcname=linux-next
pkgrel=1
pkgdesc='Linux NEXT'
arch=('x86_64')
url="http://www.kernel.org/"
license=('GPL2')
options=('!strip')
makedepends=('bc' 'libelf' 'git' 'pahole' 'cpio' 'perl' 'tar' 'xz')
_lucjanver=6.2
#_lucjanpath="https://raw.githubusercontent.com/sirlucjan/kernel-patches/master/${_lucjanver}"
_lucjanpath="https://gitlab.com/sirlucjan/kernel-patches/raw/master/${_lucjanver}"

source=("git+https://git.kernel.org/pub/scm/linux/kernel/git/next/${_srcname}.git"
        "${_lucjanpath}/arch-patches-v2-sep/0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-C.patch"
         # the main kernel config files
        'config')

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

pkgver() {
  cd $_srcname
  git describe --long --tags |  sed 's/next.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd $_srcname

    ### Setting version
        echo "Setting version..."
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
        diff -u ../config .config || :

    ### Prepared version
        make include/config/kernel.release
        make -s kernelrelease > version
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

  make all
}

_package() {
    pkgdesc="The $pkgdesc kernel and modules"
    depends=('coreutils' 'kmod' 'initramfs')
    optdepends=('wireless-regdb: to set the correct wireless channels of your country'
                'linux-firmware: firmware images needed for some devices'
                'modprobed-db: Keeps track of EVERY kernel module that has ever been probed - useful for those of us who make localmodconfig')
    provides=(VIRTUALBOX-GUEST-MODULES WIREGUARD-MODULE KSMBD-MODULE)

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
  make INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 \
    DEPMOD=/doesnt/exist modules_install  # Suppress depmod

  # remove build and source links
  rm "$modulesdir"/{source,build}
}

_package-headers() {
   pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"
   depends=('linux-next-git' 'pahole')

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

pkgname=("$pkgbase" "$pkgbase-headers")
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done

sha512sums=('SKIP'
            '28dc56be7060b2398c33d936ec44527fa9efb042b314c96c1568a6d10ca051a1880672deeb57112aa4f5cf72064d67c1494cd1fb52c4e9dfa33a761d6b3692d1'
            '19aa93ee9f97461c45749c26387b89231870aa1949caee7218022fb11ffc096e5f49f7700fcd105bd713a037e7e75df8bc3868d8597444c9636004cec76d1e36')
