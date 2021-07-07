## Kernel Series
_kernser=5.13

pkgbase=linux-studio
pkgver=5.13
pkgrel=1
pkgdesc='Linux Studio Optimized'
_srctag=v${pkgver%.*}-${pkgver##*.}
url="https://git.archlinux.org/linux.git/log/?h=$_srctag"
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
  https://cdn.kernel.org/pub/linux/kernel/v${pkgver%%.*}.x/${_srcname}.tar.{xz,sign}
  "git+https://github.com/Frogging-Family/linux-tkg.git"
  "git+https://github.com/graysky2/kernel_compiler_patch.git"
)
validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
  'A2FF3A36AAA56654109064AB19802F8B0D70FC30'  # Jan Alexander Steffens (heftig)
)

sha256sums=('3f6baa97f37518439f51df2e4f3d65a822ca5ff016aa8e60d2cc53b95a6c89d9'
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

  ## Apply the 0001-mm-Support-soft-dirty-flag-reset-for-VA-range.patch
  msg2 "Apply The 0001-mm-Support-soft-dirty-flag-reset-for-VA-range.patch..."
  patch -Np1 < "${srcdir}/linux-tkg/linux-tkg-patches/${_kernser}/0001-mm-Support-soft-dirty-flag-reset-for-VA-range.patch"

  ## Apply the Clear Linux patch
  msg2 "Apply The Clear Linux Patch..."
  patch -Np1 < "${srcdir}/linux-tkg/linux-tkg-patches/${_kernser}/0002-clear-patches.patch"

  ## Apply the 0002-mm-Support-soft-dirty-flag-read-with-reset.patch
  msg2 "Apply The 0002-mm-Support-soft-dirty-flag-read-with-reset.patch..."
  patch -Np1 < "${srcdir}/linux-tkg/linux-tkg-patches/${_kernser}/0002-mm-Support-soft-dirty-flag-read-with-reset.patch"

  ## Apply the CacULE scheduler patch
  msg2 "Apply The CacULE Scheduler Patch..."
  patch -Np1 < "${srcdir}/linux-tkg/linux-tkg-patches/${_kernser}/0003-cacule-${_kernser}.patch"

  ## Apply the 0003-glitched-base.patch
  msg2 "Apply The 0003-glitched-base.patch..."
  patch -Np1 < "${srcdir}/linux-tkg/linux-tkg-patches/${_kernser}/0003-glitched-base.patch"

  ## Apply Futex2 Loader patch
  msg2 "Apply Futex2 Loader Patch..."
  patch -Np1 < "${srcdir}/linux-tkg/linux-tkg-patches/${_kernser}/0007-v${_kernser}-futex2_interface.patch"

  ## Apply Wine Esync patch
  msg2 "Apply Wine Esync Patch..."
  patch -Np1 < "${srcdir}/linux-tkg/linux-tkg-patches/${_kernser}/0007-v${_kernser}-winesync.patch"

  ## Apply the 0009-glitched-bmq.patch
  msg2 "Apply The 0009-glitched-bmq.patch..."
  patch -Np1 < "${srcdir}/linux-tkg/linux-tkg-patches/${_kernser}/0009-glitched-bmq.patch"

  ## Apply the 0009-glitched-ondemand-bmq.patch
  msg2 "Apply The 0009-glitched-ondemand-bmq.patch..."
  patch -Np1 < "${srcdir}/linux-tkg/linux-tkg-patches/${_kernser}/0009-glitched-ondemand-bmq.patch"

  ## Apply TKG misc additions patch
  msg2 "Apply TKG misc additions patch"
  patch -Np1 < "${srcdir}/linux-tkg/linux-tkg-patches/${_kernser}/0012-misc-additions.patch"

  ## Apply GCC kernel optimizations patch
  msg2 "Apply GCC kernel optimizations patch"
  patch -Np1 < "${srcdir}/kernel_compiler_patch/more-uarches-for-kernel-5.8+.patch"

  ## Obtain the running system's kernel config
  zcat /proc/config.gz > kernconfig

  ## Creating New Config
  msg2 "Setting config..."
  cp kernconfig .config
  make olddefconfig

  ## Customize Kernel Settings, COMMENT OUT IF NOT UNNEEDED!
  make nconfig

  make -s kernelrelease > version
  msg2 "Prepared $pkgbase version $(<version)"
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
