# Maintainer: ShinKouyo <i@0x0f.dev>

# SPDX-FileCopyrightText: Arch Linux contributors
# SPDX-License-Identifier: 0BSD

# shellcheck shell=bash
# shellcheck disable=SC2034,SC2154

pkgbase='linux-sk'
pkgname=("$pkgbase"{,'-headers'})
pkgver=7.1
pkgrel=1
pkgdesc='Linux-libre kernel with BORE scheduler, BBRv3, acpi-call, and cjktty'
arch=(x86_64)
url='https://linux-libre.fsfla.org/'
license=('GPL-2.0-only')
makedepends=(
  bc
  clang
  cpio
  libelf
  libgcc
  lld
  llvm
  openssl
  pahole
  perl
  polly
  python
  rust
  rust-bindgen
  rust-src
  xxhash
  zlib
  zstd
)
options=(
  '!debug'
  '!strip'
)
_srcname="linux-$pkgver"
source=(
  "https://linux-libre.fsfla.org/pub/linux-libre/releases/$pkgver-gnu/linux-libre-$pkgver-gnu.tar.xz"{,'.sign'}
  'https://raw.githubusercontent.com/CachyOS/kernel-patches/52430eeac3404e8f6e32d36384351f5aa075fd35/7.1/sched/0001-bore.patch'
  'https://codeberg.org/shkouyo/gist/raw/commit/bd9947f418b6e80ee66ea84a5303d7c789cad7ea/bbr3-7.1.patch'
  'https://raw.githubusercontent.com/CachyOS/kernel-patches/fcdc4806b62f86b62a61b92c4b7213a1759537e5/7.1/misc/0001-acpi-call.patch'
  'https://raw.githubusercontent.com/Capricornus007/cjktty-patches/e8e3741ea36508cf620d6164e2d66fbb030d5c9b/v7.x/cjktty-7.1.patch'
  'https://raw.githubusercontent.com/Capricornus007/cjktty-patches/b43d618da6d6536338761a5fc7c9c377c318fb9e/cjktty-add-cjk32x32-font-data.patch'
  'https://codeberg.org/shkouyo/gist/raw/commit/ec5ff6782f47fddd06af8ebd73abf7037ff1ae02/cjktty-add-cjk32x32-font-data-fix.patch'
  'https://raw.githubusercontent.com/CachyOS/kernel-patches/fcdc4806b62f86b62a61b92c4b7213a1759537e5/7.1/misc/0001-clang-polly.patch'
  'config'
)
b2sums=(
  'a3a90da13d2f246d9c9778fbc14696bed85e1afcb9a8d2e0097b9a2402b28c8610412fdfeaa27114fa4c64895a7f3b05a4e9fe0ad586a33b2c485a4932b382f7' 'SKIP'
  '90f096c5d6b3ac9b0ce4ba2ba7378a8bc507e15b04672c30f38decac8e544583c12b83083f30d510adf8403acf65e21603cea5736fb1512833d9b90955372ccb'
  '4ef49070fec47fe2ccf52def09b9f290e7cce3cf131a496e14618655c0754b924ddd35c2a7faf0cc3ac7ec8969efe8835c10b2b2aa7fac4cc1dcfbc790a4a1a0'
  'ddaf90fd846e13cb213fb343f9599447d377dd51111cd2cbfbda2334836ba7c6925a28453353017a785163dbd1d5d44f1c7eca036c611a8dcf2cecab7d35c2de'
  'b9d54668b9644ef6925ac9eda4ce14864f7455ea68df13816530eb58250d65a6ebbb7e6b4fcf69fbe84ff05fedf13bab528f36c9a913f693f927128461dd09a7'
  '101996793aeede5e456b23b35c2fd4af5c38fd363473dcdda0bce6e21d110a9f88a67e325b1ebf8efef4a7511f135c4f64ff1fc54b8ef925a5df8d6292ba7678'
  '77e8b8162aba9adc344ba36545a77079a9f11cdd313cec51cdd11d6b1873d0357e2293c3685c3e35e04bd21db10912fcef2b7eee64bc178c073fb84f9c6336df'
  'db6e3815cc7fc09e89ff034f33526f4bc03cd4b4720ff6d50f02fc2cdbca6314b37ba2e2d1098436018f373b62289f82b20500e9c2a7d801f7a2a27f9f0b73d8'
  'b8121572bf2f8805ecf5e26164b80159f4ab811b43702d60ceda1bbaf8d32c2c348a97df119f9af24b211d7a85a5012962c09efe3c8fadbb5c91947589f557fb'
)
validpgpkeys=(
  '474402C8C582DAFBE389C427BCB7CF877E7D47A7' # linux-libre (Alexandre Oliva) <linux-libre+lxoliva@fsfla.org>
)

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

