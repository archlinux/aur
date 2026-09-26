# Maintainer: Aaron Friesen <aaron@frie.dev>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164
pkgname=mitex
pkgver=0.2.7
pkgrel=1
pkgdesc='LaTeX support for Typst, powered by Rust and WASM'
arch=(x86_64)
url="https://github.com/mitex-rs/mitex"
license=(Apache-2.0)
depends=(glibc libgcc)
makedepends=(cargo typst)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('6e63aa314adb8963a89c80bf891884d49ad4ae489a1979b5e1bb7b61a874cfd8')

prepare() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --target host-tuple
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --package mitex-cli --features generate-spec
}

check() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --workspace --no-fail-fast
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
