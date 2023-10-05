# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="probe-rs"
pkgname="probe-rs"
pkgver=0.21.0
pkgrel=1
pkgdesc='A collection of on chip debugging tools to communicate with microchips.'
url='https://github.com/probe-rs/probe-rs'
license=('Apache' 'MIT')

depends=('gcc-libs' 'libusb' 'libftdi' 'openssl' 'systemd-libs')
makedepends=('cargo')

source=("$_crate-$pkgver.tar.gz::https://crates.io/api/v1/crates/probe-rs/0.21.0/download")
sha512sums=('366249a9ce892d797263d0feec85fbaa44cb6786b7bc7e5032859548814fe69b2cdbe5ce1767837ca1b96dd03ddf75b9f7d7ddd2697b38d9f627dea41899557f')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

prepare() {
	cd "$srcdir/$_crate-$pkgver"

	cargo fetch --locked
}

build() {
	cd "$srcdir/$_crate-$pkgver"
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