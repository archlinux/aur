# Maintainer: Sematre <sematre at gmx dot de>
pkgname=firecracker-guest-kernel
pkgver=6.18.62.127.178
pkgrel=1
pkgdesc='Linux guest kernel for Firecracker microVMs'
url='https://github.com/firecracker-microvm/firecracker/blob/main/docs/kernel-policy.md'
arch=(
  x86_64
)
license=(GPL-2.0-only)
makedepends=(
  bc
  libelf
  openssl
  perl
)
options=(
  !debug
  !strip
)
# Amazon Linux microVM kernel source, configured with the guest config
# fragments of a Firecracker release (see resources/rebuild.sh upstream).
_kver=${pkgver%.*.*}
_alrel=${pkgver#"$_kver".}
_series=${_kver%.*}
_altag=kernel$_series-$_kver-$_alrel.amzn2023
_srcname=linux-$_altag
_fcver=1.18.0
_fcconfigs=https://raw.githubusercontent.com/firecracker-microvm/firecracker/v$_fcver/resources/guest_configs
source=(
  "$_altag.tar.gz::https://github.com/amazonlinux/linux/archive/refs/tags/$_altag.tar.gz"
  "firecracker-$_fcver-microvm-kernel-ci-x86_64-$_series.config::$_fcconfigs/microvm-kernel-ci-x86_64-$_series.config"
  "firecracker-$_fcver-ci.config::$_fcconfigs/ci.config"
  "firecracker-$_fcver-nvme.config::$_fcconfigs/nvme.config"
  "firecracker-$_fcver-efi.config::$_fcconfigs/efi.config"
)
sha256sums=('b7109e283717d0a068fb5d2b7596e2825c011ea1293d0db652fb72980ae8fb36'
            'ba22401a0c7292a4c024ebcd10a562d4a1f1bfd2faed671406d3b159c0cf5215'
            '6ce47107d9fb695a873ffc4733a1d8e1b4941c4f272e20dac4bf163dfb77f47e'
            '4bdf0432753742401ad07fee1bb62478be8066434b84aedc4150766a7ff1eecd'
            'ef237613d79df5f9df03ff0cb873a43c9558245081824568c35b074d44d3ebd6')

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgname
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
  cd $_srcname

  # Same as upstream rebuild.sh: concatenate the fragments (later ones win)
  # and let olddefconfig resolve the rest.
  awk 1 ../firecracker-$_fcver-{microvm-kernel-ci-$CARCH-$_series,ci,nvme,efi}.config > .config
  make olddefconfig
}

build() {
  cd $_srcname
  make vmlinux
}

package() {
  cd $_srcname

  # Deliberately not /boot or /usr/lib/modules/*/vmlinuz: GRUB and the
  # mkinitcpio hook would pick it up as a kernel for the host.
  local dest="$pkgdir/usr/lib/firecracker/kernels"
  install -Dm644 vmlinux "$dest/vmlinux-$_series"
  install -Dm644 .config "$dest/vmlinux-$_series.config"
}
