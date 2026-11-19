# Maintainer: robertfoster
# Based on the Arch Linux 'linux' package by Jan Alexander Steffens (heftig)

pkgbase=linux-multikernel
pkgname=(
  "$pkgbase"
  "$pkgbase-headers"
)
# OBS's PKGBUILD parser keeps trailing comments in values: keep these above
# renovate: datasource=github-tags depName=multikernel/linux
_mkver=7.0-mk5
# renovate: datasource=github-tags depName=multikernel/daxfs
_daxfsver=0.1.0
pkgver=${_mkver//-/.}
pkgrel=2
pkgdesc='Linux with Multikernel support'
url='https://multikernel.io'
arch=(x86_64)
license=(GPL-2.0-only)
makedepends=(
  bc
  binutils
  cpio
  gettext
  libelf
  pahole
  perl
  python
  tar
  xz
  zstd
)
options=(
  !debug
  !strip
)
_srcname=linux-$_mkver
source=(
  "$pkgbase-$_mkver.tar.gz::https://github.com/multikernel/linux/archive/refs/tags/v$_mkver.tar.gz"
  "daxfs-$_daxfsver.tar.gz::https://github.com/multikernel/daxfs/archive/refs/tags/v$_daxfsver.tar.gz"
)
# Arch Linux 'linux' config, adapted in prepare()
source_x86_64=(config.x86_64)

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
  cd $_srcname

  echo "Setting version..."
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "${pkgbase#linux}" > localversion.20-pkgname

  # The in-tree fs/daxfs reads image format v1; kerf writes the v8 format of
  # standalone daxfs. Swap in its sources, built in so spawned kernels can
  # mount rootfstype=daxfs without an initrd.
  echo "Importing daxfs $_daxfsver..."
  rm fs/daxfs/*.[ch]
  cp ../daxfs-$_daxfsver/daxfs/*.[ch] ../daxfs-$_daxfsver/include/*.h fs/daxfs/
  sed -i 's/^daxfs-y :=.*/daxfs-y := super.o inode.o dir.o file.o dax_mem.o validate.o pcache.o overlay.o/' \
    fs/daxfs/Makefile

  echo "Setting config..."
  cp ../config.$CARCH .config
  # Multikernel host/spawn support (needs OF for the device-tree resource model);
  # Rust disabled: Arch's config targets a newer kernel/toolchain pairing
  scripts/config \
    -e OF \
    -e MEMORY_HOTPLUG \
    -e MEMORY_HOTREMOVE \
    -e CONTIG_ALLOC \
    -e MULTIKERNEL \
    -e MKTTY \
    -m VSOCKETS \
    -m MULTIKERNEL_VSOCKETS \
    -e DAXFS \
    -d RUST
  make olddefconfig
  diff -u ../config.$CARCH .config || :

  local _opt
  for _opt in MULTIKERNEL MKTTY DAXFS; do
    [[ $(scripts/config -s $_opt) = y ]] || { echo "CONFIG_$_opt not enabled"; return 1; }
  done

  make -s kernelrelease > version
  echo "Prepared $pkgbase version $(<version)"
}

build() {
  cd $_srcname
  make all
}

_package() {
  pkgdesc="The $pkgdesc kernel and modules"
  depends=(
    coreutils
    initramfs
    kmod
  )
  optdepends=(
    "$pkgbase-headers: headers and scripts for building modules"
    'kerf: manage multikernel instances'
    'linux-firmware: firmware images needed for some devices'
    'wireless-regdb: to set the correct wireless channels of your country'
  )
  # daxfs is built in
  conflicts=(daxfs-dkms)
  replaces=(daxfs-dkms)

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
    DEPMOD=/doesnt/exist modules_install # Suppress depmod

  # remove build link
  rm "$modulesdir"/build
}

_package-headers() {
  pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"
  depends=(pahole)

  cd $_srcname
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"
  local karch=x86

  echo "Installing build files..."
  install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map \
    localversion* version vmlinux
  install -Dt "$builddir/kernel" -m644 kernel/Makefile
  install -Dt "$builddir/arch/$karch" -m644 arch/$karch/Makefile
  cp -t "$builddir" -a scripts
  ln -srt "$builddir" "$builddir/scripts/gdb/vmlinux-gdb.py"

  if [[ $(scripts/config -s CONFIG_HAVE_STACK_VALIDATION) = y ]]; then
    install -Dt "$builddir/tools/objtool" tools/objtool/objtool
  fi

  if [[ $(scripts/config -s CONFIG_DEBUG_INFO_BTF_MODULES) = y ]]; then
    install -Dt "$builddir/tools/bpf/resolve_btfids" tools/bpf/resolve_btfids/resolve_btfids
  fi

  echo "Installing headers..."
  cp -t "$builddir" -a include
  cp -t "$builddir/arch/$karch" -a arch/$karch/include
  install -Dt "$builddir/arch/$karch/kernel" -m644 arch/$karch/kernel/asm-offsets.s

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

  echo "Installing unstripped VDSO..."
  make INSTALL_MOD_PATH="$pkgdir/usr" vdso_install \
    link= # Suppress build-id symlinks

  echo "Removing unneeded architectures..."
  local arch
  for arch in "$builddir"/arch/*/; do
    [[ $arch = */$karch/ ]] && continue
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
      application/x-sharedlib\;*) # Libraries (.so)
        strip -v $STRIP_SHARED "$file" ;;
      application/x-archive\;*) # Libraries (.a)
        strip -v $STRIP_STATIC "$file" ;;
      application/x-executable\;*) # Binaries
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

for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done
sha256sums=('7edf4d86e95dd22e0ec2993125fbb6d9b845b67a6f5f8a10a7cf8d7758a874a3'
            'd9e0f9b5aee1f1a707f9b09bac9222a21ab34afebf10eedbbb1554ed69d970ed')
sha256sums_x86_64=('75366b057ddfafeb2c02a902aebdcbeb36ddcd56de74c82b1eadf4fac308555a')
