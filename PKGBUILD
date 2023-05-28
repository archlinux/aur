# Maintainer: Lauri Gustafsson <lauri at gustafla dot space>
pkgname=wgsl-analyzer
pkgver=0.7.0
pkgrel=1
pkgdesc='A language server for the WGSL shading language'
url='https://github.com/wgsl-analyzer/wgsl-analyzer'
source=("wgsl_analyzer-${pkgver}.tar.gz::https://github.com/wgsl-analyzer/wgsl-analyzer/archive/refs/tags/v${pkgver}.tar.gz")
arch=('x86_64' 'aarch64')
license=('MIT' 'APACHE')
makedepends=('cargo')
conflicts=('wgsl-analyzer')
provides=('wgsl-analyzer')
sha256sums=('d4adadde0f558f109a527f722bf4db164f5a4a74f49ccdf7062a4830937d4261')

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
