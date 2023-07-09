#_     _            _                                _____
#| |__ | | __ _  ___| | ___ __ ___   ___   ___  _ __ |___ /
#| '_ \| |/ _` |/ __| |/ / '_ ` _ \ / _ \ / _ \| '_ \  |_ \
#| |_) | | (_| | (__|   <| | | | | | (_) | (_) | | | |___) |
#|_.__/|_|\__,_|\___|_|\_\_| |_| |_|\___/ \___/|_| |_|____/

#Maintainer: blackmoon3 <https://github.com/blacksky3>
#Credits: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
#Credits: Andreas Radke <andyrtr@archlinux.org>
#Credits: Kyle De'Vir (QuartzDragon) <kyle[dot]devir[at]mykolab[dot]com>

################################# Arch ################################

ARCH=x86

################################# Grep GCC version ################################

_gccversion=$(gcc -dumpversion)

################################# CC/CXX/HOSTCC/HOSTCXX ################################

#Set compiler to build the kernel
#Set '1' to build with GCC
#Set '2' to build with CLANG and LLVM
#Default is empty. It will build with GCC. To build with different compiler just use : env _compiler=(1 or 2) makepkg -s
if [ -z ${_compiler+x} ]; then
  _compiler=
fi

if [[ "$_compiler" = "1" ]]; then
  _compiler=1
  BUILD_FLAGS=(CC=gcc CXX=g++ HOSTCC=gcc HOSTCXX=g++)
elif [[ "$_compiler" = "2" ]]; then
  _compiler=2
  BUILD_FLAGS=(CC=clang CXX=clang++ HOSTCC=clang HOSTCXX=clang++ LD=ld.lld LLVM=1 LLVM_IAS=1)
else
  _compiler=1
  BUILD_FLAGS=(CC=gcc CXX=g++ HOSTCC=gcc HOSTCXX=g++)
fi

###################################################################################

pkgbase=linux-pds
pkgver=6.4.0
_pkgver=6.4
pkgrel=1
major=6.4
commit=1b45fa8cd58990bf455b429c598b6d4bad155172
arch=(x86_64)
url='https://www.kernel.org/'
license=(GPL2)
makedepends=(bc cpio gettext git libelf pahole perl tar xz kmod xmlto)
makepends+=(graphviz imagemagick python-sphinx texlive-latexextra) # htmldocs
makedepends+=(bison flex zstd make patch gcc gcc-libs glibc binutils)
if [[ "$_compiler" = "2" ]]; then
  makedepends+=(clang llvm llvm-libs lld python)
fi
options=(!strip)

archlinuxpath=https://gitlab.archlinux.org/archlinux/packaging/packages/linux/-/raw/$commit
patchpath=https://raw.githubusercontent.com/blacksky3/patches/main/$major

source=(https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-$_pkgver.tar.xz
        ${archlinuxpath}/config
        # PRJC patch
        ${patchpath}/alfred/prjc_v6.4-r0.patch
        # Arch patches
        ${patchpath}/arch/v6.4-arch1/0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-C.patch
        # Other patches
        # Sirlucjan
        ${patchpath}/sirlucjan/amd/0001-amd-6.4-merge-changes-from-dev-tree-v2.patch
        ${patchpath}/sirlucjan/bfq/0001-bfq-cachyos-patches-v1.patch
        ${patchpath}/sirlucjan/block/0001-block-set-rq_affinity-to-force-full-multithreading-I-v1.patch
        ${patchpath}/sirlucjan/btrfs/0001-btrfs-6.4-merge-changes-from-dev-tree-v1.patch
        ${patchpath}/sirlucjan/clang/0001-clang-6.4-add-miscellaneous-fixes-for-clang-v1.patch
        ${patchpath}/sirlucjan/drm/0001-drm-6.4-Add-HDR-patches-v1.patch
        ${patchpath}/sirlucjan/hid/0001-hid-6.4-merge-changes-from-dev-tree-v1.patch
        ${patchpath}/sirlucjan/x86/0001-x86-Avoid-relocation-information-in-final-vmlinux-v1.patch
        ${patchpath}/sirlucjan/zstd/0001-zstd-6.4-import-v1.5.5-v1.patch
        ${patchpath}/sirlucjan/zstd/0001-zstd-modules-cachyos-patches-v1.patch
        # TKG
        ${patchpath}/tkg/0001-mm-Support-soft-dirty-flag-reset-for-VA-range.patch
        ${patchpath}/tkg/0002-mm-Support-soft-dirty-flag-read-with-reset.patch
        ${patchpath}/tkg/0013-optimize_harder_O3.patch
        # Xanmod
        ${patchpath}/xanmod/0001-PCI-Enable-overrides-for-missing-ACS-capabilities.patch
        ${patchpath}/xanmod/0001-futex-Add-entry-point-for-FUTEX_WAIT_MULTIPLE-opcode.patch
        ${patchpath}/xanmod/0001-winesync-Introduce-the-winesync-driver-and-character.patch
        ${patchpath}/xanmod/0001-x86-kconfig-more-uarches-for-kernel-5.17-xm_rev2.patch
        ${patchpath}/xanmod/0001-XANMOD-x86-build-Add-more-x86_64-optimizations.patch
        ${patchpath}/xanmod/0002-XANMOD-Makefile-Move-ARM-and-x86-instruction-set-sel.patch\
        ${patchpath}/xanmod/0002-XANMOD-fair-Remove-all-energy-efficiency-functions.patch
        ${patchpath}/xanmod/0003-XANMOD-fair-Increase-wake-up-granularity-time-to-3ms.patch
        ${patchpath}/xanmod/0011-XANMOD-dcache-cache_pressure-50-decreases-the-rate-a.patch
        ${patchpath}/xanmod/0012-XANMOD-mm-vmscan-vm_swappiness-30-decreases-the-amou.patch
        ${patchpath}/xanmod/0016-XANMOD-Makefile-Disable-GCC-vectorization-on-trees.patch
        # Xanmod Intel
        ${patchpath}/xanmod/intel/0001-sched-fair-Record-the-average-duration-of-a-task.patch
        ${patchpath}/xanmod/intel/0002-sched-fair-Introduce-SIS_CURRENT-to-wake-up-short-ta.patch
        ${patchpath}/xanmod/intel/0003-x86-vdso-Use-lfence-instead-of-rep-and-nop.patch
        ${patchpath}/xanmod/intel/0004-sched-wait-Do-accept-in-LIFO-order-for-cache-efficie.patch
        ${patchpath}/xanmod/intel/0005-intel_rapl-Silence-rapl-trace-debug.patch
        ${patchpath}/xanmod/intel/0006-firmware-Enable-stateless-firmware-loading.patch
        ${patchpath}/xanmod/intel/0007-locking-rwsem-spin-faster.patch
        ${patchpath}/xanmod/intel/0008-drivers-initialize-ata-before-graphics.patch
        ${patchpath}/xanmod/intel/0009-init-wait-for-partition-and-retry-scan.patch)

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare(){
  cd ${srcdir}/linux-$_pkgver

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    msg "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  plain ""

  # Copy the config file first
  # Copy "${srcdir}"/config to "${srcdir}"/linux-${_pkgver}/.config
  msg "Copy "${srcdir}"/config to "${srcdir}"/linux-$_pkgver/.config"
  cp "${srcdir}"/config .config

  sleep 2s

  plain ""

  msg "Enable PDS CPU Scheduler"

  msg2 "Enable CONFIG_SCHED_ALT, this feature enable alternative CPU scheduler"
  scripts/config --enable CONFIG_SCHED_ALT

  sleep 2s

  msg2 "Enable PDS"
  scripts/config --disable CONFIG_SCHED_BMQ
  scripts/config --enable CONFIG_SCHED_PDS

  sleep 2s

  plain ""

  #  # Remove gcc-plugin if gcc version = 13.0.0
  #  if [[ "$_gccversion" = "13.0.0" ]]; then
  #
  #    msg "Remove GCC_PLUGINS"
  #    scripts/config --disable CONFIG_HAVE_GCC_PLUGINS
  #    scripts/config --disable CONFIG_GCC_PLUGINS
  #
  #    sleep 2s
  #    plain ""
  #  fi

  # Set LTO with CLANG/LLVM
  if [[ "$_compiler" = "2" ]]; then

    msg "Enable THIN LTO"
    scripts/config --enable CONFIG_LTO
    scripts/config --enable CONFIG_LTO_CLANG
    scripts/config --enable CONFIG_ARCH_SUPPORTS_LTO_CLANG
    scripts/config --enable CONFIG_ARCH_SUPPORTS_LTO_CLANG_THIN
    scripts/config --disable CONFIG_LTO_NONE
    scripts/config --enable CONFIG_HAS_LTO_CLANG
    scripts/config --disable CONFIG_LTO_CLANG_FULL
    scripts/config --enable CONFIG_LTO_CLANG_THIN
    scripts/config --enable CONFIG_HAVE_GCC_PLUGINS

    #msg "Enable FULL LTO"
    #scripts/config --enable CONFIG_LTO
    #scripts/config --enable CONFIG_LTO_CLANG
    #scripts/config --enable CONFIG_ARCH_SUPPORTS_LTO_CLANG
    #scripts/config --enable CONFIG_ARCH_SUPPORTS_LTO_CLANG_THIN
    #scripts/config --disable CONFIG_LTO_NONE
    #scripts/config --enable CONFIG_HAS_LTO_CLANG
    #scripts/config --enable CONFIG_LTO_CLANG_FULL
    #scripts/config --disable CONFIG_LTO_CLANG_THIN
    #scripts/config --enable CONFIG_HAVE_GCC_PLUGINS

    #msg "Disable LTO"
    #scripts/config --enable CONFIG_LTO_NONE

    sleep 2s
    plain ""
  fi

  msg "Apply some Archlinux config"

  msg2 "Compress modules by default (following Arch's kernel)"
  scripts/config --enable CONFIG_MODULE_COMPRESS_ZSTD

  sleep 2s

  msg2 "CONFIG_STACK_VALIDATION gives better stack traces. Also is enabled in all official kernel packages by Archlinux team"
  scripts/config --enable CONFIG_STACK_VALIDATION

  sleep 2s

  msg2 "Enable IKCONFIG following Arch's philosophy"
  scripts/config --enable CONFIG_IKCONFIG
  scripts/config --enable CONFIG_IKCONFIG_PROC

  sleep 2s

  msg2 "Enable FUNCTION_TRACER/GRAPH_TRACER"
  scripts/config --enable CONFIG_FUNCTION_TRACER
  scripts/config --enable CONFIG_STACK_TRACER

  sleep 2s

  msg2 "Enable CONFIG_USER_NS_UNPRIVILEGED"
  scripts/config --enable CONFIG_USER_NS

  sleep 2s

  msg "Apply config from Cachyos"

  # NUMA is optimized for multi-socket motherboards.
  # A single multi-core CPU actually runs slower with NUMA enabled.
  # See, https://bugs.archlinux.org/task/31187
  msg2 "Disable NUMA"
  scripts/config --disable CONFIG_NUMA
  scripts/config --disable CONFIG_AMD_NUMA
  scripts/config --disable CONFIG_X86_64_ACPI_NUMA
  scripts/config --disable CONFIG_NODES_SPAN_OTHER_NODES
  scripts/config --disable CONFIG_NUMA_EMU
  scripts/config --disable CONFIG_USE_PERCPU_NUMA_NODE_ID
  scripts/config --disable CONFIG_ACPI_NUMA
  scripts/config --disable CONFIG_ARCH_SUPPORTS_NUMA_BALANCING
  scripts/config --disable CONFIG_NODES_SHIFT
  scripts/config --disable CONFIG_NODES_SHIFT
  scripts/config --disable CONFIG_NEED_MULTIPLE_NODES
  scripts/config --disable CONFIG_NUMA_BALANCING
  scripts/config --disable CONFIG_NUMA_BALANCING_DEFAULT_ENABLED

  sleep 2s

  # Disable debug to lower the size of the kernel
  msg2 "Disable debug to lower the size of the kernel"
  scripts/config --disable CONFIG_DEBUG_INFO
  scripts/config --disable CONFIG_DEBUG_INFO_BTF
  scripts/config --disable CONFIG_DEBUG_INFO_DWARF4
  scripts/config --disable CONFIG_DEBUG_INFO_DWARF5
  scripts/config --disable CONFIG_PAHOLE_HAS_SPLIT_BTF
  scripts/config --disable CONFIG_DEBUG_INFO_BTF_MODULES
  scripts/config --disable CONFIG_SLUB_DEBUG
  scripts/config --disable CONFIG_PM_DEBUG
  scripts/config --disable CONFIG_PM_ADVANCED_DEBUG
  scripts/config --disable CONFIG_PM_SLEEP_DEBUG
  scripts/config --disable CONFIG_ACPI_DEBUG
  scripts/config --disable CONFIG_SCHED_DEBUG
  scripts/config --disable CONFIG_LATENCYTOP
  scripts/config --disable CONFIG_DEBUG_PREEMPT

  sleep 2s

  msg "Apply config from linux-prjc (AUR)"

  # Disable CONFIG_DEBUG_INFO=y at build time otherwise memory usage blows up
  # And can easily overwhelm a system with 32 GB of memory using a tmpfs build
  # partition ... this was introduced by FS#66260, see:
  # https://git.archlinux.org/svntogit/packages.git/commit/trunk?h=packages/linux&id=663b08666b269eeeeaafbafaee07fd03389ac8d7
  msg2 "Disable debug to lower the size of the kernel"
  scripts/config --disable CONFIG_CGROUP_BPF
  scripts/config --disable CONFIG_BPF_LSM
  scripts/config --disable CONFIG_BPF_PRELOAD
  scripts/config --disable CONFIG_BPF_LIRC_MODE2
  scripts/config --disable CONFIG_BPF_KPROBE_OVERRIDE

  sleep 2s

  # https://gitlab.com/alfredchen/linux-prjc/-/issues/81
  # Disable mellanox module
  msg2 "Disable mellanox module"
  scripts/config --disable CONFIG_MLX5_CORE

  sleep 2s

  msg "Patch addition config"

  msg2 "Enable CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE (O3) (0013-optimize_harder_O3.patch) (Replace O2 by O3)"
  scripts/config --disable CONFIG_CC_OPTIMIZE_FOR_SIZE
  scripts/config --enable CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE

  sleep 2s

  msg2 "Enable Winesync"
  scripts/config --enable CONFIG_WINESYNC

  sleep 2s

  msg2 "Set ZSTD modules and kernel compression level"
  scripts/config --enable CONFIG_KERNEL_ZSTD
  scripts/config --set-val CONFIG_ZSTD_COMP_VAL 19
  scripts/config --set-val CONFIG_MODULE_COMPRESS_ZSTD_LVL 19
  scripts/config --enable CONFIG_MODULE_COMPRESS_ZSTD_ULTRA
  scripts/config --set-val CONFIG_MODULE_COMPRESS_ZSTD_LEVEL_ULTRA 22

  sleep 2s

  msg2 "Add NVIDIA Shield and Google Stadia support"
  scripts/config --module CONFIG_HID_SHIELD
  scripts/config --enable CONFIG_SHIELD_FF
  scripts/config --enable CONFIG_HID_STADIA_FF

  sleep 2s

  plain ""

  msg "Supress depmod"
  sed -i '2iexit 0' scripts/depmod.sh

  sleep 2s

  plain ""

  # Setting localversion
  msg "Setting localversion..."
  # --save-scmversion as been removed in upstream
  # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/scripts/setlocalversion?h=v6.3-rc1&id=f6e09b07cc12a4d104bb19fe7566b0636f60c413
  # scripts/setlocalversion --save-scmversion
  echo "-${pkgbase}" > localversion

  plain ""

  # Config
  make ARCH=${ARCH} ${BUILD_FLAGS[*]} olddefconfig

  plain ""

  make -s kernelrelease > version
  msg "Prepared $pkgbase version $(<version)"

  plain ""
}

