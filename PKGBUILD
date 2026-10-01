# Maintainer: chadsr <git at ross dot ch>

pkgname=forgecode
pkgver=2.14.0 # renovate: datasource=github-releases depName=antinomyhq/forgecode
pkgrel=1
pkgdesc="An AI-powered code assistant CLI tool"
arch=('x86_64' 'aarch64')
url="https://github.com/antinomyhq/forgecode"
license=('Apache-2.0')
provides=('forge')
conflicts=('forge')
depends=(
	'fzf'
	'bat'
	'fd'
)
makedepends=(
	'cargo'
	'protobuf'
	'cmake'
	'clang'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('36e046e26235372d55fd90c1ab1154a65c592fa196907d446841c3b1b2df5a75339f72e869339dbc8f7273aee5137b71c71913d2809e147b421a1fb5307fcce2')
options=(!lto)

prepare() {
	cd "$pkgname-$pkgver"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname-$pkgver"
	export CARGO_TARGET_DIR=target
	APP_VERSION="$pkgver" cargo build --frozen --release
}

check() {
	cd "$pkgname-$pkgver"
	cargo test --frozen --workspace --exclude forge_ci
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/forge"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
