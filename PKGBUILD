# Maintainer: chadsr <git at ross dot ch>

pkgname=forgecode
pkgver=2.13.21 # renovate: datasource=github-releases depName=antinomyhq/forgecode
pkgrel=2
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
b2sums=('3a1c4a36e640f03202401e155d7195c4a566d45e0ac1a4c7db83f0c807c39b941ad0520f78a12cb21c91c1b4661a137e5ba4a81d5a7d3f39b1f21f6467136beb')
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
