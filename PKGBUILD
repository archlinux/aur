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
_major=5.10
_minor=1
_rtver=20
_rtpatchver=rt${_rtver}
pkgver=${_major}.${_minor}.${_rtpatchver}
_pkgver=${_major}.${_minor}
_srcname=linux-${_pkgver}
pkgrel=9
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
# To use linux-rt-bfq-dev smoothly apply bfq-reverts before bfq-dev patch.
# Otherwise the kernel will not compile.
_bfq_rev_path="bfq-reverts-all"
_bfq_rev_patch="0001-bfq-reverts.patch"
_bfq_path="bfq-dev-lucjan"
_bfq_ver="v14"
_bfq_rel="r2K201228"
_bfq_patch="${_major}-${_bfq_path}-${_bfq_ver}-${_bfq_rel}.patch"
_gcc_path="cpu-patches-sep"
_gcc_patch="0001-cpu-${_major}-merge-graysky-s-patchset.patch"

source=("https://www.kernel.org/pub/linux/kernel/v5.x/${_srcname}.tar.xz"
        "https://www.kernel.org/pub/linux/kernel/v5.x/${_srcname}.tar.sign"
        "http://www.kernel.org/pub/linux/kernel/projects/rt/${_major}/patch-${_pkgver}-${_rtpatchver}.patch.xz"
        "http://www.kernel.org/pub/linux/kernel/projects/rt/${_major}/patch-${_pkgver}-${_rtpatchver}.patch.sign"
        "${_lucjanpath}/${_bfq_rev_path}/${_bfq_rev_patch}"
        "${_lucjanpath}/${_bfq_path}/${_bfq_patch}"
        "${_lucjanpath}/${_gcc_path}/${_gcc_patch}"
        "${_lucjanpath}/arch-patches-v2-sep/0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-C.patch"
        "${_lucjanpath}/arch-patches-v2-sep/0002-Bluetooth-Fix-LL-PRivacy-BLE-device-fails-to-connect.patch"
        "${_lucjanpath}/arch-patches-v2-sep/0003-Bluetooth-Fix-attempting-to-set-RPA-timeout-when-uns.patch"
        "${_lucjanpath}/arch-patches-v2-sep/0004-HID-quirks-Add-Apple-Magic-Trackpad-2-to-hid_have_sp.patch"
        "${_lucjanpath}/arch-patches-v2-sep/0005-drm-amd-display-Add-get_dig_frontend-implementation-.patch"
        "${_lucjanpath}/arch-patches-v2-sep/0006-drm-amdgpu-only-set-DP-subconnector-type-on-DP-and-e.patch"
        "${_lucjanpath}/arch-patches-v2-sep/0007-btrfs-Fix-500-2000-performance-regression-w-5.10.patch"
        "${_lucjanpath}/arch-patches-v2-sep/0008-iwlwifi-Fix-regression-from-UDP-segmentation-support.patch"
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
    depends=('linux-rt-bfq-dev')
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

sha512sums=('5b6cc32f2daa1de35ceeb0007536d6e49776064370d94f8d77c19cefc97e88c47ff55cb4c6add7c49189e7203ff44a05ffacf3c0f4b766f719d6df1a110f95bb'
            'SKIP'
            '20545a16adf746690930a67dab11fba15f225f07c0c018296b01b0acb7d9f4e12862fc53668992c318d671f506513436f8f9e1d174f761ee31e75bbc3d27514e'
            'SKIP'
            '45fa721352143304eceff87649986fd42fcf4ae369f15ba704a435ab2f107dfe41c050eac25cd9167d2cc73d569aad8501cbd13477b62bad9724e4240f36ab15'
            'a920e67f590f07c2f3b0b51ce84fba8207465ff1341f636ea7ba1403e4f34d595ccaafb4215a88caccf8181975846eb5c993eb297f58c9669856552f216228e8'
            '34e21ecc4ef0d07707283427fa82d561a9573d670e80ccd41f7d9cb595473b3844b8df7aeffcb4fe82d9deeef0a4d4e6aef663eb1a7a397fa181f06f418a0d6d'
            '30811ab386f4d8c174fb1720a2f4998dcbedd3d96f474b84206b1f8fa06bf582e4534311b63e053694a51e45c52f576bbd8139a4e3b58790f1ac1d55a6a90a96'
            '27dd242516980cfe9cefd5f311a5eb88b264dbc2e375e78ec6f00f68e1443816e6bc61483e938e0aea4b2f2bf5771205694040c5a69d15ecbf564319b2af83c1'
            '29975b0965cdd778d74230f61036df4a9b50f8066c61cd47dfca876d4e3d124f05fc04e6c6643eecc9e2c80c3cad871519261621fbbc9503a6a5300b16207526'
            'e8bd677cc37f2558a2c7be088a5da313defaeb3f964ce32c0216dd014410105bf24b7462012ef939118f42c7491620fd053fb3e8f7180012c876dfe635b12dca'
            '032a539bb4514e587dd4871bc47eee0c916800287d541cc7aae7ccd93404397bb609c7f6cac62bcb4b64a8c1b3d25868ed5bc31564a82286423aa91638195f1b'
            'b6213d144be6be37e8b1403858fc7d42643fe188c2e2e28e56fcec8a2efbb5694cc326a1bc4c3d8f37d58c2e1ebdd08ded864f66f6762cfeb1d9bfb5040d7c9e'
            'b57d6499b4563134c8bfd8ff550ff04229c4894c1f0fffa7fa73b9cff7f0735c7ac96391f844aa149d32c27a538da7d46d1d005178118f4ea525d1e787fbe9a7'
            '053890f284c6c125e29953c6ac544a3e75a93ce4a2fcc570141be0fa6add5934cc613292da736097371644fc9f091c0df6d013026a413456e1dd3dfb0db7a667'
            'c163e84c14d990f334aa23627ad1cddb8b5992b9c8949e1c96de00f5078626884166a2d5a1fc9b2d091e2770446b181324154b8d854322553611d84cda8fa28f')

validpgpkeys=(
              'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linus Torvalds
              '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman
              '64254695FFF0AA4466CC19E67B96E8162A8CF5D1' # Sebastian Andrzej Siewior
              '5ED9A48FC54C0A22D1D0804CEBC26CDB5A56DE73' # Steven Rostedt
              'E644E2F1D45FA0B2EAA02F33109F098506FF0B14' # Thomas Gleixner
              )
