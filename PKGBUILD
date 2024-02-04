# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="probe-rs"
pkgname="probe-rs"
pkgver=0.22.0
pkgrel=2
pkgdesc='A collection of on chip debugging tools to communicate with microchips.'
url='https://github.com/probe-rs/probe-rs'
license=('Apache' 'MIT')

depends=('gcc-libs' 'libusb' 'libftdi' 'openssl' 'systemd-libs')
makedepends=('cargo')
optdepends=('rtthost: Real-time transfer client')
conflicts=('cargo-flash')

source=("$_crate-$pkgver.tar.gz::https://crates.io/api/v1/crates/probe-rs/0.22.0/download")
sha512sums=('b1bacd5c38dcfbb9fdc3f21ee7224e1ab1d72498535b924e811b50c21c97d5e71648544ff5f716299082ed862187c75f1af21f2a58f13d2a3bb8256fb38e1f18')

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
