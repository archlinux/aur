# Maintainer: Oliver Nordbjerg <hi@notbjerg.me>
# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname=reth
pkgver=2.2.0
pkgrel=1
pkgdesc="A fast implementation of the Ethereum protocol in Rust"
arch=('x86_64')
url="https://github.com/paradigmxyz/reth"
license=('MIT' 'APACHE')
makedepends=('git' 'cargo' 'clang')
source=("git+https://github.com/paradigmxyz/reth.git#tag=v${pkgver}")
b2sums=('ff6979a96e83d6553a5f8e1aee33828c6e8555c21e3f326b469b1dfed6f1e9dc27c3ea1de158ef5727ab10b91ef814e0f39f9b46b8a6ffdb3d65a585ce7ac068')
options=('!lto' '!strip')

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

	cargo build --bin reth --frozen --release --features jemalloc,asm-keccak
}

package() {
	cd "${srcdir}/${pkgname}"

	install -Dm755 "${srcdir}/target/release/reth" "${pkgdir}/usr/bin/reth"
	install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
	install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
