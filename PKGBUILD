# Maintainer: Lauri Gustafsson <lauri dot gustafsson at iki dot fi>
# Maintainer: Benjamin Brienen <benjamin dot brienen at outlook dot com>
pkgname=wgsl-analyzer
_pkgver=2025-10-01
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
sha256sums=('92cb42ec50ed995d9b89f06dc77c9f40242c7874ef1c31ba84eff622d604d79c')

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
