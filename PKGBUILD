# Maintainer: bencejuhaasz <32618702+bencejuhaasz@users.noreply.github.com>

# linux-sp7: Arch's stock `linux` + the linux-surface patches a Surface Pro 7 needs.
#
#   0001-ipts.patch              IPTS touchscreen/pen (MEI 0x34E4 ID, IOMMU quirk, HID driver)
#   0002-surface-typecover.patch Type Cover backlight off in suspend + tablet-mode switch
#
# Everything else mirrors Arch's linux PKGBUILD. Run ./update.sh before every
# build: it syncs pkgver, config, PGP keys and checksums from Arch's package repo
# and reports any drift between Arch's build/package functions and these.

pkgbase=linux-sp7
pkgver=7.2.9.arch1
pkgrel=1
pkgdesc='Linux (Surface Pro 7)'
url='https://github.com/archlinux/linux'
arch=(x86_64)
license=(GPL-2.0-only)
makedepends=(
  bc
  binutils
  cpio
  gettext
  glibc
  libelf
  libgcc
  openssl
  pahole
  perl
  python
  rust
  rust-bindgen
  rust-src
  tar
  xxhash
  xz
  zlib
  zstd
)
options=(
  !debug
  !strip
)
_srcname=linux-${pkgver%.*}
_srctag=v${pkgver%.*}-${pkgver##*.}
source=(
  https://cdn.kernel.org/pub/linux/kernel/v${pkgver%%.*}.x/${_srcname}.tar.{xz,sign}
  $url/releases/download/$_srctag/linux-$_srctag.patch.zst{,.sig}
  config.x86_64  # Arch's kernel config, synced by update.sh
  0001-ipts.patch
  0002-surface-typecover.patch
)
# BEGIN validpgpkeys (managed by update.sh)
validpgpkeys=(
  ABAF11C65A2970B130ABE3C479BE3E4300411886
  647F28654894E3BD457199BE38DBBDC86092693E
  83BC8889351B5DEBBB68416EB8AC08600F108CDF
)
# END validpgpkeys
# BEGIN checksums (managed by update.sh)
sha256sums=(
  'b4c5dfbe51a364a6c7f03869200f88c8e1f77403539005f14b7fc6bc91b8d8ba'
  'SKIP'
  '95eac21ec3b619945f86b205af0c2dd3eae2d01c79d1bf7da4b180556097ce03'
  'SKIP'
  'SKIP'
  'f18fe1fa7b97a83bdeb500e4ee9340a7bf860eddd51262f3fa52370ad52a213b'
  '0150903e9bfe2fa75e4bc018a8e3c9807cdf2adb2cb6db7abc7f15f194603a0f'
)
b2sums=(
  'c853d45f0df3b713a84695c487b56e44d40da007fb48700be4bf0180c6aa15e7f087ac2d52f1cf7997b4de262aeae5094c772f36297405de1c7b8985a420328b'
  'SKIP'
  '16446f9f4a28f4d372c03e42927637a0e13fc6d921d7535ee8cca9e059c27142980ff85ad6d7518f77008394636d3e0f6afc00251347adc8f2ef6d6939846050'
  'SKIP'
  '59a30b7a9010053f33344e3e2b0b1ea92bbb040179c4630cf5e5d05158c7bb99a7af315184310a622e2a838a4ce3a123d8e81bf6c7887bac47fd9c42d9f18330'
  'bd4a62af04f6d9c6520174265ec8977ee79efbdd9d74a9babb12a3d90748d926225a8c2b61c485fce70227620c58f268452e9ae14cb984d60e2bbbac35c9d648'
  '98e6de8fc6d21d22f8a70b21c7236f107ea7b68072e60bff965eec26430e5598e1b01c6441d91fc3caddffb284e23ca1475bd520e16237af8edfccadb898038e'
)
# END checksums

# Optional: path to a module list (e.g. ~/.config/modprobed.db copied from the
# SP7) to build only those modules via localmodconfig. Much faster build, but
# anything not in the list (a USB device you plug in later, a filesystem you
# mount once) won't exist. Leave empty for Arch's full module set.
_localmodcfg=${_localmodcfg-}

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

# SP7-specific config, applied on top of Arch's config. This is the only
# change to prepare() relative to Arch's PKGBUILD.
_sp7_config() {
  scripts/config --module HID_IPTS

  if [[ -n $_localmodcfg ]]; then
    echo "Running localmodconfig against $_localmodcfg..."
    make LSMOD="$_localmodcfg" localmodconfig </dev/null
  fi

  make olddefconfig
  grep -qx 'CONFIG_HID_IPTS=m' .config \
    || { echo "CONFIG_HID_IPTS did not stick" >&2; return 1; }
}

prepare() {
  cd $_srcname

  echo "Setting version..."
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "${pkgbase#linux}" > localversion.20-pkgname

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  echo "Setting config..."
  cp ../config.x86_64 .config
  _sp7_config
  make olddefconfig
  diff -u ../config.x86_64 .config || :

  make -s kernelrelease > version
  echo "Prepared $pkgbase version $(<version)"
}

build() {
  cd $_srcname
  make all
  make -C tools/bpf/bpftool vmlinux.h feature-clang-bpf-co-re=1
}

_package() {
  pkgdesc="The $pkgdesc kernel and modules"
  depends=(
    coreutils
    initramfs
    kmod
  )
  optdepends=(
    'iptsd: multi-touch and pen support for the IPTS touchscreen'
    'linux-firmware: firmware images needed for some devices'
    'scx-scheds: to use sched-ext schedulers'
    'wireless-regdb: to set the correct wireless channels of your country'
  )
  provides=(
    KSMBD-MODULE
    NTSYNC-MODULE
    VIRTUALBOX-GUEST-MODULES
    WIREGUARD-MODULE
  )
  replaces=(
    virtualbox-guest-modules-arch
    wireguard-arch
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
  depends=(
    binutils
    glibc
    libelf
    libgcc
    openssl
    pahole
    xxhash
    zlib
    zstd
  )
  provides=(LINUX-HEADERS)

  cd $_srcname
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  local karch
  case $CARCH in
    x86_64) karch=x86 ;;
    *) echo "Unknown CARCH $CARCH"; exit 1 ;;
  esac

  echo "Installing build files..."
  install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map \
    localversion.* version vmlinux tools/bpf/bpftool/vmlinux.h
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

  if [[ $(scripts/config -s CONFIG_RUST) = y ]]; then
    echo "Installing Rust files..."
    install -Dt "$builddir/rust" -m644 rust/*.rmeta
    install -Dt "$builddir/rust" rust/*.so
  fi

  echo "Installing unstripped VDSO..."
  make INSTALL_MOD_PATH="$pkgdir/usr" vdso_install \
    link=  # Suppress build-id symlinks

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
