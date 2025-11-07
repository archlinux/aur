# Maintainer: Erica Marigold <hi@devcomp.xyz>

pkgname=rojo
pkgver=7.6.1
pkgrel=1
pkgdesc="[Latest Stable Source] Rojo enables Roblox developers to use professional-grade software engineering tools"
arch=(x86_64 aarch64)
conflicts=(rojo-git rojo-bin)
url="https://rojo.space"
license=(MPL2)
depends=(gcc-libs glibc)
makedepends=(cargo)
options=(!lto)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rojo-rbx/rojo/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e4850203885561aaefd2996766b720a4df19313bad5457b178587e8913bbe2c1')

prepare() {
  cd "rojo-${pkgver}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "rojo-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "rojo-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --locked --verbose
}

package() {
  cd "rojo-${pkgver}"
  install -Dm755 -t ${pkgdir}/usr/bin target/release/rojo
}

