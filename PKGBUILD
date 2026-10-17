# Maintainer: Aaron Friesen <aaron@frie.dev>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164
pkgname=rinklecate
pkgver=2.1.0
pkgrel=1
pkgdesc='Rust implementation of inklecate - compile and play Ink stories from the command line'
arch=(x86_64)
_srcname=blade-ink-rs
url="https://github.com/bladecoder/$_srcname"
license=(Apache-2.0)
depends=(glibc libgcc)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b5c21703a22cebf058b2c33c67fbea1f2acfe85e12bb07924c51a79df09a852d')

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
