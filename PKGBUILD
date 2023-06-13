# Maintainer: tarball <bootctl@gmail.com>

pkgname=netbird-bin
pkgver=0.21.3
pkgrel=1
pkgdesc='A WireGuard-based mesh network that connects your devices into a single private network'
url='https://netbird.io'
arch=(i686 x86_64 aarch64 armv6h)
license=(BSD)

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
            'ae5938e98c84a2dd4324208389b0a6cdf9a24cf3b66d1001a0b137e008da33ec')
sha256sums_i686=('ecf3e2d7192ce9e4b2db03f768f30b2a5522a41e7241104cc12643e6844c2335')
sha256sums_x86_64=('e27b3e9620326b82898ef548d6af23ed750d05ae4a1f06564552ea79d084fe53')
sha256sums_aarch64=('dae15c03ae96f4f481331af5e2f3890efa5607eb69628ab43f9fe160f9e6f494')
sha256sums_armv6h=('9e355c1f9d3310d29ffa65566002edcc58b6d4c3b310ac7969a97d19b66f3cf8')

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
      "$pkgdir/usr/share/fish/completions/netbird.fish"

    install -Dm644 completion.zsh \
      "$pkgdir/usr/share/zsh/site-functions/_netbird"
  fi
}
