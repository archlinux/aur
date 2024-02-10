# Maintainer: Erica Marigold <hi@devcomp.xyz>

pkgname=rojo
pkgver=7.4.0
pkgrel=1
pkgdesc="[Latest Stable Source] Rojo enables Roblox developers to use professional-grade software engineering tools"
arch=(x86_64 aarch64)
conflicts=(rojo-git rojo-bin)
url="https://rojo.space"
license=(MPL2)
depends=(gcc glibc)
makedepends=(cargo)
options=(!lto)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rojo-rbx/rojo/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6c3ca53a8cee478c7b44c6a92e6b93e5a16cb5d621caa2b33ac5c77a3959aad6')

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

