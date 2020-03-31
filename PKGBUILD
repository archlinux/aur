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

pkgbase=linux-aufs
# pkgname=('linux-aufs' 'linux-aufs-headers' 'linux-aufs-docs')
_major=5.5
_minor=13
pkgver=${_major}.${_minor}
_srcname=linux-${pkgver}
pkgrel=3
pkgdesc='Linux AUFS'
arch=('x86_64')
url="https://github.com/sfjro/aufs5-standalone"
license=('GPL2')
options=('!strip')
makedepends=('kmod' 'bc' 'libelf' 'python-sphinx' 'python-sphinx_rtd_theme'
             'graphviz' 'imagemagick')
#_lucjanpath="https://raw.githubusercontent.com/sirlucjan/kernel-patches/master/${_major}"
_lucjanpath="https://gitlab.com/sirlucjan/kernel-patches/raw/master/${_major}"
_aufs_path="aufs-patches"
_aufs_ver="20200302"
_aufs_patch="0001-aufs-${_aufs_ver}.patch"
_gcc_path="https://raw.githubusercontent.com/graysky2/kernel_gcc_patch/master"
_gcc_patch="enable_additional_cpu_optimizations_for_gcc_v9.1+_kernel_v5.5+.patch"

source=("https://www.kernel.org/pub/linux/kernel/v5.x/${_srcname}.tar.xz"
        "https://www.kernel.org/pub/linux/kernel/v5.x/${_srcname}.tar.sign"
        "${_lucjanpath}/${_aufs_path}/${_aufs_patch}"
        "${_gcc_path}/${_gcc_patch}"
        "${_lucjanpath}/arch-patches-v15-sep/0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-C.patch"
        "${_lucjanpath}/arch-patches-v15-sep/0002-iwlwifi-pcie-restore-support-for-Killer-Qu-C0-NICs.patch"
        "${_lucjanpath}/arch-patches-v15-sep/0003-drm-Remove-PageReserved-manipulation-from-drm_pci_al.patch"
        "${_lucjanpath}/arch-patches-v15-sep/0004-drm-i915-Serialise-i915_active_acquire-with-__active.patch"
        "${_lucjanpath}/arch-patches-v15-sep/0005-drm-i915-gem-Take-runtime-pm-wakeref-prior-to-unbind.patch"
        "${_lucjanpath}/arch-patches-v15-sep/0006-drm-i915-gem-Avoid-parking-the-vma-as-we-unbind.patch"
        "${_lucjanpath}/arch-patches-v15-sep/0007-drm-i915-gem-Try-to-flush-pending-unbind-events.patch"
        "${_lucjanpath}/arch-patches-v15-sep/0008-drm-i915-gem-Reinitialise-the-local-list-before-repe.patch"
        "${_lucjanpath}/arch-patches-v15-sep/0009-drm-i915-Add-a-simple-is-bound-check-before-unbindin.patch"
        "${_lucjanpath}/arch-patches-v15-sep/0010-drm-i915-Introduce-a-vma.kref.patch"
        "${_lucjanpath}/arch-patches-v15-sep/0011-iwlwifi-don-t-send-GEO_TX_POWER_LIMIT-if-no-wgds-tab.patch"
        "${_lucjanpath}/arch-patches-v15-sep/0012-Revert-bpf-Provide-better-register-bounds-after-jmp3.patch"
         # the main kernel config files
        'config')

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
    cd $_srcname

    ### Setting version
        echo "Setting version..."
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
        echo "Applying patch $src..."
        patch -Np1 < "../$src"
        done

    ### Setting config
        echo "Setting config..."
        cp ../config .config
        make olddefconfig

    ### Prepared version
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

  make all
  make htmldocs
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
   depends=('linux-aufs')

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
    depends=('linux-aufs')

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

sha512sums=('33b7f709275143c3ba10c3537d84dcc8ef822bc16de3d78411dc4c36650746fdbfb6c438b63a201ad4ffecc69028785ccdbb03257428eeed0b96aa45cdda64f0'
            'SKIP'
            'ec0fe381f313611708cba2ab79a44262776d3536df9e1bf30636c18c1e530e6604c93fad48dadc38ae44766f02bdffefb4c181ef1412d6948533c2f4f84ae7c4'
            '52b14ef834769d2b4567e756a4485995acd2e3f5b989cbb53f9b113b42ff67b736bbcb284b95fe15c9efb846fd12320a26a131e4ce9af50b521114d274b472f1'
            '60196ff1954f23a4b189e12254448ce9a23bd986ff188938f10c3911ec31caa917648953b8c4f845c6b4c765d22739903994967191a172438e947065bd9016ac'
            '526c130a052ce214c9fb4ec9cdcda4f8b3f79d5db022a5180cde611183e1aa502e369d0b1b6af5da9fb75b6bb8a82156401b9b5d1d56ad0606a82062dd11ad2f'
            'a5d35d15c8ff9853229a4d7f77a3054bd602ca74bf1a8d7b231b6c3638ff5ef84f8cdb681fcb1de2611de5f0fff5108b74808b245f7af393c32252dc993f861b'
            'c4cb8b60c5f72b1aee58209e11d4f9b2ba22fb0cb14c866eafe98cf2940e31fa2852a7211b0c3e3a70442e875b444c4063165978e759474ee879501efb13cef9'
            '1b3a6290d1fd13c5e2dc4ccffe86eca76d44c0d0dcdc33b81c384d21a8fc4f7af4efae26ed47f50de78ad8a991a220fac2a63e167790f99ef35ac8766721739b'
            'faadc896b6ee520f592ed374ffd0b63f1f391d08bc08c5ab93ad483291d5e7e9b9acc0a9b42feacb2b6060ce3a294513b9f5e91d2217890bfe7d69b9704dbe41'
            'b66ddbc687f46a9c7f4e9ae199a9715116bd17f6dfbdb9a13c586e64d69bc62dcd87669bd86405a5e1802d7de5eef43d1bf6e336a0f2e749fb8b80c3165f83c7'
            '5afe446c0d83239229575ca5f2c1fb78c2064a8c15bc1424c87cc52cf9a3ea77e27260bd8463a5c78721db58e836171974f217f0ef36bf6eec9a1594b1c25d39'
            '1e954bcc7d7e289df53c968b38d1828027f92748cf1048679f7e043d65a1ad7b192212dda8956817b7fe23d73d0871e60fa4ddd3b24e6e8b4445b0cea7f72bdc'
            '5432fabe9b5f48779ad7bec8a9ddd128bdb98db26975228a87601d726a8bf03a14935529b7b5ed8ca55c917ef65f253b646bc03e438bfcca04cc249e80d3bb45'
            '71ad724e1914c717ddfb9fbeb0a25a89ca2003801004f367e568ba992a8f53bae47427558b74fd9d7e159dcf50618287530536abc448a37811baede7f394fb1c'
            'ce964f5c12776b898c30ac0cfe5604a1495f5b1a8ba1ccd2db1bebad3b0c4c9bb1e546da7dd5af471ee37d41bec0572bccb671ba1eb4e73ba7e73c6a51488eb2'
            'b1916a07e63a626f5e1b1ed3ec2793835c16b2367e215186a80615191d9a94eb0f3fb8728d7b3b1e4e973bd419d282733f84add6fae7c1d5334e4d7da6f2fa85')

validpgpkeys=(
              'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linus Torvalds
              '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman
             )
