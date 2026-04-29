# Maintainer: tarball <bootctl@gmail.com>

pkgname=netbird-bin
pkgver=0.70.3
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
sha256sums_i686=('eb460eb3a9c21648c2e51ab97220281eb57a73afea24b3ee8ddbd26cf3967dbf')
sha256sums_x86_64=('63f8faf2ba0d07a783c96556e79ded20af17d4e2da88845bbbf4bfd62f6a011c')
sha256sums_aarch64=('63753f148d58fefefa1aeb97d8ce2963a3d1f55f03161c7fc3dcdcedefb99969')
sha256sums_armv6h=('53367293dc2dbcc83092db032911a0e82b8d4cf4a1163a517b4c9ff4485005c9')

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
