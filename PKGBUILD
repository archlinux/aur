# Maintainer: Shohei Maruyama <cheat.sc.linux@outlook.com>

pkgname='turbo'
pkgver=1.8.3
pkgrel=1
pkgdesc='Incremental bundler and build system optimized for JavaScript and TypeScript, written in Rust – including Turbopack and Turborepo.'
arch=('x86_64')
url='https://turbo.build'
license=('MPL')
provides=('turbopack' 'turborepo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/vercel/turbo/archive/refs/tags/v${pkgver}.tar.gz")
depends=()
makedepends=('cargo-nightly' 'protobuf' 'protoc-gen-go' 'protoc-gen-go-grpc' 'go')
sha256sums=('7cc8b9e9d3bd8387c09c925583127bd6899e4dc0cb271cd00d11d00aa1306aab')

prepare() {
	cd "${pkgname}-${pkgver}"

	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "${pkgname}-${pkgver}"

	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --manifest-path crates/turborepo/Cargo.toml
	cargo build --frozen --release --manifest-path crates/turbopack/Cargo.toml
}

package() {
	cd "${pkgname}-${pkgver}"

	install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
	install -Dm0755 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
