# Maintainer: tarball <bootctl@gmail.com>

pkgname=netbird-bin
pkgver=0.83.0
pkgrel=1
pkgdesc='WireGuard-based mesh network'
url='https://netbird.io'
arch=(i686 x86_64 aarch64 armv6h)
license=(BSD-3-Clause)

provides=(netbird wiretrustee)
conflicts=(netbird)
depends=(glibc)
optdepends=('resolvconf: Private DNS')
replaces=(wiretrustee-bin)

_base_raw="https://raw.githubusercontent.com/netbirdio/netbird/refs/tags/v$pkgver"
_base_bin="https://github.com/netbirdio/netbird/releases/download/v$pkgver/netbird_${pkgver}_linux"

source=("$_base_raw/release_files/systemd/env"
        "$_base_raw/release_files/systemd/netbird@.service")
source_i686=("${_base_bin}_386.tar.gz")
source_x86_64=("${_base_bin}_amd64.tar.gz")
source_aarch64=("${_base_bin}_arm64.tar.gz")
source_armv6h=("${_base_bin}_armv6.tar.gz")

sha256sums=('7c6f8f6ec95969fc555e7abc55f7f775196446d315c5080adab4a1a6f0b173e3'
            '8e8e5423a14df61b5b78daac0761ec9be5e43e60d3fcb7ffe6994e57c1f92036')
sha256sums_i686=('77b7e9519a87b4ca1dc8624a50a9a1924e8a5f33f92146fc10012b225135c9e9')
sha256sums_x86_64=('50911d0c9482b91523169245241d3453edbed5d0cc23ff64003ca95a7e5e2e96')
sha256sums_aarch64=('9450ef96f3ede090efe175e08f7c53a356bc7ada454e7c755f99050bd1ebebb7')
sha256sums_armv6h=('89a4ac6d57c5c31421645b39ce6483f0632b5f3fe85690a5b5ac829ea63efeb6')

prepare() {
  # try to generate completions if the binary is runnable on current CPU
  local shell
  for shell in bash fish zsh; do
    ./netbird completion $shell >completion.$shell 2>/dev/null || rm -f completion.$shell
  done
}

package() {
  # binary
  install -Dm755 netbird "$pkgdir/usr/bin/netbird"

  # config directory
  install -Ddm755 -o root -g root "$pkgdir/etc/netbird"

  # environment file
  install -Dm644 env "$pkgdir/etc/default/netbird"

  # systemd unit
  install -Dm644 netbird@.service \
    "$pkgdir/usr/lib/systemd/system/netbird@.service"

  # license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/netbird/LICENSE"

  # shell completions
  if [[ -f completion.bash ]]; then
    install -Dm644 completion.bash \
      "$pkgdir/usr/share/bash-completion/completions/netbird"

    install -Dm644 completion.fish \
      "$pkgdir/usr/share/fish/vendor_completions.d/netbird.fish"

    install -Dm644 completion.zsh \
      "$pkgdir/usr/share/zsh/site-functions/_netbird"
  fi
}
