# Maintainer: Aaron Friesen <aaron@frie.dev>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164
pkgname=rinklecate
pkgver=2.0.0
pkgrel=1
pkgdesc='Rust implementation of inklecate - compile and play Ink stories from the command line'
arch=(x86_64)
_srcname=blade-ink-rs
url="https://github.com/bladecoder/$_srcname"
license=(Apache-2.0)
depends=(glibc libgcc)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=(9816a66fb64a8369f58d4d4880fb8a90285597d1142bae56ca7f134e1dfcc1a3)

prepare() {
	cd "$_srcname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --target host-tuple
}

build() {
	cd "$_srcname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$_srcname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features --workspace
}

package() {
	cd "$_srcname-$pkgver"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
