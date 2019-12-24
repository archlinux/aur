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
_major=5.4
_minor=6
pkgver=${_major}.${_minor}
_srcname=linux-${pkgver}
pkgrel=2
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
_aufs_ver="20191223"
_aufs_patch="0001-aufs-${_aufs_ver}.patch"
_gcc_path="https://raw.githubusercontent.com/graysky2/kernel_gcc_patch/master"
_gcc_patch="enable_additional_cpu_optimizations_for_gcc_v9.1+_kernel_v4.13+.patch"

source=("https://www.kernel.org/pub/linux/kernel/v5.x/${_srcname}.tar.xz"
        "https://www.kernel.org/pub/linux/kernel/v5.x/${_srcname}.tar.sign"
        "${_lucjanpath}/${_aufs_path}/${_aufs_patch}"
        "${_gcc_path}/${_gcc_patch}"
        "${_lucjanpath}/arch-patches-v8-sep/0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-C.patch"
        "${_lucjanpath}/arch-patches-v8-sep/0002-lib-devres-add-a-helper-function-for-ioremap_uc.patch"
        "${_lucjanpath}/arch-patches-v8-sep/0003-mfd-intel-lpss-Use-devm_ioremap_uc-for-MMIO.patch"
        "${_lucjanpath}/arch-patches-v8-sep/0004-PCI-pciehp-Do-not-disable-interrupt-twice-on-suspend.patch"
        "${_lucjanpath}/arch-patches-v8-sep/0005-PCI-pciehp-Prevent-deadlock-on-disconnect.patch"
        "${_lucjanpath}/arch-patches-v8-sep/0006-ACPI-PM-s2idle-Rework-ACPI-events-synchronization.patch"
        "${_lucjanpath}/arch-patches-v8-sep/0007-x86-MCE-AMD-Do-not-use-rdmsr_safe_on_cpu-in-smca_con.patch"
        "${_lucjanpath}/arch-patches-v8-sep/0008-x86-MCE-AMD-Allow-Reserved-types-to-be-overwritten-i.patch"
        "${_lucjanpath}/arch-patches-v8-sep/0009-x86-mce-Fix-possibly-incorrect-severity-calculation-.patch"
        "${_lucjanpath}/arch-patches-v8-sep/0010-Revert-iwlwifi-assign-directly-to-iwl_trans-cfg-in-Q.patch"
        "${_lucjanpath}/arch-patches-v8-sep/0011-iwlwifi-pcie-move-power-gating-workaround-earlier-in.patch"
        "${_lucjanpath}/arch-patches-v8-sep/0012-x86-intel-Disable-HPET-on-Intel-Coffee-Lake-H-platfo.patch"
        "${_lucjanpath}/arch-patches-v8-sep/0013-x86-intel-Disable-HPET-on-Intel-Ice-Lake-platforms.patch"
        "${_lucjanpath}/arch-patches-v8-sep/0014-drm-i915-save-AUD_FREQ_CNTRL-state-at-audio-domain-s.patch"
        "${_lucjanpath}/arch-patches-v8-sep/0015-drm-i915-Fix-audio-power-up-sequence-for-gen10-displ.patch"
        "${_lucjanpath}/arch-patches-v8-sep/0016-drm-i915-extend-audio-CDCLK-2-BCLK-constraint-to-mor.patch"
        "${_lucjanpath}/arch-patches-v8-sep/0017-ASoC-SOF-enable-sync_write-in-hdac_bus.patch"
        "${_lucjanpath}/arch-patches-v8-sep/0018-xhci-pci-Allow-host-runtime-PM-as-default-also-for-I.patch"
        "${_lucjanpath}/arch-patches-v8-sep/0019-iwlwifi-pcie-restore-support-for-Killer-Qu-C0-NICs.patch"
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
   depends=('linux-aufs')

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
    depends=('linux-aufs')

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

sha512sums=('9e1153e80303d6d5016856a25f3757259a3a428bad11208192315088d1f1a09957f5b8e966ab8cb5842ce1a740760f87474066294f8b410e9c44c810838bcdac'
            'SKIP'
            '305ba076765c8b85ad1d480a9dcce825ffc911fe6a66c37eb7cb8891481c9e4ff654d14cbe30f616c1f5f25d4262d0a3bb45776bde8703806bb757f64d67f7c6'
            '2eb574fbfac6e334d3b06e52e466dbf8e88034515729b6571990b10f75a0fe2a52f188615405c5a695b5820669e595deead44d7961a97c5872359be3435fdf63'
            'a95fc9c07fcedb55519cbcddfa32a153dc9827abbda6be0c5ec43df7000b22f73665c90e54357d1e7c178310e488902ace617bc5f2fcfd9e6d17c6b6ffe979fb'
            '1bc9c65173bd87501a4a50e5dbee50bf2dfe414f35cf14df24539fb2872b6a0c116e96d67061f3cc41c0b12d6e8dbfeca09e56ad0d3861cb8c6d429ba3dae782'
            '7ec1aa991150b7076d5e2ac2095684d9c300b0a288c018b0964f1b91336075be9dc177926733d35fcb719958c383eb747a970a98374ea9637f87b80d1819cd9f'
            'b4fa6029d88e17857651df20000da08d5aa2be9f4caae538c214e9da7a29fd0cb236fbe52b942d3ac3acd9badcd5c4c9733c275bdc86b36c42782df624d2f931'
            'fd908364f72e350168ffa2e85af4e1524d533b052e1b96a3c3ea49917359e1f53b7595e83fcd68919e466ec843a0c1d3f997fcf7c54f436e882e874c2efcc76a'
            '8a099c9a9c9286145c017522513c77dbb3d2afad134be86638afb98da1d9d33ecfb2e732197d14011377370f374ddfa5a38acc6bb5592dbdff3c69ba895f5ba8'
            '0008788cfd2c1cba2e81d26c5a60b2252bcb2321bce0e58f4ed4b277b7694629a05fd752a78ed78a6aea8c05b380d7ebedeba5eec3ca1ef98f45a508ef1d0196'
            '8c42febba271b861bbc395d3c648cf69ee63d32ba8960e5ea279ae19ac5d8862b66792b23718ae2872c9fe382c9274ce1687cb936b6bb17e033e5d7dda07b5bb'
            '90bf9ec2ea09640b37b7562e5cb898c41b84578eb34f71ee655a2a32ab5ea0c416428cd329db470628632ca52c4f735084303b996d70c0d06493b9c8edd6d1a3'
            '4c9d0ce8aff3e4f038d149338c1dcc09bdb25ac20a5595ad2b3121fba182d67f0aa65074e91766f7b424a1a6c06799a21230ab2ac36cac4325ee6003302eef07'
            '0e2b9a09a1b1412c114286458f77d6456cc2ad7b1446a5b265762575b9754306e9c64610c7538e5b26b836dc7738f9e943e08085cb0c24793ac6db610a3422a0'
            '23be8ca447cbc47d95eca9091aba5b1065d177d4ccdc043e2c721d803dc23cfbc20e5c4c726c60509d5706d09425e870c31318f93e10d8b53ba2c594fdb7e2e2'
            '0dfecc4289bd0812e75a8ce6b2070697c6f63e7a908f77b13ea45775e8614ff4c7ccfd7d1398347f18c910eefb0e4c93bf34f4d09172bee56d42da4cee27097c'
            '207c834bc6d58ecebc282c98c0909b10b639b4c726e09cb56c63773fe18a2a2d0e87821e9415d2ead99e063adff997f9c56b8aebc36eb1ca237edeca12573ce0'
            '6d81e10255249a3973a953a24c8db6bb710ebd6f0ae9da8f237fdd67286cb4bb8b18e0de348cfb97e95dd2bdfc8570f028cecaac395dfa61640fd4028da95ebd'
            'e3e94ddcbc7cdfb2b4dd400da1faec2d0005c6ca0cf2899ac0511d3e2dbb097ea5408ed75287ac9af8aa46fbf2b6b43f5fa925aac19a56857a55fc11e1d875b5'
            'd391bb8ae372a9d2fa28d95697c12fe4fd4b25af572151e328c54930b65b3671f15b15878d51826b26951d9c6a402d3c8ef2fbcf63d9b45dd231ee4dde362433'
            'd3adf58b008f1147fa0ba1ecc36c535069b9b2cefa12cc6dacd8257bd199d08fc3cb29867276e3156b28fd879d88234bc244fa2d17bb67bfcd1e12eb0a9b3a34'
            '088c1e20c109b6b12649a9bad33875952974a7a30b7ea278ec8b60866234b644fbc21140308aa5ea355a0fd391fc45e8c795c3216b9387f6ff14f0f5588a3dcd'
            '463043cd721c91ff91322b8f362e53635e7ebd528a8bee9eaa4479ad27fe74a591c589ae4d701c083a1f49f5cc77bc6c8fb13ed36546b0fcc9bdd7f0a63e31a2')

validpgpkeys=(
              'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linus Torvalds
              '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman
             )
