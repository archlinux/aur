# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=nixpacks
pkgver=0.2.0
pkgrel=1
pkgdesc='App source + Nix packages + Docker = Image'
arch=(x86_64)
url="https://$pkgname.com"
_url="https://github.com/railwayapp/$pkgname"
license=(MIT)
depends=(gcc-libs docker)
makedepends=(cargo nix systemd)
options=('!lto')
_archive="$pkgname-$pkgver"
source=("$_archive.tar.gz::$_url/archive/v$pkgver.tar.gz")
sha256sums=('a286511ef637e5500a26b77b73eef1b5a18b68d998ca56bb6bafc08e6ad43d96')

prepare() {
	cd "$_archive"
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
