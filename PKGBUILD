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
_major=5.17
_minor=4
pkgver=${_major}.${_minor}
_srcname=linux-${pkgver}
pkgrel=3
pkgdesc='Linux AUFS'
arch=('x86_64')
url="https://github.com/sfjro/aufs5-standalone"
license=('GPL2')
options=('!strip')
makedepends=('bc' 'libelf' 'python-sphinx' 'python-sphinx_rtd_theme'
             'graphviz' 'imagemagick' 'pahole' 'cpio' 'perl' 'tar' 'xz'
             'texlive-latexextra' 'xmlto')
#_lucjanpath="https://raw.githubusercontent.com/sirlucjan/kernel-patches/master/${_major}"
_lucjanpath="https://gitlab.com/sirlucjan/kernel-patches/raw/master/${_major}"
_aufs_path="aufs-patches"
_aufs_ver="20220412"
_aufs_patch="0001-aufs-${_aufs_ver}.patch"
_compiler_path="cpu-patches-sep"
_compiler_patch="0001-cpu-${_major}-merge-graysky-s-patchset.patch"

source=("https://www.kernel.org/pub/linux/kernel/v5.x/${_srcname}.tar.xz"
        "https://www.kernel.org/pub/linux/kernel/v5.x/${_srcname}.tar.sign"
        "${_lucjanpath}/${_aufs_path}/${_aufs_patch}"
        "${_lucjanpath}/${_compiler_path}/${_compiler_patch}"
        "${_lucjanpath}/arch-patches-v15-sep/0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-C.patch"
        "${_lucjanpath}/arch-patches-v15-sep/0002-random-treat-bootloader-trust-toggle-the-same-way-as.patch"
        "${_lucjanpath}/arch-patches-v15-sep/0003-tick-Detect-and-fix-jiffies-update-stall.patch"
        "${_lucjanpath}/arch-patches-v15-sep/0004-tick-rcu-Remove-obsolete-rcu_needs_cpu-parameters.patch"
        "${_lucjanpath}/arch-patches-v15-sep/0005-tick-rcu-Stop-allowing-RCU_SOFTIRQ-in-idle.patch"
        "${_lucjanpath}/arch-patches-v15-sep/0006-lib-irq_poll-Declare-IRQ_POLL-softirq-vector-as-ksof.patch"
        "${_lucjanpath}/arch-patches-v15-sep/0007-gpio-Request-interrupts-after-IRQ-is-initialized.patch"
        "${_lucjanpath}/arch-patches-v15-sep/0008-NFSv4.1-provide-mount-option-to-toggle-trunking-disc.patch"
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
    optdepends=('wireless-regdb: to set the correct wireless channels of your country'
                'linux-firmware: firmware images needed for some devices'
                'modprobed-db: Keeps track of EVERY kernel module that has ever been probed - useful for those of us who make localmodconfig')
    provides=(VIRTUALBOX-GUEST-MODULES WIREGUARD-MODULE)

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
   depends=('linux-aufs' 'pahole')

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
  install -Dt "$builddir/tools/bpf/resolve_btfids" tools/bpf/resolve_btfids/resolve_btfids

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
}

pkgname=("$pkgbase" "$pkgbase-headers" "$pkgbase-docs")
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done

sha512sums=('a0f1945eb61527aac886875a83ad720bff3d6cd06ed0ee92ff7795e4f854d797f7688a102f1e8aa4425e96aab789f4b4c82104591de32fdf34ffd5c13622bbf3'
            'SKIP'
            '87e88b3e4bccbf7b21eb5ffe5971f4e85593b153ea0c4ef3a7f17715812ef1478e16786cab42fcfe226f4933091280c068ad89c08ba9b264887baffcf522d87d'
            'b63921b6246bd1b9545a8042d76334bef8a7ee46e5404c5efec4a842a455a84046e92423b2bc6d950f19dcf85805d7493fe71d6d177e3b46b52a279b0a44d0c9'
            'e46caf09f93297e8dc906cbd333314295d87a71e0c6d3e236d1be7eb7d7aea635093699d869bae3b5388ff20ac09b53d23e708bb0f05578a4ee440507c2696bf'
            'ef438b99826e2f967114719c96f98d76a23e66f9bb6577d46c5bc0b9132dce966f1bd0d24d1b19ed916e534141b3a73da38e63565381d2ff09e89ce6fdd64ee6'
            'e98a9e0bc3f798e33fc0fa42434b3f8c03456f66f0b95f419aaeb77b71d9e60b02d1559bf1bb31c0376fd73aee824dcdcfbf619da3fbe6345db6e7b645c6d99b'
            '0c9ea6c73693cf91699c9691f424d80a11de860585d2d1f522ccfa34506e9dd4de3bac7d2b7226e09cc4f3daf0f5e0beec2b921829a911d280d9c0b2ea649b78'
            'b4fb5de2d839e3a1db854d8efeb4f604df1dd6de4bb0367a5bff873c1515f003a5fca8f115ae96ed3669de62ef0ce18039313f103aa0f868808c51985aee06e2'
            'c713e61cc1cf2d9402dd419f8c5367e7f4c0c0444ffd8c56c8407d943286bc104a315e8f4547d522b973b23ed4722137c82a2716b3c43710e0e38307994911d8'
            '61e0469fd061af316cd896f87c3d87a99687a1d9fe85f1a4fcc3dafcbe4c489fd42d3ee7ba9b9691f643c5f442f5a2bd5d0ffb1b1081415ec1030aa4ba85123d'
            'e3f7d5889e136724b94fee7feef25e412eac1c149e7049afbf25513b08e642a99dda5385e3246914fe18e04dcde7e48a09a264a77f442aab1cf97e26208a9026'
            'e99adee8d2440010fc6298a30d22165d3a5c1a5bc8a6da272354d9c32146a259aa32979cdda20095a25926b5a582056375d8ed30bce9ea2007b7dd66f8afa499')

validpgpkeys=(
              'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linus Torvalds
              '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman
             )
