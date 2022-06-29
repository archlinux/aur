# Maintainer: Jonathan Hayase <pythonnut@gmail.com>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Konstantin Stepanov <me@kstep.me>

pkgname=ztui
pkgver=0.1.2
_sha=239070e0e95e86c95170010fc9ccce5c29b71e9e
pkgrel=1
pkgdesc='A terminal UI for ZeroTier'
arch=(x86_64 i686 armv6h armv7h)
url='https://github.com/erikh/ztui'
license=()
makedepends=(cargo)
_archive="$pkgname-$_sha"
source=("$_archive.tar.gz::$url/archive/$_sha.tar.gz")
sha256sums=('256b6d743285c44bdc153b418bd101f6bb2720d96d317dafe4d8135a3fb117cd')

pkgver() {
	cd "$_archive"
	awk -F\" '/^version/ { print $2; exit }' Cargo.toml
}

prepare() {
	cd "$_archive"
	cargo update
	cargo fetch --locked --target $CARCH-unknown-linux-gnu
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
	cargo test --frozen
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname%-git}"
}
