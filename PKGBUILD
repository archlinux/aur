# Maintainer: Erica Marigold <hi@devcomp.xyz>

pkgname=rojo
pkgver=7.5.0
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
sha256sums=('9d19317b4957ad4eaeaf6621589ce5f85988bf15d99b256b2074165efd85b4e4')

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