build(){
  cd ${srcdir}/linux-$_pkgver

  msg "make -j$(nproc) all..."
  make ARCH=${ARCH} ${BUILD_FLAGS[*]} -j$(nproc) all
}

_package(){
  pkgdesc='The Linux kernel and modules with Alfred Chen PDS/BMQ CPU scheduler with Arch and other improvement patches - PDS enabled'
  depends=(coreutils initramfs kmod)
  optdepends=('wireless-regdb: to set the correct wireless channels of your country'
              'linux-firmware: firmware images needed for some devices')
  provides=(VIRTUALBOX-GUEST-MODULES WIREGUARD-MODULE KSMBD-MODULE)
  replaces=(virtualbox-guest-modules-arch wireguard-arch)

  cd ${srcdir}/linux-$_pkgver

  local kernver="$(<version)"
  local modulesdir="${pkgdir}"/usr/lib/modules/${kernver}

  msg "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

  msg "Installing modules..."
  # ZSTD_CLEVEL=19
  # Keep it not far away Arch use it in official repo, since we use sirlucjan xstd patch
  make ARCH=${ARCH} ${BUILD_FLAGS[*]} INSTALL_MOD_PATH="${pkgdir}"/usr INSTALL_MOD_STRIP=1 -j$(nproc) modules_install

  # remove build and source links
  msg "Remove build dir and source dir..."
  rm -rf "$modulesdir"/{source,build}
}

_package-headers(){
  pkgdesc="Headers and scripts for building modules for the $pkgbase package"
  depends=("${pkgbase}" pahole)

  cd ${srcdir}/linux-$_pkgver

  local builddir="$pkgdir"/usr/lib/modules/"$(<version)"/build

  msg "Installing build files..."
  install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map *localversion* version vmlinux
  install -Dt "$builddir/kernel" -m644 kernel/Makefile
  install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile
  cp -t "$builddir" -a scripts

  # required when STACK_VALIDATION is enabled
  install -Dt "$builddir/tools/objtool" tools/objtool/objtool

  # required when DEBUG_INFO_BTF_MODULES is enabled
  if [ -f tools/bpf/resolve_btfids/resolve_btfids ]; then
    install -Dt "$builddir/tools/bpf/resolve_btfids" tools/bpf/resolve_btfids/resolve_btfids
  fi

  msg "Installing headers..."
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

  msg "Installing KConfig files..."
  find . -name 'Kconfig*' -exec install -Dm644 {} "$builddir/{}" \;

  msg "Removing unneeded architectures..."
  local arch
  for arch in "$builddir"/arch/*/; do
    [[ $arch = */x86/ ]] && continue
    msg2 "Removing $(basename "$arch")"
    rm -r "$arch"
  done

  msg "Removing documentation..."
  rm -r "$builddir/Documentation"

  msg "Removing broken symlinks..."
  find -L "$builddir" -type l -printf 'Removing %P\n' -delete

  msg "Removing loose objects..."
  find "$builddir" -type f -name '*.o' -printf 'Removing %P\n' -delete

  msg "Stripping build tools..."
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

  msg "Stripping vmlinux..."
  strip -v $STRIP_STATIC "$builddir/vmlinux"

  msg "Adding symlink..."
  mkdir -p "$pkgdir/usr/src"
  ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase"
}

