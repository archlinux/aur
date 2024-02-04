# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="rtthost"
pkgname="rtthost"
pkgver=0.22.0
pkgrel=1
pkgdesc='RTT (Real-Time Transfer) client'
url='https://crates.io/crates/rtthost'
license=('MIT')

depends=('gcc-libs' 'libusb' 'libftdi' 'openssl' 'systemd-libs')
makedepends=('cargo')
optdepends=('probe-rs: Other probe-rs binaries')

source=("$_crate-$pkgver.tar.gz::https://crates.io/api/v1/crates/rtthost/0.22.0/download")
sha512sums=('c4a90d071963675c686acffe37e2d912c68a6aaaf4e0b04acbf34d53010f98a5597494e4baf30c1d67dc3788b18136e4528ea10e8dd22d7293111f688cb996d0')

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
		--release
}

package() {
	cd "$srcdir/$_crate-$pkgver"
	install -Dm755 "target/release/rtthost" -t "$pkgdir/usr/bin"
}