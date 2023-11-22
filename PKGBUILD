# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="probe-rs"
pkgname="probe-rs"
pkgver=0.21.1
pkgrel=1
pkgdesc='A collection of on chip debugging tools to communicate with microchips.'
url='https://github.com/probe-rs/probe-rs'
license=('Apache' 'MIT')

depends=('gcc-libs' 'libusb' 'libftdi' 'openssl' 'systemd-libs')
makedepends=('cargo')

source=("$_crate-$pkgver.tar.gz::https://crates.io/api/v1/crates/probe-rs/0.21.1/download")
sha512sums=('d9b85f1c52a054ff8d65f1c8527e693f13f07d9e767bdd5894d6d48c52ba35ba519f9aaf2da321474a4ca12d182f997c526bc30f06805b6293d40a8d0c2da2eb')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

prepare() {
	cd "$srcdir/$_crate-$pkgver"

	export RUSTUP_TOOLCHAIN=stable

	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/$_crate-$pkgver"
	
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target

	
	cargo build \
		--offline \
		--locked \
		--features 'cli,ftdi' \
		--release
}

package() {
	cd "$srcdir/$_crate-$pkgver"
	install -Dm755 "target/release/probe-rs" -t "$pkgdir/usr/bin"
	install -Dm755 "target/release/cargo-flash" -t "$pkgdir/usr/bin"
	install -Dm755 "target/release/cargo-embed" -t "$pkgdir/usr/bin"
}