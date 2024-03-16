## Look inside 'choose-gcc-optimization.sh' to choose your microarchitecture
## Valid numbers between: 0 to 99
## Default is: 0 => generic
## Good option if your package is for one machine: 98 (Intel native) or 99 (AMD native)
_microarchitecture=0

## Major kernel version
_major=6.8
## Minor kernel version
_minor=1

## PKGBUILD ##

pkgbase=linux-multimedia
#pkgver=${_major}
pkgver=${_major}.${_minor}
pkgrel=1
pkgdesc='Linux Multimedia Optimized'
url="https://www.kernel.org/"
arch=(x86_64)
license=(GPL2)
makedepends=('bc' 'cpio' 'gettext' 'libelf' 'pahole' 'perl' 'python' 'tar' 'xz' 'git')
options=('!strip')
_srcname=linux-${pkgver}
source=(
  https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-${pkgver}.tar.{xz,sign}
  "git+https://github.com/graysky2/kernel_compiler_patch.git"
  "git+https://github.com/Frogging-Family/linux-tkg.git"
  "choose-gcc-optimization.sh"
)
validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
  '83BC8889351B5DEBBB68416EB8AC08600F108CDF'  # Jan Alexander Steffens (heftig)
)

sha256sums=('8d0c8936e3140a0fbdf511ad7a9f21121598f3656743898f47bb9052d37cff68'
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
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "${pkgbase#linux}" > localversion.20-pkgname

  make defconfig
  make -s kernelrelease > version
  make mrproper
  
  ## --- Patches
  
  ### Apply patches
  msg2 "Apply 0001-add-sysctl-to-disallow-unprivileged-CLONE_NEWUSER-by.patch..."
  patch -Np1 < ${srcdir}/linux-tkg/linux-tkg-patches/${_major}/0001-add-sysctl-to-disallow-unprivileged-CLONE_NEWUSER-by.patch

  msg2 "Apply 0002-clear-patches.patch..."
  patch -Np1 < ${srcdir}/linux-tkg/linux-tkg-patches/${_major}/0002-clear-patches.patch

  msg2 "Apply 0003-glitched-base.patch..."
  patch -Np1 < ${srcdir}/linux-tkg/linux-tkg-patches/${_major}/0003-glitched-base.patch

  msg2 "Apply 0003-glitched-cfs.patch..."
  patch -Np1 < ${srcdir}/linux-tkg/linux-tkg-patches/${_major}/0003-glitched-cfs.patch

  msg2 "Apply 0003-glitched-eevdf-additions.patch..."
  patch -Np1 < ${srcdir}/linux-tkg/linux-tkg-patches/${_major}/0003-glitched-eevdf-additions.patch

  msg2 "Apply 0006-add-acs-overrides_iommu.patch..."
  patch -Np1 < ${srcdir}/linux-tkg/linux-tkg-patches/${_major}/0006-add-acs-overrides_iommu.patch

  msg2 "Apply 0007-v${_major}-fsync1_via_futex_waitv.patch..."
  patch -Np1 < ${srcdir}/linux-tkg/linux-tkg-patches/${_major}/0007-v${_major}-fsync1_via_futex_waitv.patch

  #msg2 "Apply 0007-v${_major}-winesync.patch..."
  #patch -Np1 < ${srcdir}/linux-tkg/linux-tkg-patches/${_major}/0007-v${_major}-winesync.patch

  msg2 "Apply 0012-misc-additions.patch..."
  patch -Np1 < ${srcdir}/linux-tkg/linux-tkg-patches/${_major}/0012-misc-additions.patch

  msg2 "Apply 0013-optimize_harder_O3.patch..."
  patch -Np1 < ${srcdir}/linux-tkg/linux-tkg-patches/${_major}/0013-optimize_harder_O3.patch

  msg2 "Apply 0014-OpenRGB.patch..."
  patch -Np1 < ${srcdir}/linux-tkg/linux-tkg-patches/${_major}/0014-OpenRGB.patch

  msg2 "Apply GCC Optimization Patch..."
  patch -Np1 < ${srcdir}/kernel_compiler_patch/more-uarches-for-kernel-6.8-rc4+.patch

  ### Setting config
  echo "Setting config..."
  cp ${srcdir}/linux-tkg/linux-tkg-config/${_major}/config.x86_64 .config
  make olddefconfig
  diff -u ../config .config || :

  # Let's user choose microarchitecture optimization in GCC
  sh ${srcdir}/choose-gcc-optimization.sh $_microarchitecture

  ## --- Configs And Tweaks
  
  msg2 "Disable old dynticks..."
  scripts/config --disable CONFIG_HZ_PERIODIC
  scripts/config --disable CONFIG_NO_HZ
  scripts/config --disable CONFIG_NO_HZ_IDLE
  scripts/config --disable CONFIG_CONTEXT_TRACKING
  scripts/config --disable CONFIG_CONTEXT_TRACKING_FORCE
  scripts/config --enable CONFIG_NO_HZ_COMMON
  scripts/config --enable CONFIG_NO_HZ_FULL
  scripts/config --enable CONFIG_NO_HZ_FULL_NODEF

  msg2 "Set up a GCC -O3 optimized kernel..."
  scripts/config --disable CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE
  scripts/config --enable CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3

  msg2 "Set tick rate to 1000HZ..."
  scripts/config --disable CONFIG_HZ_300
  scripts/config --enable CONFIG_HZ_1000
  scripts/config --set-val CONFIG_HZ 1000

  msg2 "Set default CPU governor to performance..."
  scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL
  scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE
  scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE
  scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND
  scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE
  scripts/config --enable CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE

  msg2 "Disable kernel debugging for smaller builds..."
  scripts/config --disable CONFIG_DEBUG_KERNEL
  scripts/config --disable CONFIG_DEBUG_INFO
  scripts/config --disable CONFIG_UNUSED_SYMBOLS
  scripts/config --disable CONFIG_DEBUG_FS
  scripts/config --disable CONFIG_KGDB
  scripts/config --disable CONFIG_FUNCTION_TRACER
  scripts/config --disable CONFIG_STACK_TRACER
  
  ### Use Nconfig to customize compile options
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
  depends=(
    'coreutils'
    'initramfs'
    'kmod'
  )
  optdepends=(
    'wireless-regdb: to set the correct wireless channels of your country'
    'linux-firmware: firmware images needed for some devices'
  )
  provides=(
    'KSMBD-MODULE'
    'VIRTUALBOX-GUEST-MODULES'
    'WIREGUARD-MODULE'
  )

  cd $_srcname
  local modulesdir="$pkgdir/usr/lib/modules/$(<version)"

  echo "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

  echo "Installing modules..."
  ZSTD_CLEVEL=19 make INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 \
    DEPMOD=/doesnt/exist modules_install  # Suppress depmod

  # remove build link
  rm "$modulesdir"/build
}

_package-headers() {
  pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"
  depends=('pahole')

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

  echo "Stripping vmlinux..."
  strip -v $STRIP_STATIC "$builddir/vmlinux"

  echo "Adding symlink..."
  mkdir -p "$pkgdir/usr/src"
  ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase"
}

pkgname=(
  "$pkgbase"
  "$pkgbase-headers"
)
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done

# vim:set ts=8 sts=2 sw=2 et:
