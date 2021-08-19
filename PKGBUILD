# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=krankerl
pkgver=0.13.1
pkgrel=2
pkgdesc='A CLI helper to manage, package, and publish Nextcloud apps'
arch=(x86_64)
url="https://github.com/ChristophWurst/$pkgname"
license=(GPL3)
depends=(libcurl-gnutls)
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$_archive.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a9b838b4392a452197448faea03dcf6231cc6f21f6ff2ac9a659ffc334aad8a7')

prepare() {
	cd "$_archive"
	# Upstream issue: https://github.com/ChristophWurst/krankerl/issues/875
	cargo update
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$_archive"
	local RUSTUP_TOOLCHAIN=stable
	local CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$_archive"
	local RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
