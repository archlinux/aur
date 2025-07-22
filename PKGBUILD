# Maintainer: tarball <bootctl@gmail.com>

pkgname=netbird-bin
pkgver=0.51.2
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
sha256sums_i686=('50d4a3ab8dafa171e32a9a9f6a5efa5972b72efc9a0064c2085fd1a68f1452cb')
sha256sums_x86_64=('14052f26cfaef796429b5e4e956feaf7063a604048a3f6f6ed88cab79cd67353')
sha256sums_aarch64=('81794e420c12520a7a5b707e41dd94a76ab268ebd4115cb3c4b2fcfccf4703a9')
sha256sums_armv6h=('14e619ae29acbd7b47b3a7122bc8890f5bee2680f0f71d71198875c3d53b060f')

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
