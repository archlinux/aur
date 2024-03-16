# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="rtthost"
pkgname="rtthost"
pkgver=0.23.0
pkgrel=1
pkgdesc='RTT (Real-Time Transfer) client'
url='https://crates.io/crates/rtthost'
license=('MIT')

depends=('gcc-libs' 'systemd-libs')
makedepends=('cargo')
optdepends=('probe-rs: Other probe-rs binaries')

source=("$_crate-$pkgver.tar.gz::https://crates.io/api/v1/crates/rtthost/0.23.0/download")
sha512sums=('1402297c5f1d2c198abc89b8f813a38e7869bdca510d32ecc05fe0c08bfa1f4ace64297022eb67c53505c40a5f7cb138cbd329d7b1656d8f2905b1f1afa8f801')

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