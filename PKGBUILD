# Maintainer: Shohei Maruyama <cheat.sc.linux@outlook.com>

pkgname='turbo'
pkgver=1.8.8
pkgrel=1
pkgdesc='Incremental bundler and build system optimized for JavaScript and TypeScript, written in Rust – including Turbopack and Turborepo.'
arch=('x86_64')
url='https://turbo.build'
license=('MPL')
provides=('turbopack' 'turborepo')
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/vercel/turbo/archive/refs/tags/v${pkgver}.tar.gz"
	"0001-cli-internal-ffi-Fix-missing-library.patch"
)
depends=('libgit2')
makedepends=('cargo-nightly' 'protobuf' 'protoc-gen-go' 'protoc-gen-go-grpc' 'go')
sha256sums=(
	'2ec05cfe7cff136b892975cad2b5fbf905be863dd9aef2f0867f87725c37396d'
	'f7f5457c69c0ca72c7b1660b70a45157dd4a3a8b64781b2c9ffa57ed7bcd08c9'
)

prepare() {
	cd "${pkgname}-${pkgver}"

	patch -p1 -i ../0001-cli-internal-ffi-Fix-missing-library.patch
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "${pkgname}-${pkgver}"

	export CARGO_TARGET_DIR=target
	cargo build --frozen --release -p turborepo-ffi
	cargo build --frozen --release -p turbo
}

package() {
	cd "${pkgname}-${pkgver}"

	install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
	install -Dm0755 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
