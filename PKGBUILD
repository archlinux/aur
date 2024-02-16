# Maintainer: Shohei Maruyama <cheat.sc.linux@outlook.com>

pkgname='turbo'
pkgver=1.12.4
pkgrel=2
pkgdesc='Incremental bundler and build system optimized for JavaScript and TypeScript, written in Rust – including Turbopack and Turborepo.'
arch=('x86_64')
url='https://turbo.build'
license=('MPL')
provides=('turbopack' 'turborepo')
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/vercel/turbo/archive/refs/tags/v${pkgver}.tar.gz"
)
makedepends=('cargo-nightly' 'protobuf' 'capnproto' 'clang' 'lld')
sha256sums=(
	'8a0d51816a9daf55f6e35f13d7cc2e6da6de28afa24a26c3ee6af2ec06a7c0c4'
)

prepare() {
	cd "${pkgname}-${pkgver}"

	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "${pkgname}-${pkgver}"

	export CARGO_TARGET_DIR=target
	export RUSTFLAGS='-Clinker-plugin-lto -Clinker=clang -Clink-arg=-fuse-ld=lld'
	export CC=clang
	cargo build --frozen --release -p turbo
}

package() {
	cd "${pkgname}-${pkgver}"

	install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
	install -Dm0755 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
