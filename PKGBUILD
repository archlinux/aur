# Maintainer: tarball <bootctl@gmail.com>

pkgname=netbird-bin
pkgver=0.21.2
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
sha256sums_i686=('eac32c3465b383b76603c593b4a60b3e784e0f36ec39ac6634d272a687b59391')
sha256sums_x86_64=('d2747c625accb14536d1caf3f15043e31c0c786633608636f0206bda81f27caa')
sha256sums_aarch64=('76ff2af7d75c03519a84504be604ca90e28645219d515b7cc27b60db7b5d9f26')
sha256sums_armv6h=('b14873dfc7d8cf4f24041303cd68f7331264ff4a25f201a4d6bb8d2d962866fe')

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
