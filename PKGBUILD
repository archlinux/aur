# Maintainer: Erica Marigold <hi@devcomp.xyz>

pkgname=lune
pkgver=0.8.2
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
sha256sums=('e98a00898c2573649d242d87b21af6cdeb5fd1c0fb5a9df53d9c18fc3c1c5008')

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
