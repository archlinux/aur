## Kernel Series
_kernser=5.10

pkgbase=linux-studio-lts
pkgver=5.10.48
pkgrel=1
pkgdesc='Linux Studio Optimized (LTS)'
url="https://cdn.kernel.org/pub/linux/kernel/v${pkgver%%.*}.x/"
arch=(x86_64)
license=(GPL2)
makedepends=(
  bc kmod libelf pahole cpio perl tar xz
  xmlto python-sphinx python-sphinx_rtd_theme graphviz imagemagick
  git
)
options=('!strip')
_srcname=linux-${pkgver}
source=(
  https://cdn.kernel.org/pub/linux/kernel/v${pkgver%%.*}.x/${_srcname}.tar.{xz,sign}
  "git+https://github.com/Frogging-Family/linux-tkg.git"
  "git+https://github.com/graysky2/kernel_compiler_patch.git"
)
validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
)
# https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
sha256sums=('dbd1193480e1b85928d8dcdd7507365381aafe09810ce3d28677d6f4e722c25e'
            'SKIP'
            'SKIP'
            'SKIP')

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
  cd $_srcname

  echo "Setting version..."
  scripts/setlocalversion --save-scmversion
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "${pkgbase#linux}" > localversion.20-pkgname

  ## Apply the 0001-add-sysctl-to-disallow-unprivileged-CLONE_NEWUSER patch
  msg2 "Apply The 0001-add-sysctl-to-disallow-unprivileged-CLONE_NEWUSER Patch..."
  patch -Np1 < "${srcdir}/linux-tkg/linux-tkg-patches/${_kernser}/0001-add-sysctl-to-disallow-unprivileged-CLONE_NEWUSER-by.patch"

  ## Apply the Clear Linux patch
  msg2 "Apply The Clear Linux Patch..."
  patch -Np1 < "${srcdir}/linux-tkg/linux-tkg-patches/${_kernser}/0002-clear-patches.patch"

  ## Apply the 0003-glitched-base.patch
  msg2 "Apply The 0003-glitched-base.patch..."
  patch -Np1 < "${srcdir}/linux-tkg/linux-tkg-patches/${_kernser}/0003-glitched-base.patch"

  ## Apply the TKG glitched CFS scheduler patch
  msg2 "Apply The TKG Glitched CFS Scheduler Patch..."
  patch -Np1 < "${srcdir}/linux-tkg/linux-tkg-patches/${_kernser}/0003-glitched-cfs.patch"

  ## Apply the TKG glitched CFS scheduler additions patch
  msg2 "Apply The TKG Glitched CFS Scheduler Additions Patch..."
  patch -Np1 < "${srcdir}/linux-tkg/linux-tkg-patches/${_kernser}/0003-glitched-cfs-additions.patch"

  ## Apply the 0006-add-acs-overrides_iommu.patch
  msg2 "Apply The 0006-add-acs-overrides_iommu.patch..."
  patch -Np1 < "${srcdir}/linux-tkg/linux-tkg-patches/${_kernser}/0006-add-acs-overrides_iommu.patch"

  ## Apply Fsync patch
  msg2 "Apply Fsync Patch..."
  patch -Np1 < "${srcdir}/linux-tkg/linux-tkg-patches/${_kernser}/0007-v${_kernser}-fsync.patch"

  ## Apply Futex2 Loader patch
  msg2 "Apply Futex2 Loader Patch..."
  patch -Np1 < "${srcdir}/linux-tkg/linux-tkg-patches/${_kernser}/0007-v${_kernser}-futex2_interface.patch"

  ## Apply TKG misc additions patch
  msg2 "Apply TKG misc additions patch"
  patch -Np1 < "${srcdir}/linux-tkg/linux-tkg-patches/${_kernser}/0012-misc-additions.patch"

  ## Apply GCC kernel optimizations patch
  msg2 "Apply GCC kernel optimizations patch"
  patch -Np1 < "${srcdir}/kernel_compiler_patch/more-uarches-for-kernel-5.8+.patch"

  ## Use TKG Kernel Config
  cp "${srcdir}/linux-tkg/linux-tkg-config/${_kernser}/config.x86_64" "${srcdir}/${_srcname}/config.x86_64"

  ## Creating New Config
  msg2 "Setting config..."
  cp config.x86_64 .config
  make olddefconfig

  ## Customize Kernel Settings
  make nconfig

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
  replaces=(wireguard-lts)

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

pkgname=("$pkgbase" "$pkgbase-headers")
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done

# vim:set ts=8 sts=2 sw=2 et:
