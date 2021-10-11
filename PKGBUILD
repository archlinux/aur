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
_major=5.14
_minor=2
_rtver=21
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
_bfq_rel="r2K210909v1"
_bfq_patch="${_major}-${_bfq_path}-${_bfq_rel}.patch"
_compiler_path="cpu-patches-sep"
_compiler_patch="0001-cpu-${_major}-merge-graysky-s-patchset.patch"

source=("https://www.kernel.org/pub/linux/kernel/v5.x/${_srcname}.tar.xz"
        "https://www.kernel.org/pub/linux/kernel/v5.x/${_srcname}.tar.sign"
        "http://www.kernel.org/pub/linux/kernel/projects/rt/${_major}/patch-${_pkgver}-${_rtpatchver}.patch.xz"
        "http://www.kernel.org/pub/linux/kernel/projects/rt/${_major}/patch-${_pkgver}-${_rtpatchver}.patch.sign"
        #"${_lucjanpath}/${_bfq_rev_path}/${_bfq_rev_patch}"
        "${_lucjanpath}/${_bfq_path}/${_bfq_patch}"
        "${_lucjanpath}/${_compiler_path}/${_compiler_patch}"
        "${_lucjanpath}/arch-patches-v3-sep/0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-C.patch"
        "${_lucjanpath}/arch-patches-v3-sep/0002-Bluetooth-Move-shutdown-callback-before-flushing-tx-.patch"
        "${_lucjanpath}/arch-patches-v3-sep/0003-watchdog-iTCO_wdt-Fix-detection-of-SMI-off-case.patch"
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
        diff -u ../config .config || :

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

sha512sums=('4c1d61343c2812ca9b28b2ecc9c40ff1442e9368cdd0fafff5c5af169c48a31d0c68a303cf0c5f8473eb76f3162b9f0bcd3b46a52f33bbae1576728931e4580d'
            'SKIP'
            '8a223a7af7141f6042b1d592f407b2c370edeab4e64fe015f14397bccd99566bfa5aeb79b77849c57d2bc1e00824c9ce68db4e35dc4c48d0d8599ef097a7b3d2'
            'SKIP'
            '6b93adf52303ca94a4d27fe52914b1615622a9764a94f39eb32153a38b2504880ff9d225f3b21bd6fa7943d320effacb10fd7f99e799e23024da767a1af75b7a'
            'b1aef4f4e7350ce8132e019f76a2ac68bee8a46eb981598fbda11402e62a8bcdfd2f49e5b2cc5dcf2e96c88ad047af12d53abb9fda05c9f7acec37879e5240db'
            '3f8700f9be1ce7049ff15afe6addfe09408fcb0461ad652d5d1795d4ab086837773446a90b85cf02a826d8c073273ebaf38f76495e7164c9af6dd0f7a483fc5d'
            'cd9acb696f86158dd339298a5a884e10b0014e0d472aef9c28dfed649ef4064f3a8f36060898b0b976badd711b34b1a428152e82a518a1e9495f63d583e62727'
            'cc843ba2681706ce8045f1c3a1468f671ca135f389ccf567f18d2662e001134f8795b4631b7aff324b4e7c7c2633d52973fe3705573a60564b33362e78cbb9b7'
            'b6a9676962e04b43fb8a731498520e3ee8105630c840dc885b45c7842805902768f0e05db29bd54b2bf58b1c4e63a12a0edc6bb658ab05640dc6522a8ca20ab3')

validpgpkeys=(
              'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linus Torvalds
              '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman
              '64254695FFF0AA4466CC19E67B96E8162A8CF5D1' # Sebastian Andrzej Siewior
              '5ED9A48FC54C0A22D1D0804CEBC26CDB5A56DE73' # Steven Rostedt
              'E644E2F1D45FA0B2EAA02F33109F098506FF0B14' # Thomas Gleixner
              )
