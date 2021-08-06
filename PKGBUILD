# Maintainer: Caleb Maclennnan <caleb@alerque.com>

# TODO:
# * upstream 0.0.0 released to crates.io but not tagged,
#   drop $_sha and switch source to *.tar.gz when repo gets tagged

pkgname=sear
pkgver=0.0.0
_sha=ba1f37f5dd1a32c5de2a20e8c385678d95d403a8
pkgrel=1
pkgdesc='Signed/Encrypted ARchive'
arch=(x86_64)
url="https://github.com/iqlusioninc/$pkgname"
license=(Apache)
makedepends=(cargo)
_archive="$pkgname-$_sha"
source=("$_archive.zip::$url/archive/$_sha.zip")
sha256sums=('391e5fd18fa7ca14eb866b448f8e5efe355c276cf4b78814c97bdaffb25f8811')

prepare() {
	cd "$_archive"
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
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}
