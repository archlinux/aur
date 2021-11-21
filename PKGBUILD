# Maintainer: Nicolas Stalder <n+archlinux@stalder.io>
# Helpful suggestions by Foxboron
pkgname=solo2-cli
pkgver=0.0.7
pkgrel=1
pkgdesc='Solo 2 CLI'
arch=('x86_64')
url="https://github.com/solokeys/solo2-cli"
license=(Apache MIT)
# we only need `libudev.so`, during build we also need `pkgconfig/udev/.pc`
depends=(systemd-libs ccid)
# note we do not need Arch `hidapi` package here, it's a git submodule of Rust hidapi
makedepends=(cargo git systemd)
source=(
	"$pkgname.tar.gz::https://github.com/solokeys/solo2-cli/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
    "2596b50a04f59645630fdca1bf3a95dd8e8475c47a5d4ed61c885d5421e330b5"
)

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release --frozen --all-features
}

check() {
  cd "${pkgname}-${pkgver}"
  # make sure shared libs work
  target/release/solo2 --version
  cargo test --release --all-features
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 target/release/solo2 "$pkgdir/usr/bin/solo2"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgnamefull/LICENSE-MIT"

  # completions
  install -Dm644 target/release/_solo2 -t "$pkgdir/usr/share/zsh/site-functions"
  install -Dm644 target/release/solo2.bash "$pkgdir/usr/share/bash-completion/completions/solo2"

  # udev rule
  install -Dm644 70-solo2.rules -t "$pkgdir/usr/lib/udev/rules.d"
}
