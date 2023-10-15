# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="hickory-util"
pkgname="hickory-util"
pkgver=0.24.0
pkgrel=1
pkgdesc='Utilities that complement Hickory DNS. '
url='https://hickory-dns.org/'
license=('Apache' 'MIT')

depends=('gcc-libs' 'openssl')
makedepends=('cargo')
conflicts=('trust-dns-util')
replaces=('trust-dns-util')

source=("$_crate-$pkgver.tar.gz::https://crates.io/api/v1/crates/hickory-util/0.24.0/download")
sha512sums=('3e96879a6cf2e0cf57321937f171a33d6e055f0d24a7434635224e90b153ebbbfb751742155e3a48783e453fc1454b029f5f5969ba79cda674c610ed138d0e75')

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
		--features 'dns-over-https-rustls,dns-over-h3,dns-over-quic,dnssec-openssl' \
		--release
}

package() {
	cd "$srcdir/$_crate-$pkgver"
	install -Dm755 "target/release/dnskey-to-pem" -t "$pkgdir/usr/bin"
	install -Dm755 "target/release/get-root-ksks" -t "$pkgdir/usr/bin"
	install -Dm755 "target/release/pem-to-public-dnskey" -t "$pkgdir/usr/bin"
	install -Dm755 "target/release/resolve" -t "$pkgdir/usr/bin"
	install -Dm755 "target/release/recurse" -t "$pkgdir/usr/bin"
	install -Dm755 "target/release/dns" -t "$pkgdir/usr/bin"
}