export CC=clang
export LLVM=1
export LD=ld.lld
export LLVM_IAS=1

prepare() {
  patch -Np1 --follow-symlinks < 'cjktty-add-cjk32x32-font-data-fix.patch'

  cd "$_srcname" || exit 1

  echo "Setting version..."
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "${pkgbase#linux}" > localversion.20-pkgname

  patch -Np1 < '../0001-bore.patch'
  patch -Np1 < '../bbr3-7.1.patch'
  patch -Np1 < '../0001-acpi-call.patch'
  patch -Np1 < '../cjktty-7.1.patch'
  patch -Np1 < '../cjktty-add-cjk32x32-font-data.patch'
  patch -Np1 < '../0001-clang-polly.patch'

  echo "Setting config..."
  cp ../config .config
  make olddefconfig
  diff -u ../config .config || :

  make -s kernelrelease > version
  echo "Prepared $pkgbase version $(<version)"
}

build() {
  cd $_srcname || exit 1
  make -j"$(nproc)" all
  make -C tools/bpf/bpftool vmlinux.h feature-clang-bpf-co-re=1
}

_package() {
  pkgdesc="The $pkgbase kernel and modules"
  depends=(
    coreutils
    initramfs
    kmod
  )
  optdepends=(
    "$pkgbase-headers: headers and scripts for building modules"
    'linux-libre-firmware: firmware images needed for some devices'
    'wireless-regdb: to set the correct wireless channels of your country'
  )
  provides=(
    KSMBD-MODULE
    NTSYNC-MODULE
    VIRTUALBOX-GUEST-MODULES
    WIREGUARD-MODULE
  )

  cd $_srcname || exit 1
  local modulesdir="$pkgdir/usr/lib/modules/$(<version)"

  echo "Installing boot image..."
  install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"

  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

  echo "Installing modules..."
  ZSTD_CLEVEL=19 make INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 \
    DEPMOD=/doesnt/exist modules_install

  rm "$modulesdir"/build
}

_package-headers() {
  pkgdesc="Headers and scripts for building modules for the $pkgbase kernel"
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

  cd $_srcname || exit 1
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
  install -Dt "$builddir/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h
  install -Dt "$builddir/drivers/media/usb/dvb-usb" -m644 drivers/media/usb/dvb-usb/*.h
  install -Dt "$builddir/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/*.h
  install -Dt "$builddir/drivers/media/tuners" -m644 drivers/media/tuners/*.h
  install -Dt "$builddir/drivers/iio/common/hid-sensors" -m644 drivers/iio/common/hid-sensors/*.h

  echo "Installing KConfig files..."
  find . -name 'Kconfig*' -exec install -Dm644 {} "$builddir/{}" \;

  echo "Installing Rust files..."
  if [[ $(scripts/config -s CONFIG_RUST) = y ]]; then
    install -Dt "$builddir/rust" -m644 rust/*.rmeta
    install -Dt "$builddir/rust" rust/*.so
  fi

  echo "Installing unstripped VDSO..."
  make INSTALL_MOD_PATH="$pkgdir/usr" vdso_install \
    link=

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
      application/x-sharedlib\;*)
        strip -v $STRIP_SHARED "$file" ;;
      application/x-archive\;*)
        strip -v $STRIP_STATIC "$file" ;;
      application/x-executable\;*)
        strip -v $STRIP_BINARIES "$file" ;;
      application/x-pie-executable\;*)
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

# vim:set sw=2 sts=-1 et:
