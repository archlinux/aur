# Maintainer: Oliver Nordbjerg <hi@notbjerg.me>
# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname=reth
pkgver=1.11.3
pkgrel=1
pkgdesc="A fast implementation of the Ethereum protocol in Rust"
arch=('x86_64')
url="https://github.com/paradigmxyz/reth"
license=('MIT' 'APACHE')
makedepends=('git' 'cargo' 'clang')
source=("git+https://github.com/paradigmxyz/reth.git#tag=${pkgver}")
b2sums=('beb38fbf19dd9f14788587b9f7a1014e4ffe5d81f9d9a2ac16e8d4a1ab69a591bdff6e46aa758a8f4bc75eaaff8ca41437de29899c2135157c70ab49462d584e')

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
	
	# Respect MAKEFLAGS for parallel compilation
	export CARGO_BUILD_JOBS="${MAKEFLAGS:-j$(nproc)}"
	export CARGO_BUILD_JOBS="${CARGO_BUILD_JOBS#-j}"

	cargo build --bin reth --frozen --release --features jemalloc,asm-keccak
}

package() {
	cd "${srcdir}/${pkgname}"

	install -Dm755 "${srcdir}/target/release/reth" "${pkgdir}/usr/bin/reth"
	install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
	install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
