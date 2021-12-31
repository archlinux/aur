## --- Menu Config

## Look inside 'choose-gcc-optimization.sh' to choose your microarchitecture
## Valid numbers between: 0 to 99
## Default is: 0 => generic
## Good option if your package is for one machine: 98 (Intel native) or 99 (AMD native)
_microarchitecture=0

## --- PKGBUILD

## Major kernel version
_major=5.15
## Minor kernel version
_minor=12

pkgbase=linux-multimedia
#pkgver=${_major}
pkgver=${_major}.${_minor}
pkgrel=1
pkgdesc='Linux Multimedia Optimized'
url="https://www.kernel.org/"
arch=(x86_64)
license=(GPL2)
makedepends=(
  bc kmod libelf pahole cpio perl tar xz
  xmlto python-sphinx python-sphinx_rtd_theme graphviz imagemagick
  git
)
options=('!strip')
_srcname=linux-$pkgver
source=(
  https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-${pkgver}.tar.{xz,sign}
  "git+https://github.com/Frogging-Family/linux-tkg.git"
  "git+https://github.com/graysky2/kernel_compiler_patch.git"
  "choose-gcc-optimization.sh"
)
validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
  'A2FF3A36AAA56654109064AB19802F8B0D70FC30'  # Jan Alexander Steffens (heftig)
)
sha256sums=('7de919772b62647591527e904e3b3583783381a29d812404f58a222484e751a0'
            'SKIP'
            'SKIP'
            'SKIP'
            '1ac18cad2578df4a70f9346f7c6fccbb62f042a0ee0594817fdef9f2704904ee')

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
  cd $_srcname

  echo "Setting version..."
  scripts/setlocalversion --save-scmversion
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "${pkgbase#linux}" > localversion.20-pkgname
  
  ## --- Patches
  
  ### Apply patches
  msg2 "Apply Linux TKG Patches..."
  patch -Np1 < ${srcdir}/linux-tkg/linux-tkg-patches/${_major}/0001-add-sysctl-to-disallow-unprivileged-CLONE_NEWUSER-by.patch
  patch -Np1 < ${srcdir}/linux-tkg/linux-tkg-patches/${_major}/0001-mm-Support-soft-dirty-flag-reset-for-VA-range.patch
  patch -Np1 < ${srcdir}/linux-tkg/linux-tkg-patches/${_major}/0002-clear-patches.patch
  patch -Np1 < ${srcdir}/linux-tkg/linux-tkg-patches/${_major}/0002-mm-Support-soft-dirty-flag-read-with-reset.patch
  patch -Np1 < ${srcdir}/linux-tkg/linux-tkg-patches/${_major}/0003-glitched-base.patch
  patch -Np1 < ${srcdir}/linux-tkg/linux-tkg-patches/${_major}/0003-glitched-cfs.patch
  patch -Np1 < ${srcdir}/linux-tkg/linux-tkg-patches/${_major}/0003-glitched-cfs-additions.patch
  patch -Np1 < ${srcdir}/linux-tkg/linux-tkg-patches/${_major}/0006-add-acs-overrides_iommu.patch
  patch -Np1 < ${srcdir}/linux-tkg/linux-tkg-patches/${_major}/0007-v${_major}-fsync1_via_futex_waitv.patch
  patch -Np1 < ${srcdir}/linux-tkg/linux-tkg-patches/${_major}/0007-v${_major}-futex_waitv.patch
  patch -Np1 < ${srcdir}/linux-tkg/linux-tkg-patches/${_major}/0007-v${_major}-winesync.patch
  patch -Np1 < ${srcdir}/linux-tkg/linux-tkg-patches/${_major}/0012-misc-additions.patch

  msg2 "Apply GCC Optimization Patch..."
  patch -Np1 < ${srcdir}/kernel_compiler_patch/more-uarches-for-kernel-5.15+.patch

  ### Setting config
  echo "Setting config..."
  cp ${srcdir}/linux-tkg/linux-tkg-config/${_major}/config.x86_64 .config
  make olddefconfig

  ## --- Configs And Tweaks
  
  # Let's user choose microarchitecture optimization in GCC
  sh ${srcdir}/choose-gcc-optimization.sh $_microarchitecture

  ### Configure Kernel Compression
  msg2 "Setting ZSTD Compression Globally..."
  scripts/config --enable CONFIG_KERNEL_ZSTD

  msg2 "Setting ZSTD Compression Level Globally..."
  scripts/config --set-val CONFIG_KERNEL_ZSTD_LEVEL 19
  scripts/config --disable CONFIG_KERNEL_ZSTD_LEVEL_ULTRA

  ### Configure Kernel Module Compression
  msg2 "Setting ZSTD Compression For Modules..."
  scripts/config --enable CONFIG_MODULE_COMPRESS_ZSTD

  msg2 "Setting ZSTD Compression Level For Modules..."
  scripts/config --set-val CONFIG_MODULE_COMPRESS_ZSTD_LEVEL 19
  scripts/config --disable CONFIG_MODULE_COMPRESS_ZSTD_ULTRA

  ## Optimize Kernel for Performance Using (GCC -O3)
  msg2 "Setting Up A GCC -O3 Optimized Kernel"
  scripts/config --disable CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE
  scripts/config --enable CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3

  ### Disable NUMA Support
  msg2 "Disable NUMA..."
  scripts/config --disable CONFIG_NUMA

  ### Protect Operations Under Memory Pressure
  msg2 "Setting memory pressure to a higher value..."
  scripts/config --set-val CONFIG_CLEAN_LOW_KBYTES 524288

  ### Set performance as default governor
  msg2 "Setting performance governor..."
  scripts/config --enable CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE
  scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL
  scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE
  scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE
  scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND
  scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE

  ### Set tickrate to 1000HZ
  msg2 "Setting tick rate to 1000HZ..."
  scripts/config --disable CONFIG_HZ_300
  scripts/config --enable CONFIG_HZ_1000
  scripts/config --set-val CONFIG_HZ 1000

  ### Enable Fsync Support
  msg2 "Enable Fsync support..."
  scripts/config --enable CONFIG_FUTEX
  scripts/config --enable CONFIG_FUTEX_PI

  ### Enable Futex 2 (Fsync 2) Support
  msg2 "Enable Futex2 support..."
  scripts/config --enable CONFIG_FUTEX2
  
  ### Enable The New NTFS3 Kernel Driver
  msg2 "Enabling The New NTFS3 Kernel Driver"
  scripts/config --module CONFIG_NTFS_FS
  scripts/config --disable CONFIG_NTFS_DEBUG
  scripts/config --enable CONFIG_NTFS_RW
  scripts/config --module CONFIG_NTFS3_FS
  scripts/config --enable CONFIG_NTFS3_64BIT_CLUSTER
  scripts/config --enable CONFIG_NTFS3_LZX_XPRESS
  scripts/config --enable CONFIG_NTFS3_FS_POSIX_ACL
  
  ### Enable Full Tickless Timer
  msg2 "Enabling Full Tickless..."
  scripts/config --disable CONFIG_HZ_PERIODIC
  scripts/config --disable CONFIG_NO_HZ_IDLE
  scripts/config --enable CONFIG_NO_HZ_FULL
  scripts/config --disable CONFIG_NO_HZ
  scripts/config --disable CONFIG_NO_HZ_COMMON
  
  ### Enable Preemptation
  msg2 "Enable PREEMPT..."
  scripts/config --disable CONFIG_PREEMPT_NONE
  scripts/config --disable CONFIG_PREEMPT_VOLUNTARY
  scripts/config --enable CONFIG_PREEMPT
  scripts/config --enable CONFIG_PREEMPT_COUNT
  scripts/config --enable CONFIG_PREEMPTION
  scripts/config --enable CONFIG_PREEMPT_DYNAMIC

  ### Disable Kernel Debugging
  msg2 "Disable Kernel Debugging For Smaller Builds"
  scripts/config --disable CONFIG_CONTEXT_TRACKING
  scripts/config --disable CONFIG_CONTEXT_TRACKING_FORCE
  scripts/config --disable CONFIG_DEBUG_KERNEL
  scripts/config --disable CONFIG_DEBUG_INFO
  scripts/config --disable CONFIG_ENABLE_MUST_CHECK
  scripts/config --disable CONFIG_UNUSED_SYMBOLS
  scripts/config --disable CONFIG_DEBUG_FS
  scripts/config --disable CONFIG_DEBUG_SECTION_MISMATCH
  scripts/config --disable CONFIG_DEBUG_FORCE_WEAK_PER_CPU
  scripts/config --disable CONFIG_DEBUG_MEMORY_INIT
  scripts/config --disable CONFIG_KGDB
  scripts/config --disable CONFIG_FUNCTION_TRACER
  scripts/config --disable CONFIG_STACK_TRACER
  
  ### Use Nconfig to customize compile options
  #msg2 "Enabling Ncurses Config Menu..."
  #make nconfig

  make -s kernelrelease > version
  echo "Prepared $pkgbase version $(<version)"
}

build() {
  cd $_srcname
  make -j$(nproc) all
}

_package() {
  pkgdesc="The $pkgdesc kernel and modules"
  depends=(coreutils kmod initramfs)
  optdepends=('crda: to set the correct wireless channels of your country'
              'linux-firmware: firmware images needed for some devices')
  provides=(VIRTUALBOX-GUEST-MODULES WIREGUARD-MODULE)
  replaces=(virtualbox-guest-modules-arch wireguard-arch)

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
  depends=(pahole)

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

pkgname=("$pkgbase" "$pkgbase-headers")
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done

# vim:set ts=8 sts=2 sw=2 et:
