# Maintainer: Shohei Maruyama <cheat.sc.linux@outlook.com>

pkgname='turbo'
pkgver=1.10.16
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
makedepends=('cargo-nightly' 'protobuf' 'protoc-gen-go' 'protoc-gen-go-grpc' 'go<2:1.21.0' 'capnproto')
sha256sums=(
	'34de25efee42db87763b10f8d6631f22cdec15a0439808a12d58d643abcfa1dc'
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
