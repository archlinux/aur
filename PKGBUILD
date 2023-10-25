# Maintainer: Ben Westover <me@benthetechguy.net>

pkgname=rust2rpm-helper
pkgver=0.1.3
pkgrel=1
pkgdesc="Helper functionality for rust2rpm"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://pagure.io/fedora-rust/rust2rpm-helper"
license=('MIT')
makedepends=('cargo')
source=("https://pagure.io/fedora-rust/rust2rpm-helper/archive/$pkgver/rust2rpm-helper-$pkgver.tar.gz")
sha256sums=('2be2fd2cfbf674b20fd6560fb8a7e7bcb4a4e739efadf617f7f7e2ad98567127')

prepare() {
	cd "$pkgname-$pkgver"

	if [ $CARCH = "armv7h" ]; then
		TARGET="armv7-unknown-linux-gnueabihf"
	else
		TARGET="$CARCH-unknown-linux-gnu"
	fi

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target $TARGET
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
