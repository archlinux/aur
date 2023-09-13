# Maintainer: Shohei Maruyama <cheat.sc.linux@outlook.com>

pkgname='turbo'
pkgver=1.10.13
pkgrel=2
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
makedepends=('cargo-nightly' 'protobuf' 'protoc-gen-go' 'protoc-gen-go-grpc' 'go<2:1.21.0')
sha256sums=(
	'dc7a30babcaef9df8f0afca1ccc27488df5f2fc90d0f99969a546e10ca394c06'
	'0f964842bccf99f1e3d6c342c61517a0c96665bc226d8155e5cc8d8676cf0837'
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
	install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/go-${pkgname}"
	install -Dm0755 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
