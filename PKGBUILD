# Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgbase=linux-wsl2-waydroid
pkgver=6.6.114.1
pkgrel=1
pkgdesc='Linux WSL2'
url='https://github.com/microsoft/WSL2-Linux-Kernel'
arch=(x86_64)
license=(GPL-2.0-only)
makedepends=(
  bc
  cpio
  gettext
  libelf
  pahole
  perl
  python
  rust
  rust-bindgen
  rust-src
  tar
  xz

  # modules.vhdx
  qemu-img
)
install='linux-wsl2-waydroid.install'
options=(
  !debug
  !strip
)
_srcname=linux-msft-wsl-${pkgver}
source=(
  "${_srcname}::git+https://github.com/microsoft/WSL2-Linux-Kernel#tag=${_srcname}"
  patch.diff
  gen_modules_vhdx.sh
)
validpgpkeys=(
  ABAF11C65A2970B130ABE3C479BE3E4300411886  # Linus Torvalds
  647F28654894E3BD457199BE38DBBDC86092693E  # Greg Kroah-Hartman
  83BC8889351B5DEBBB68416EB8AC08600F108CDF  # Jan Alexander Steffens (heftig)
)
# https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
sha256sums=(
  'SKIP'
  '210c22692f71aef7a91dc6c5687f2a72182f9efc8d77b87e3be86020910baea2'
  '5d0cc65e1c7ec377bd68fce21f130047c58ca57bb3cd5c1350b4d29b26e2b022'
)
b2sums=(
  'SKIP'
  '92c9c8f54912488bc9d63b32efc2b34a5911a3695cfc00f85806aab8018bac98dafb7e52f40bda2aa8831ae27575cabfc3a8b3d978fa7e1d68b9602a97f3ee92'
  '3703d2ffd57f80af85847930e59126d377cad89b54291ebae1c0c0a2ba9f2193f19bf54b81579c62527fdc1fa7c430b9b0cab9bba83bf72b6f89afe0b06f7dea'
)

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
  cd $_srcname

  echo "Patching config..."
  git apply ${srcdir}/patch.diff

  echo "Setting config..."
  cp arch/x86/configs/config-wsl .config
  make olddefconfig

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
    kmod
  )
  optdepends=(
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
  local tmpmodulesdir="$srcdir/usr/lib/modules/$(<version)"
  local modulesdir="$pkgdir/usr/lib/modules/$(<version)"

  echo "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"

  echo "Installing modules..."
  mkdir -p $tmpmodulesdir
  ZSTD_CLEVEL=19 make INSTALL_MOD_PATH="$srcdir/usr" INSTALL_MOD_STRIP=1 modules_install

  # Create custom modules.vhdx for WSL2
  echo "Creating modules.vhdx image..."
  ${srcdir}/gen_modules_vhdx.sh "$srcdir/usr" $(make -s kernelrelease) modules.vhdx
  install -Dm644 "modules.vhdx" "$modulesdir/modules.vhdx"

  # remove build link
  rm "$tmpmodulesdir"/build
  rm "modules.vhdx"
}

pkgname=(
  "$pkgbase"
)
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done

# vim:set ts=8 sts=2 sw=2 et:
