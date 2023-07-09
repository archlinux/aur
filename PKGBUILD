#_     _            _                                _____
#| |__ | | __ _  ___| | ___ __ ___   ___   ___  _ __ |___ /
#| '_ \| |/ _` |/ __| |/ / '_ ` _ \ / _ \ / _ \| '_ \  |_ \
#| |_) | | (_| | (__|   <| | | | | | (_) | (_) | | | |___) |
#|_.__/|_|\__,_|\___|_|\_\_| |_| |_|\___/ \___/|_| |_|____/

#Maintainer: blackmoon3 <https://github.com/blacksky3>
#Credits: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
#Credits: Andreas Radke <andyrtr@archlinux.org>

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

pkgbase=linux-zen-pds
pkgver=6.4.0.zen1
pkgrel=1
major=6.4
commit=e63a6b30adfd9c0b870daa2a14300a893b69cf17
versiontag=6.4-zen1
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

archlinuxpath=https://gitlab.archlinux.org/archlinux/packaging/packages/linux-zen/-/raw/$commit
patchpath=https://raw.githubusercontent.com/blacksky3/patches/main/$major

source=(https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-$major.tar.xz
        https://github.com/zen-kernel/zen-kernel/releases/download/v$versiontag/v$versiontag.patch.xz
        ${archlinuxpath}/config)

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare(){
  cd ${srcdir}/linux-$major

  # Apply Zen patch
  msg "Apply Zen patch v$versiontag"
  patch -Np1 < "$srcdir/v$versiontag.patch"

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
  # Copy "${srcdir}"/config to "${srcdir}"/linux-${major}/.config
  msg "Copy "${srcdir}"/config to "${srcdir}"/linux-$major/.config"
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
  cd ${srcdir}/linux-$major

  msg "make -j$(nproc) all..."
  make ARCH=${ARCH} ${BUILD_FLAGS[*]} -j$(nproc) all
}

_package(){
  pkgdesc="The Zen kernel and modules - PDS enabled"
  depends=(coreutils initramfs kmod)
  optdepends=('wireless-regdb: to set the correct wireless channels of your country'
              'linux-firmware: firmware images needed for some devices')
  provides=(VIRTUALBOX-GUEST-MODULES WIREGUARD-MODULE KSMBD-MODULE VHBA-MODULE UKSMD-BUILTIN)

  cd ${srcdir}/linux-$major

  local kernver="$(<version)"
  local modulesdir="${pkgdir}"/usr/lib/modules/${kernver}

  msg "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

  msg "Installing modules..."
  ZSTD_CLEVEL=19 make ARCH=${ARCH} ${BUILD_FLAGS[*]} INSTALL_MOD_PATH="${pkgdir}"/usr INSTALL_MOD_STRIP=1 -j$(nproc) modules_install

  # remove build and source links
  msg "Remove build dir and source dir..."
  rm -rf "$modulesdir"/{source,build}
}

_package-headers(){
  pkgdesc="Headers and scripts for building modules for the $pkgbase kernel"
  depends=("${pkgbase}" pahole)

  cd ${srcdir}/linux-$major

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
            '72356a9b2482a44e935be0651e374ceb3640e71ba1f2d31dd1ab1986c4c6d9a0'
            'aec310553aa9b98572c25d37dfc33a62f5f853441a91cafc5cb1b8c19d7d9be3')

pkgname=($pkgbase $pkgbase-headers)
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done

# vim:set ts=8 sts=2 sw=2 et:
