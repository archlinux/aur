# Maintainer: Nicolas Stalder <n+archlinux@stalder.io>
pkgname=solo2-cli
pkgver=0.0.6
_pkgver=0.0.6
pkgrel=1
pkgdesc='Solo 2 CLI'
arch=('x86_64')
url="https://github.com/solokeys/solo2-cli"
license=(Apache MIT)
# we only need `libudev.so`, during build we also need `pkgconfig/udev/.pc`
depends=(systemd-libs)
# note we do not need Arch `hidapi` package here, it's a git submodule of Rust hidapi
makedepends=(cargo git systemd)
conflicts=(solo2-cli-git)
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/solokeys/solo2-cli/archive/refs/tags/v${_pkgver}.tar.gz"
)
sha256sums=(
    "083014e217779f190e49e4839ae99781c1559690a3ee5d96cbdcb1489e663049"
)

build() {
  cd "${pkgname}-${_pkgver}"
  cargo build --release --locked
}

check() {
  cd "${pkgname}-${_pkgver}"
  # make sure shared libs work
  target/release/solo2 --version
  cargo test --release
}

package() {
  cd "${pkgname}-${_pkgver}"
  install -Dm755 target/release/solo2 "$pkgdir/usr/bin/solo2"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgnamefull/LICENSE-MIT"

  # completions
  install -Dm644 target/release/_solo2 -t $pkgdir/usr/share/zsh/site-functions
  install -Dm644 target/release/solo2.bash $pkgdir/usr/share/bash-completion/completions/solo2

  # udev rule
  install -Dm644 70-solo2.rules -t $pkgdir/usr/lib/udev/rules.d
}
