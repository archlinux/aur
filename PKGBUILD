# Maintainer: tarball <bootctl@gmail.com>

pkgname=netbird-bin
pkgver=0.25.1
pkgrel=1
pkgdesc='WireGuard-based mesh network'
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
sha256sums_i686=('7263e8b4c1800d302e9c067e05414b886699bdf9734cf15e9b39aab24feb0192')
sha256sums_x86_64=('3cc4869c62644fec9f503b41392a5d0fa2badf7ba37bc4f85cc743c15c7cf9b1')
sha256sums_aarch64=('329404eecb96ca1bb62af94d7c52655d64f04ea8034694ab41310b986774f627')
sha256sums_armv6h=('750428dfdba17861e8ac3163e9322a90ccd232bb49f8ab9833aa586c73b0daa1')

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
