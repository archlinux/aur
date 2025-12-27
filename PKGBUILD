# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=ocrs
pkgver=0.12.0
pkgrel=1
pkgdesc='a modern OCR engine written in Rust'
arch=(x86_64)
url="https://github.com/robertknight/$pkgname"
license=(MIT Apache-2.0)
depends=(gcc-libs
         glibc)
makedepends=(cargo-nightly)
_tag="$pkgname-cli-v$pkgver"
_archive="$pkgname-$_tag"
source=("$url/archive/$_tag/$_archive.tar.gz")
sha256sums=('2287bb34ea4c798ecee1be1f5b52a318247e0046319f3edb1948470ebed8ad9a')

prepare() {
	cd "$_archive"
	rustup default nightly-2025-02-08
	cargo fetch --locked --target "$(rustc --print host-tuple)"
}

_srcenv() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=nightly
	export CARGO_TARGET_DIR=target
	CFLAGS+=' -ffat-lto-objects'
}

build() {
	_srcenv
	cargo build --frozen --release --all-features
}

check() {
	_srcenv
	cargo test --frozen --all-features
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
