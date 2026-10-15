# Maintainer: notfranko_ <notfranko@techlab.cloud>
# Contributor: hypevhs <hackgammavision at gmail dot com>

pkgbase=linux-bsb
pkgver=7.2.10.arch1
pkgrel=1
pkgdesc='Linux kernel with patches to make the Bigscreen Beyond headset work properly'
url='https://github.com/archlinux/linux'
arch=(
  x86_64
)
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
  bigscreen-beyond-kernel.patch
  0001-Change-device-uvc_version-check-on-dwMaxVideoFrameSi.patch
  ps0001-drm-edid-add-non-desktop-quirk-pimax-lgr-headsets.patch
  ps0002-drm-displayid-Ignore-invalid-Pimax-checksums.patch
  amd-bsb-dsc-fix.patch
  $url/releases/download/$_srctag/linux-$_srctag.patch.zst{,.sig}
)
source_x86_64=(config.x86_64)
validpgpkeys=(
  647F28654894E3BD457199BE38DBBDC86092693E  # Greg Kroah-Hartman
  83BC8889351B5DEBBB68416EB8AC08600F108CDF  # Jan Alexander Steffens (heftig)
)
sha256sums=('2feaa70453e91f541be6a5c9078d8168e081af45a3d9718054850538cff2ebf3'
            'SKIP'
            '48893e74f2e7e61464b58262b03783f4516584d234b4f136848d72220cb91ca3'
            '62aa97495d491b6efda27055a0a203d98ec527a8c7d21a168ffa7fd12c08a927'
            'f6842a522091ae40ae89d6f6953814114e3a8cec5c541d6113f42976feb4c212'
            '123b076f296bf357e2a9c220041d5bf0ad4cba01b7242377d235061c437de496'
            '75ccc0f3d8183776cf628d075b81654d390d03a9aea3d04392228fe69a0f7128'
            '8ffe49bd444a895726935c0882cdf6cdae78ddc5181e5e807ae130a754055d68'
            'SKIP')
sha256sums_x86_64=('ecd8c76eb203493e67ba4052e7bc1fa46f51c91566f102172e7a18d7de2dd5eb')
b2sums=('f6fa406d0764f0ab9ed199747420e45c422f1cb1a74e5eff1d488b8ad8aa33660440dab2bf15303638e70a9798574ac49550e0fa03bc7550284028548c34cdce'
        'SKIP'
        'eaaa2675d3ff4b0e9e99fea0a4a5528a4f7a498ebfef333acd1047a53d19221d74415fd0083252f24ccdc9a4a893468f3b3699762b5e87a73c03f40fd8a12929'
        'f2ea744efc628122f96500880717a9bfe03ffdfee30e8027bac44cbc7e0ab2f684dc6a3f9619da8941d1cb45dd80f4e34a022fcfea135baa4174f41fbd10f8eb'
        'f3c8b655bea8147c8120309a72d6fe3456f3b7290a2ed929fe68d7048dfb322b2eb8bd392ba38adbe901ee3473cbdbbae153ee1a92b447653320c0517657448c'
        '8d8229d36aa31e4879adfc457e316f4a3cae2672a3d010d0b8097245ded37c30192a97188f3b3dfc450e511b57b8bd69df3b9ab59e3e6ad36cb23b449ea4e48e'
        '7f5e486f5a51ae2d3daee0b804af1fc4b85d01430e141db1e10727189a102ac6ffe3df2b0c6f5c21a1a14372837dfbd49f8f3d31d8319237b2d8b69def20236b'
        'ba40e6b37149194c8b953ba904666643a1471331d260ec910fa5038d76453bebfa1c0f5acd12607253f590469a5ce27248f93a308ebb94899902ec7b8ed596f1'
        'SKIP')
b2sums_x86_64=('0564ea851810a155cd589bd3a5d74344f16ab2c7c5ea5aa740faaf6776230ccd115474b6164ebd32d89d8615e41d24d2612d649b987f1f2cde58476e5561fe5e')

# https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

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
  cp ../config.$CARCH .config
  make olddefconfig
  diff -u ../config.$CARCH .config || :

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
    "$pkgbase-headers: headers and scripts for building modules"
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
