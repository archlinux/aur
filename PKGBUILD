# Maintainer: Lauri Gustafsson <lauri dot gustafsson at iki dot fi>
# Maintainer: Benjamin Brienen <benjamin dot brienen at outlook dot com>
pkgname=wgsl-analyzer
_pkgver=2026-03-13
pkgver=${_pkgver//-}
pkgrel=1
pkgdesc='A language server for the WGSL shading language'
url='https://github.com/wgsl-analyzer/wgsl-analyzer'
source=("wgsl-analyzer-${pkgver}.tar.gz::https://github.com/wgsl-analyzer/wgsl-analyzer/archive/refs/tags/${_pkgver}.tar.gz")
arch=('x86_64' 'aarch64')
license=('MIT OR Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
conflicts=('wgsl-analyzer')
provides=('wgsl-analyzer')
sha256sums=('252e207284215cf2efde31c4417ef818854e6302925fa77d4be58cefba18ebe0')

prepare() {
  cd "wgsl-analyzer-${_pkgver}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "wgsl-analyzer-${_pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p wgsl-analyzer
}

check() {
  cd "wgsl-analyzer-${_pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features -p wgsl-analyzer
}

package() {
  cd "wgsl-analyzer-${_pkgver}"
  install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/wgsl-analyzer"
}
