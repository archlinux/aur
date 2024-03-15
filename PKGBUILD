# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="probe-rs"
pkgname="probe-rs"
pkgver=0.23.0
pkgrel=1
pkgdesc='A collection of on chip debugging tools to communicate with microchips.'
url='https://github.com/probe-rs/probe-rs'
license=('Apache' 'MIT')

depends=('gcc-libs' 'libusb' 'libftdi' 'openssl' 'systemd-libs')
makedepends=('cargo')
optdepends=('rtthost: Real-time transfer client')
conflicts=('cargo-flash')

source=("$_crate-$pkgver.tar.gz::https://crates.io/api/v1/crates/probe-rs/0.23.0/download")
sha512sums=('bfc272824a7487658c7467614eca06efa38985376ec40d9c18304bac8414704bcb066a7f22e27bb2aa21be2083b0ffa1631a7768d75a0d051ae2d59edc661382')

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
	
	CFLAGS+=" -ffat-lto-objects"

	
	cargo build \
		--offline \
		--locked \
		--features 'cli' \
		--release
}

package() {
	cd "$srcdir/$_crate-$pkgver"
	install -Dm755 "target/release/probe-rs" -t "$pkgdir/usr/bin"
	install -Dm755 "target/release/cargo-flash" -t "$pkgdir/usr/bin"
	install -Dm755 "target/release/cargo-embed" -t "$pkgdir/usr/bin"
}
