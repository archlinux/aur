# Maintainer: Lauri Gustafsson <lauri at gustafla dot space>
pkgname=wgsl-analyzer
pkgver=0.8.1
pkgrel=1
pkgdesc='A language server for the WGSL shading language'
url='https://github.com/wgsl-analyzer/wgsl-analyzer'
source=("wgsl_analyzer-${pkgver}.tar.gz::https://github.com/wgsl-analyzer/wgsl-analyzer/archive/refs/tags/v${pkgver}.tar.gz")
arch=('x86_64' 'aarch64')
license=('MIT' 'APACHE')
makedepends=('cargo')
conflicts=('wgsl-analyzer')
provides=('wgsl-analyzer')
sha256sums=('c0efadc1d0a0b8417c292c2bc85eced6861c56037b868648e5ddaff73bbaad25')

prepare() {
  cd "wgsl-analyzer-${pkgver}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "wgsl-analyzer-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p wgsl_analyzer
}

check() {
  cd "wgsl-analyzer-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features -p wgsl_analyzer
}

package() {
  cd "wgsl-analyzer-${pkgver}"
  install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/wgsl_analyzer"
}
