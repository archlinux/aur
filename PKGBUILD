# Maintainer: BrainDamage
# Contributor: xiretza

pkgname=synapse-compress-state
pkgver=0.1.2
pkgrel=1
pkgdesc="A tool to compress some state in a Synapse instance's database "
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/matrix-org/rust-synapse-compress-state"
makedepends=('rust' 'python')
license=('Apache')
source=("${pkgname}-${pkgver}::https://github.com/matrix-org/rust-synapse-compress-state/archive/v${pkgver}.tar.gz")
sha256sums=('e8cd1933545fc4d97e5f68d7da242fba53ab642869937e4fb65f4ba39ddc8fab')

prepare() {
  cd "${srcdir}/rust-${pkgname}-${pkgver}"

  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
	cd "${srcdir}/rust-${pkgname}-${pkgver}"

	cargo build --release --locked

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --workspace --frozen --release --all-features
}

package() {
  cd "${srcdir}/rust-${pkgname}-${pkgver}"

  install -Dm0755 -t "${pkgdir}/usr/bin/" 'target/release/synapse_compress_state'
  install -Dm0755 -t "${pkgdir}/usr/bin/" 'target/release/synapse_auto_compressor'
}
