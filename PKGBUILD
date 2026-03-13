# Maintainer: Oliver Nordbjerg <hi@notbjerg.me>
# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname=reth
pkgver=1.11.3
pkgrel=2
pkgdesc="A fast implementation of the Ethereum protocol in Rust"
arch=('x86_64')
url="https://github.com/paradigmxyz/reth"
license=('MIT' 'APACHE')
makedepends=('git' 'cargo' 'clang')
source=("git+https://github.com/paradigmxyz/reth.git#tag=v${pkgver}")
b2sums=('e9bc650ba060009dfb01fc1bd86b8f64a6e8962e0cb9778fbea4b3c01dfa7231159de06c015afd7c5808aec9cc1b3a7aed6f85bfa4f7bc343ad8bd8361861507')

prepare() {
	cd "${srcdir}/${pkgname}"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_INCREMENTAL=0
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "${srcdir}/${pkgname}"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR="${srcdir}/target"
	export CARGO_INCREMENTAL=0
	export CARGO_NET_OFFLINE=true
	export CFLAGS="${CFLAGS//-flto=auto/}"
	
	cargo build --bin reth --frozen --release --features jemalloc,asm-keccak
}

package() {
	cd "${srcdir}/${pkgname}"

	install -Dm755 "${srcdir}/target/release/reth" "${pkgdir}/usr/bin/reth"
	install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
	install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
