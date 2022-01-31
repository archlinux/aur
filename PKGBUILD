# Maintainer: Caleb Bassi <calebjbassi@gmail.com>
# Contributor: Caleb Maclennan <caleb@alerque.com>

pkgname=ytop
pkgver=0.6.2
pkgrel=3
pkgdesc='A TUI system monitor written in Rust'
arch=(x86_64)
url="https://github.com/cjbassi/$pkgname"
license=(MIT)
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$_archive.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('d9fd6ce00e27de894bc0790947fbeab40e81e34afa5ead5a53d126c458d50e99')

prepare() {
	cd "$_archive"
	# Will not build on current Rust compiler with locked dependencies, must
	# bump them first. Upstream repository is archived.
	cargo update
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
