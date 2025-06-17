# Maintainer: tarball <bootctl@gmail.com>

pkgname=netbird-bin
pkgver=0.47.2
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

source=(
  'environment'
  'netbird@.service'
)
sha256sums=('128e36e1f814a12886f3122a1809a404be17f81481275b6624e66937941f5269'
            '5941598ba3698d9a47d06eceb17b6a92d5b37197108b1bb130d02841c8455d05')
sha256sums_i686=('0e3c3d2847d5e0e03263f05d15de1d97580a2fa7aee515b5bfc9c6ffffa4fd61')
sha256sums_x86_64=('dd4e250c3c05b696e0188e5a97514860a86c10ef10a18df74827a5676434b541')
sha256sums_aarch64=('a04af66e0729fc40a7f51f930d09c5abe4ce580fc0101f69a2119bb63cd1f99e')
sha256sums_armv6h=('b08abfe1225843228db140d9aee610d47107ffd003392358af7ad150532aa1ac')

_base_url="https://github.com/netbirdio/netbird/releases/download/v$pkgver/netbird_${pkgver}_linux"

source_i686=("${_base_url}_386.tar.gz")
source_x86_64=("${_base_url}_amd64.tar.gz")
source_aarch64=("${_base_url}_arm64.tar.gz")
source_armv6h=("${_base_url}_armv6.tar.gz")

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
  install -Dm644 environment "$pkgdir/etc/default/netbird"

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
