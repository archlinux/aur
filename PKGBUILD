# Maintainer: Jonathan Hayase <pythonnut@gmail.com>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Konstantin Stepanov <me@kstep.me>

pkgname=ztui
pkgver=0.1.4
_sha=43ad95d1d3c5a0302bd8c8b284ea3a535d434049
pkgrel=1
pkgdesc='A terminal UI for ZeroTier'
arch=(x86_64 i686 armv6h armv7h)
url='https://github.com/erikh/ztui'
license=()
makedepends=(cargo)
_archive="$pkgname-$_sha"
source=("$_archive.tar.gz::$url/archive/$_sha.tar.gz")
sha256sums=('3cabf5f4dce7b435b7806c340b9508c81869ba0bb1d0c14503ff393c359fdd5b')

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
