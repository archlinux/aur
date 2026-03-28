# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=ocrs
pkgver=0.12.2
pkgrel=1
pkgdesc='a modern OCR engine written in Rust'
arch=(x86_64)
url="https://github.com/robertknight/$pkgname"
license=(MIT Apache-2.0)
depends=(gcc-libs
         glibc)
makedepends=(cargo)
_tag="$pkgname-cli-v$pkgver"
_archive="$pkgname-$_tag"
source=("$url/archive/$_tag/$_archive.tar.gz")
sha256sums=('6c78eb060c4aeaf71cd5c71421d2940f74fa374e379d3061553639be5ca250fc')

prepare() {
	cd "$_archive"
	cargo fetch --locked --target host-tuple
}

_srcenv() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	CFLAGS+=' -ffat-lto-objects'
}

build() {
	_srcenv
	cargo build --frozen --release --all-features
}

check() {
	_srcenv
	cargo test --frozen --release --all-features
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
