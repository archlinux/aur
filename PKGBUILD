# Maintainer: Luca Stefani <luca.stefani.ge1@gmail.com>

pkgbase=linux-llvm
pkgver=5.8.5.arch1
pkgrel=1
pkgdesc='Linux'
_srctag=v${pkgver%.*}-${pkgver##*.}
url="https://git.archlinux.org/linux.git/log/?h=$_srctag"
arch=(x86_64)
license=(GPL2)
makedepends=(
  bc kmod libelf pahole
  xmlto python-sphinx python-sphinx_rtd_theme graphviz imagemagick
  git
  clang llvm lld
)
options=('!strip')
_srcname=archlinux-linux
source=(
  "$_srcname::git+https://git.archlinux.org/linux.git#tag=$_srctag"
  config         # the main kernel config file
  sphinx-workaround.patch
  # ZSTD
  0001-lib-prepare-zstd-for-preboot-environment.patch
  0002-lib-add-zstd-support-to-decompress.patch
  0003-init-add-support-for-zstd-compressed-kernel.patch
  0004-usr-add-support-for-zstd-compressed-initramfs.patch
  0005-x86-bump-ZO_z_extra_bytes-margin-for-zstd.patch
  0006-x86-Add-support-for-ZSTD-compressed-kernel.patch
  0007-.gitignore-add-ZSTD-compressed-files.patch
  # HID Nintendo
  0001-HID-nintendo-add-nintendo-switch-controller-driver.patch
  0002-HID-nintendo-add-player-led-support.patch
  0003-HID-nintendo-add-power-supply-support.patch
  0004-HID-nintendo-add-home-led-support.patch
  0005-HID-nintendo-add-rumble-support.patch
  0006-HID-nintendo-improve-subcommand-reliability.patch
  0007-HID-nintendo-send-subcommands-after-receiving-input-.patch
  0008-HID-nintendo-reduce-device-removal-subcommand-errors.patch
  0009-HID-nintendo-patch-hw-version-for-userspace-HID-mapp.patch
  0010-HID-nintendo-set-controller-uniq-to-MAC.patch
  0011-HID-nintendo-add-support-for-charging-grip.patch
  0012-HID-nintendo-add-support-for-reading-user-calibratio.patch
  0013-HID-nintendo-prevent-needless-queueing-of-the-rumble.patch
  0014-HID-nintendo-add-IMU-support.patch
  # CPU
  enable_additional_cpu_optimizations_for_gcc_v10.1+_kernel_v5.8+.patch
)
sha256sums=('SKIP'
            'c761dae2f35885eb52fb93e8df821267453e2cbfe2f98e685437c0e7e0c9f733'
            '8cb21e0b3411327b627a9dd15b8eb773295a0d2782b1a41b2a8839d1b2f5778c'
            '2f0090ec0c9a72e6241bbea05faaef979405119ce8ef669d84dead36c8e2246e'
            '5f21c12f002e71ec5b5db96832b415ce291a7e230fa07b328c21760274e72e9d'
            '3db0e145f2dc29f2d39779bf053a6999bfaff74929e00ab575f2b6e5a327465c'
            'c95ae6fed77db3e212754a6cb98f02642be1d8d319fe9219ddd7c02b0643b3d1'
            '2b558cc58e95343bb2e3cfd96c668b671251c543124176b8687baf12cdf999d5'
            '84c275eb98fb908b742ffe51faa7feb0312550712b0cd729bf72941a2f633a65'
            'f88df9ee297e229792e516ac9fb6f35ddc1aa13c3fdeb9ba15fb4de8b1dcd7c7'
            '7bf881f1a8d64c43c39f54520f30c4927a67bf462d2c1e960b0703132509a71d'
            '90f200daaa7c0c2edfaf5365c0f1836065364e3c24b55ee72a8c39c927d6e70c'
            'dac2eaa04c33739e6e3d59f65c03b324d03204702431866e335f1be05fca0800'
            '5a28934f973c92bc7586882d462da174acc9327c8536e7b5bf3ad48e0338e1bc'
            'b3ed0e211a9d0340987b9d2798ed1cc479c6c238b9957d99206f35689037e907'
            '5076b003c49af19a1e9ed8091b46382fdc51d04d63790f6af2f09b3099973412'
            '06fa906b3592a49de487621854ff39ee4f6c2741c22f28cc6a6b9c5e20621902'
            'ed65c66b9967f590d1575c52664825c278beff54fb7e8226c8751e431095eb00'
            'be3103f49ef7211640b52d5cd43a38509b515dfb597ba92e2f8938ef556e78a7'
            'dd6e7854a72d479862dd772f232b9c440f4588bb8916006e8991c717679d9fdb'
            'a1f1d735bdbed62e0ee3bfed5afa0e4b4c79a9fb0f6e643415f80ef037769ed7'
            'befc88e05cde258f22e2e482fb99bd561fba0509439088ecfcbd46616984d229'
            'f1fad6499fe8b16ad62caf5fffa401678609ec5cffe5274f7b7f6e10b5eb1532'
            '08a4e35d8ab2e7855d51d46f0ad9d38c2c7093ddf6de807673ffafbd15dbc49d'
            '5ab29eb64e57df83b395a29a6a4f89030d142feffbfbf73b3afc6d97a2a7fd12')

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
  cd $_srcname

  echo "Setting version..."
  scripts/setlocalversion --save-scmversion
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "${pkgbase#linux}" > localversion.20-pkgname

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  echo "Setting config..."
  cp ../config .config
  make LLVM=1 -j$(nproc) olddefconfig

  make LLVM=1 -j$(nproc) -s kernelrelease > version
  echo "Prepared $pkgbase version $(<version)"
}

build() {
  cd $_srcname
  make LLVM=1 -j$(nproc) all
  make LLVM=1 -j$(nproc) htmldocs
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
  install -Dm644 "$(make LLVM=1 -j$(nproc) -s image_name)" "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

  echo "Installing modules..."
  make LLVM=1 -j$(nproc) INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 modules_install

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

_package-docs() {
  pkgdesc="Documentation for the $pkgdesc kernel"

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
}

pkgname=("$pkgbase" "$pkgbase-headers" "$pkgbase-docs")
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done

# vim:set ts=8 sts=2 sw=2 et:
