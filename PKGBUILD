# Maintainer: Oliver Nordbjerg <hi@notbjerg.me>
# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname=reth
pkgver=v1.9.3
pkgrel=1
pkgdesc="A fast implementation of the Ethereum protocol in Rust"
arch=('x86_64')
url="https://github.com/paradigmxyz/reth"
license=('MIT' 'APACHE')
makedepends=('git' 'cargo' 'clang')
source=("git+https://github.com/paradigmxyz/reth.git#tag=${pkgver}")
b2sums=('34b0e2aa7d60c4259eb1685cd57e1834474a3cb1e8a3caa5d0091b8defd764c99e733ebde8adfc451079d7e3eff6c005b0d4f1a8181dd0c2d6d3bc3c01854330')

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
