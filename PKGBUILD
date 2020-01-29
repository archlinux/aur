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

pkgbase=linux-uksm
# pkgname=('linux-uksm' 'linux-uksm-headers' 'linux-uksm-docs')
_major=5.4
_minor=16
pkgver=${_major}.${_minor}
_srcname=linux-${pkgver}
pkgrel=1
pkgdesc='Linux UKSM'
arch=('x86_64')
url="https://github.com/dolohow/uksm"
license=('GPL2')
options=('!strip')
makedepends=('kmod' 'bc' 'libelf' 'python-sphinx' 'python-sphinx_rtd_theme'
             'graphviz' 'imagemagick')
#_lucjanpath="https://raw.githubusercontent.com/sirlucjan/kernel-patches/master/${_major}"
_lucjanpath="https://gitlab.com/sirlucjan/kernel-patches/raw/master/${_major}"
#_uksm_path="https://raw.githubusercontent.com/sirlucjan/uksm/master/v5.x"
_uksm_path="https://raw.githubusercontent.com/dolohow/uksm/master/v5.x"
#_uksm_path="https://raw.githubusercontent.com/zaza42/uksm/master"
_uksm_patch="uksm-${_major}.patch"
_gcc_path="https://raw.githubusercontent.com/graysky2/kernel_gcc_patch/master"
_gcc_patch="enable_additional_cpu_optimizations_for_gcc_v9.1+_kernel_v4.13+.patch"

source=("https://www.kernel.org/pub/linux/kernel/v5.x/${_srcname}.tar.xz"
        "https://www.kernel.org/pub/linux/kernel/v5.x/${_srcname}.tar.sign"
        "${_uksm_path}/${_uksm_patch}"
        "${_gcc_path}/${_gcc_patch}"
        "${_lucjanpath}/arch-patches-v23-sep/0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-C.patch"
        "${_lucjanpath}/arch-patches-v23-sep/0002-lib-devres-add-a-helper-function-for-ioremap_uc.patch"
        "${_lucjanpath}/arch-patches-v23-sep/0003-mfd-intel-lpss-Use-devm_ioremap_uc-for-MMIO.patch"
        "${_lucjanpath}/arch-patches-v23-sep/0004-PCI-pciehp-Prevent-deadlock-on-disconnect.patch"
        "${_lucjanpath}/arch-patches-v23-sep/0005-ACPI-PM-s2idle-Rework-ACPI-events-synchronization.patch"
        "${_lucjanpath}/arch-patches-v23-sep/0006-iwlwifi-pcie-restore-support-for-Killer-Qu-C0-NICs.patch"
        "${_lucjanpath}/arch-patches-v23-sep/0007-drm-i915-save-AUD_FREQ_CNTRL-state-at-audio-domain-s.patch"
        "${_lucjanpath}/arch-patches-v23-sep/0008-drm-i915-Fix-audio-power-up-sequence-for-gen10-displ.patch"
        "${_lucjanpath}/arch-patches-v23-sep/0009-drm-i915-extend-audio-CDCLK-2-BCLK-constraint-to-mor.patch"
        "${_lucjanpath}/arch-patches-v23-sep/0010-drm-i915-Limit-audio-CDCLK-2-BCLK-constraint-back-to.patch"
        "${_lucjanpath}/arch-patches-v23-sep/0011-e1000e-Revert-e1000e-Make-watchdog-use-delayed-work.patch"
        "${_lucjanpath}/arch-patches-v23-sep/0012-drm-amdgpu-Add-DC-feature-mask-to-disable-fractional.patch"
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
   depends=('linux-uksm')

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
    depends=('linux-uksm')

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

sha512sums=('994d0884230c258c97af8c9b1857241d34c780bc61271102707e7bd861270306b1f4c51a00d48826786d1544e8647de8c1e72fa74bf3e9a498a32b7db428337d'
            'SKIP'
            'c9aa593db5c142cbc60c60fb15dc780c11af03a6607301250c27d5042b14481f1ea7edfc87bde70019d2bcd1f1d53c05c3291f94b9e66795c81fade740419818'
            '2eb574fbfac6e334d3b06e52e466dbf8e88034515729b6571990b10f75a0fe2a52f188615405c5a695b5820669e595deead44d7961a97c5872359be3435fdf63'
            '85af8f664fffc74fa1f5483dd73e8721987d7d98a0acf931240abbb35d6a2c7a1bf43065aa5a26252acba8f91c1a44843b921cd7fffcdfb573a7433552c8f278'
            'c363f233e9ed9b16fca4c5f4da2813c99d4ef0b6833622417ef3c66803c3840e7223b92964d2f589a2725adbddf9ebba531e749893eb923b3a4b44531bb277cc'
            '495dd774d87949120853aa3c1f1f0962bd62088c164fe6c206cd77a563e34cb8ef58f09fb60c171ca0cbdc6ff063d1cb258fe775fecb7e8bc9f8bdff6943bc15'
            'bb6d714fa797c91a04dc16c7b4c349883c43ca7793fafa2a1c115847e97859290427aa3b6d6c22b0dc965820a9c4e47ffbd179022c3dbc99451a110cae8120c8'
            '10998bd2a69983906a3c95464ded50875f91b39dfd46250be21a649a2fe0678ff39121667920ae78df707cf26287ae97dad4b3f000d7740345376c24371bea65'
            '3096708a9bf3659c22799ad41b48ce1f2aa11d1d452900ade91554b5ff6e355bf5414ca889b6a1fd89e580658d65858cd2de10cc24c37ddafa6fdb3c0aec92c2'
            '6d3818b5cbb24d72a2bec2ecfb0906737656f9019abf3ead129b6e0327891ed2e506964762e0b2c2d2e7dc9e30271441a046338dfee91c394719b661ee818e02'
            'b8d5d318c1b61b9c679286a02ada39eb615d77701d8fff67716a73873e76f74f3b7d8962ce882b657077af5815876a82e111ad38355dd57d4bbcd564eee6d8d6'
            '9234b551064b4044bf81bc10d378a5b043353c9df6155015ef6ebf3bbd838e47b9715e35f0850667e8ed7b2e788171d2a59fc92b4ac17398ef648ba826bcf9f4'
            '684aa5859705eae56b7ca328a8dcec712ba7092c1271017ef208a2b3c090840a29383d79f07618263b76b417176619b2ff0e7465caaf0bc4697578ab95b4ae89'
            '12ab4a40784786e1784cd24bd0a3a128bb89f6f11626f1544365d476132ab9b62f5da04e37ee9155564838adfb237888aa552ec086af0cfa85bcab54f3505b5d'
            '1cad3b4cf1c95ee1cb8ea0e54771246d5de4af925d13ddcd92814c4a5f139f84fabefa51b73d5d0204395cfcbb71a1db11e436b26fddc1a9c7c09788e22d2855'
            'cdd36f59c908f24b3a1df9898671068c0a2eccb6f445c54dc069a379bd3337b4986c3783c060c35bd7009c97c91da011a8abbc348bf3dff283c76ee7ea8d862f')

validpgpkeys=(
              'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linus Torvalds
              '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman
             )
