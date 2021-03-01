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

pkgbase=linux-rt-bfq-dev
# pkgname=('linux-rt-bfq-dev' 'linux-rt-bfq-dev-headers' 'linux-rt-bfq-dev-docs')
_major=5.11
_minor=0
_rtver=7
_rtpatchver=rt${_rtver}
#pkgver=${_major}.${_minor}.${_rtpatchver}
#_pkgver=${_major}.${_minor}
pkgver=${_major}.${_rtpatchver}
_pkgver=${_major}
_srcname=linux-${_pkgver}
pkgrel=3
pkgdesc='Linux RT-BFQ-dev'
arch=('x86_64')
url="https://github.com/sirlucjan/bfq-mq-lucjan"
license=('GPL2')
options=('!strip')
makedepends=('kmod' 'bc' 'libelf' 'python-sphinx' 'python-sphinx_rtd_theme'
             'graphviz' 'imagemagick' 'pahole' 'cpio' 'perl' 'tar' 'xz')
#_lucjanpath="https://raw.githubusercontent.com/sirlucjan/kernel-patches/master/${_major}"
_lucjanpath="https://gitlab.com/sirlucjan/kernel-patches/raw/master/${_major}"
# Some patches for BFQ conflict with patches for BFQ-dev.
# To use linux-bfq-dev smoothly apply bfq-reverts before bfq-dev patch.
# Otherwise the kernel will not compile.
#_bfq_rev_path="bfq-reverts-all"
#_bfq_rev_patch="0001-bfq-reverts.patch"
#_bfq_path="bfq-dev-lucjan"
#_bfq_ver="v14"
#_bfq_rel="r2K210223"
#_bfq_patch="${_major}-${_bfq_path}-${_bfq_ver}-${_bfq_rel}.patch"
_bfq_path="bfq-lucjan"
_bfq_rel="r2K210228"
_bfq_patch="${_major}-${_bfq_path}-${_bfq_rel}.patch"
_gcc_path="cpu-patches-sep"
_gcc_patch="0001-cpu-${_major}-merge-graysky-s-patchset.patch"

source=("https://www.kernel.org/pub/linux/kernel/v5.x/${_srcname}.tar.xz"
        "https://www.kernel.org/pub/linux/kernel/v5.x/${_srcname}.tar.sign"
        "http://www.kernel.org/pub/linux/kernel/projects/rt/${_major}/patch-${_pkgver}-${_rtpatchver}.patch.xz"
        "http://www.kernel.org/pub/linux/kernel/projects/rt/${_major}/patch-${_pkgver}-${_rtpatchver}.patch.sign"
        #"${_lucjanpath}/${_bfq_rev_path}/${_bfq_rev_patch}"
        "${_lucjanpath}/${_bfq_path}/${_bfq_patch}"
        "${_lucjanpath}/${_gcc_path}/${_gcc_patch}"
        "${_lucjanpath}/arch-patches-v4-sep/0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-C.patch"
        "${_lucjanpath}/arch-patches-v4-sep/0002-Bluetooth-btusb-Some-Qualcomm-Bluetooth-adapters-sto.patch"
        "${_lucjanpath}/arch-patches-v4-sep/0003-Revert-drm-amd-display-reuse-current-context-instead.patch"
        "${_lucjanpath}/arch-patches-v4-sep/0004-drm-amdgpu-fix-shutdown-with-s0ix.patch"
        "${_lucjanpath}/docs-patches/0001-Documentation-Fix-sphinx-3.5-causes-compilation-erro.patch"
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
                scripts/config --disable CONFIG_HZ_300
                scripts/config --enable CONFIG_HZ_1000
                scripts/config --set-val CONFIG_HZ 1000
	fi

    ### Optionally disable NUMA for 64-bit kernels only
        # (x86 kernels do not support NUMA)
        if [ -n "$_NUMAdisable" ]; then
            echo "Disabling NUMA from kernel config..."
            scripts/config --disable CONFIG_NUMA
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
    provides=(VIRTUALBOX-GUEST-MODULES WIREGUARD-MODULE linux-rt-bfq)
    replaces=('linux-rt-bfq')
    conflicts=('linux-rt-bfq')

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
  make INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 modules_install

  # remove build and source links
  rm "$modulesdir"/{source,build}
}

_package-headers() {
    pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"
    depends=('linux-rt-bfq-dev' 'pahole')
    replaces=('linux-rt-bfq-headers')
    conflicts=('linux-rt-bfq-headers')
    provides=('linux-rt-bfq-headers')

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

  echo "Stripping vmlinux..."
  strip -v $STRIP_STATIC "$builddir/vmlinux"

  echo "Adding symlink..."
  mkdir -p "$pkgdir/usr/src"
  ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase"
}

_package-docs() {
    pkgdesc="Documentation for the $pkgdesc kernel"
    depends=('linux-rt-bfq-dev')
    replaces=('linux-rt-bfq-docs')
    conflicts=('linux-rt-bfq-docs')
    provides=('linux-rt-bfq-docs')

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
}

pkgname=("$pkgbase" "$pkgbase-headers" "$pkgbase-docs")
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done

sha512sums=('a567ec133018bb5ec00c60281479b466c26e02137a93a9c690e83997947df02b6fd94e76e8df748f6d70ceb58a19bacc3b1467de10b7a1fad2763db32b3f1330'
            'SKIP'
            '4ee686690148c1917eace10876cbea4da7751f6c649e20628f43480d78b018f6794227d80218f142440ff6519e2a51a1a6ead5c5641a3021373d1f017945cedb'
            'SKIP'
            '44e69b33f7a4ed0fc00769bfd76b0de63715bef970bfee4fd367f6effec127a8efa30248effe362b55682a801a7b66f462376946b1e4ad119c178e95a2262893'
            '7783c2b24253a24d650c9955ef818e8c5de097a5413120e42c23fe56303d83ea045eb489cb1fde36a82e7caec344ebafe83756fa43d087937ad4f23d10e01659'
            '82a868ae1866979aa0282f5bc4dc8c46f407cfb277d4b1cac6cac0d54ef7d7e0b928f79cc8a1bc49421619419293e681f27410040b527c07dca0d6df56c9e98b'
            'e5529b081edda4dbc354e9d5648da982c210ed8070340816171d3c428886ae614207481ab729559c45cc927c6edcfd1cfde157c84434b737f4b5a163d55c6a29'
            'c0704d558276d13761b10a82837811217fcb222122a96bd05eecda808b016ba0a8a8b9a1e124323d479a55a218778b29fc34e6dd98d7d5482f14038ce89fad4b'
            'c8343b8454891d1deeede7e0a76785d653d98c506cdf26b9a1083a2ba16f8012646d80caee7dc4d7f1fa715e9753f5362e9365048b16db8f187369827ab69f01'
            '715e60d1bd6be9e79deb153210c35b797160df536844840335e6742989ca4d422fb2cbc4ac7544b71675413d9a532901483a26eec28f5addb461a3ae20558aa0'
            '3ca7953291430504cf8f20454301885edbe4bee1438358eff56970606f26060300a4ff955bf512fe831555c4b9d332508a8f115245dddf7ab4494177c0e01bda')

validpgpkeys=(
              'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linus Torvalds
              '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman
              '64254695FFF0AA4466CC19E67B96E8162A8CF5D1' # Sebastian Andrzej Siewior
              '5ED9A48FC54C0A22D1D0804CEBC26CDB5A56DE73' # Steven Rostedt
              'E644E2F1D45FA0B2EAA02F33109F098506FF0B14' # Thomas Gleixner
              )
