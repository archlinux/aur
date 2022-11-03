# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=nixpacks
pkgver=0.12.0
pkgrel=1
pkgdesc='App source + Nix packages + Docker = Image'
arch=(x86_64)
url="https://$pkgname.com"
_url="https://github.com/railwayapp/$pkgname"
license=(MIT)
depends=(gcc-libs docker)
makedepends=(cargo nix systemd)
checkdepends=(zig)
# optdepends=('zig: support zig projects'
#             'go: support go projects')
options=('!lto')
_archive="$pkgname-$pkgver"
source=("$_archive.tar.gz::$_url/archive/v$pkgver.tar.gz")
sha256sums=('0284a586c7b64e48dba7618b8b87623a4cb386ac5a31e5723553b1eab2d38dcf')

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
	# cargo test --frozen --all-features -- --skip "test_get_default_cache_key"
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
