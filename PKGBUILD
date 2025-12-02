# Maintainer: Erica Marigold <hi@devcomp.xyz>

pkgname=rojo
pkgver=7.7.0_rc.1
_upstreamver="${pkgver//_/-}"
pkgrel=1
pkgdesc="[Latest Stable Source] Rojo enables Roblox developers to use professional-grade software engineering tools"
arch=(x86_64 aarch64)
conflicts=(rojo-git rojo-bin)
url="https://rojo.space"
license=(MPL2)
depends=(gcc-libs glibc)
makedepends=(cargo)
options=(!lto)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rojo-rbx/rojo/archive/refs/tags/v${_upstreamver}.tar.gz")
sha256sums=('b536db0443aaa64d2b8aaa30ca55edd3b6e975989d9eac306d920bb33c339603')

prepare() {
  cd "rojo-${_upstreamver}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "rojo-${_upstreamver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "rojo-${_upstreamver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --locked --verbose
}

package() {
  cd "rojo-${_upstreamver}"
  install -Dm755 -t ${pkgdir}/usr/bin target/release/rojo
}

