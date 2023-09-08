# Maintainer: Caleb Maclennan <caleb@alerque.com>

BUILDENV+=(!check)

pkgname=nixpacks
pkgver=1.14.0
pkgrel=1
pkgdesc='App source + Nix packages + Docker = Image'
arch=(x86_64)
url="https://$pkgname.com"
_url="https://github.com/railwayapp/$pkgname"
license=(MIT)
depends=(gcc-libs docker)
makedepends=(cargo nix systemd)
checkdepends=(go zig)
optdepends=('go: support go projects'
            'zig: support zig projects')
options=('!lto')
_archive="$pkgname-$pkgver"
source=("$_url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('a4a50db2c0cd814b9079b003b0205bad53c2470e2e14c55567749280852aaf3d')

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
	cargo test --frozen --all-features -- \
		--skip "test_get_default_cache_key" \
		--skip "docker_run_tests"
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
