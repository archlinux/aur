# Maintainer: tarball <bootctl@gmail.com>

pkgname=netbird-bin
pkgver=0.59.0
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
sha256sums_i686=('184c246a23a3b994d5b02a58a98af00a2656ebe2b6f1b8e235899560925a07c3')
sha256sums_x86_64=('6f6ce9b8ff046080bf0ae30c3ee705a5a97627cddab610e9d1e1e740199bf1a8')
sha256sums_aarch64=('c506fd7d9cc76728e66e2fda6bd6db314a30c267be1a615f60d67091ecad4793')
sha256sums_armv6h=('a9cd1c1c76df3988b1949f399614f4c52c19655c4123a9670844b8797c08c5f8')

prepare() {
  # try to generate completions if the binary is runnable on current CPU
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
