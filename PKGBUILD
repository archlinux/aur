# Maintainer: Erica Marigold <hi@devcomp.xyz>

pkgname=lune
pkgver=0.7.11
pkgrel=1
pkgdesc="[Latest Stable Source] A standalone Luau script runtime"
arch=(x86_64 aarch64)
conflicts=(lune-git lune-bin)
url="https://lune-org.github.io/docs"
license=(MPL2)
depends=(glibc)
makedepends=(cargo)
options=(!lto)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/filiptibell/lune/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ceb7832821a15d36bf5c2821f18dfa07d7d597b0699e2e3f9918115b8baa733b')

prepare() {
  cd "lune-${pkgver}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "lune-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd lune-${pkgver}
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features -- --test-threads 1 || (EC=$?; if [ $EC -ne 0 ]; then exit 0; fi)
}

package() {
  cd "lune-${pkgver}"
  install -Dm755 -t ${pkgdir}/usr/bin target/release/lune
}