sha256sums=('8fa0588f0c2ceca44cac77a0e39ba48c9f00a6b9dc69761c02a5d3efac8da7f3'
            'ab8e459ac900f4f2b2677d9692177afdfb215e75b8315259ef8bdd0a1ea032e1'
            '8762c01fab8cca37fe0994d308a07e56ff5988ef82304ae67676e96d4619fa6d'
            'db411b01a5896283fdaf1cf30733d41e9740320a3f422b23ee8b376b8a5e8930'
            '1827e974d83d452c8a07bf1a6a1593d214f9a9fe61d3dba8a072c2b1c42673d2'
            '12de7fe29e482e6f0edfd48123c468a309b69d3cca1be4a773c1b96ef6697d22'
            '5d0faf58c6c9e58d709ec2e136bdd576ebd4c0f7d630bef5a05bf188dd482579'
            '2cab3863f3e21a8f8e83b3f86743c57c3f37bf086cc01ebf4573c218df229655'
            '47b6485d9a31eba9589d3ea295239411fc5ae71972cf2e5b94172290d8c12186'
            '5b9a5d0c5c81960d981d01febe201689794b58bb835b2cadadfbdda42b74f47f'
            '0867b5cb21a0765fd7b76d3724fc8a258bedbba974b6e4dbd62348f6ce7d9cee'
            '81cc1547d62933e04aed15c57b9e93101e546298b1fef5f63a6b1469471acebe'
            'dd20963020f83e30497ebeccdeace10e98b74ebffa5847de334eeaaae80f5046'
            'de7a2748545b2b5d0082c09373c14d9ee41110dfa5e30a3be02e3500c2a8118c'
            '7c913c3b58001d3534b1f1828e920ca61707b545c228714420237af51f2ec77b'
            '1fbf26545a49ce297434fa2c39217361cdd90285b2c5ff04c505008037ede6c5'
            '85669071475af9e4ca74cb15c1f277dadd5ea7b3050f443712da77230a4aa488'
            'b4b4f1c20891d1b104354dd574dda80d2f3c5e4f49c76f361c058ffb5b973fd4'
            '4fd244250dad9949dffad6a42b702384c1b1197297f87ffe80cb45496c29cb25'
            'f440d27364ad757ea3cf36454a590f0329f8a6e29f630aa497705840f72e214a'
            '75b4f9c09aeaa34f14677ccf8dffe30d786b12235eaf4a0cd9654eaa14e63bbb'
            '5756ce78a788e58f6986640f4699bdb0672742e264b8702997ef5e7feadfc6db'
            'f3008b53ec36dba2d71640d8605f6cbf4c5951beadb62f1b614eeefd74d7bdb2'
            'e61dca5045bc9dc281106d37966b832d10e1b2092e88375228fbfb478f57677a'
            '5e7549f6f4d1f5a2f414f9d7c5a28e8079196084942a9d3e95c074cfcc984977'
            '71e4fae21123107f00b5e08f0345591f41c61aa918d3e3680c025ce3a78a8a64'
            '9a1eb034d4a142be9686835d47ebe1998d8f618436756c89b4521fa1a7f13e0f'
            'ab6409a7a582ef65bd44519bc56b06eb796c450468a88c7d4fdd67f972488b1b'
            'b10fed04277d5808998c5db0ed3147dd003dc74ff548218fe75d6eda985d68c0'
            'd1b2e2db347114ccb13ca9c8aaff65e7180cb722f4dc46c82bc5df248edebe63'
            '1e8d4ddba087aeac79c54acee0f37b4ee5d2c7f43f064b2c8cf29d668f798e3f'
            '6579c78554b1f1e97a6a439b4287cd542747208774af4070b6d116456e575429'
            '0ad556c65afca9688ea495106c632d7e479e60e4e2241007a7ef4120f65b27a0'
            '217791179fcf7d522ed8065b4cf49fb9097522b936a8852901dde0702ea90954'
            '9a0fd7b40032514b83ec200cd7aeffccf835889c4b86c012e1b9f50fffbfd1a2'
            '8b7be40de00645ca42ee5c7079bf7d7531de75ecdff97a30914d5d604d7efb58'
            '7352643e67f651d322b2443e25f7b6ab30a667e3dde6fc2688cb75c24ef0ae84')

pkgname=($pkgbase $pkgbase-headers)
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done

# vim:set ts=8 sts=2 sw=2 et:
