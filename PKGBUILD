# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="hickory-util"
pkgname="hickory-util"
pkgver=0.24.1
pkgrel=1
pkgdesc='Utilities that complement Hickory DNS. '
url='https://hickory-dns.org/'
license=('Apache-2.0' 'MIT')

depends=('gcc-libs' 'openssl')
makedepends=('cargo')
conflicts=('trust-dns-util')
replaces=('trust-dns-util')

source=("$_crate-0.24.1.tar.gz::https://crates.io/api/v1/crates/hickory-util/0.24.1/download")
sha512sums=('c825eca03e8f7a275405d0d3641faee98cb3c683a04a51965625e443c34fa72a75222ecbbbbc86398f488e5989fb62d0ab18d4892c17d41fd21ab59d432d99f7')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

prepare() {
	cd "$srcdir/$_crate-0.24.1"

	export RUSTUP_TOOLCHAIN=stable

	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/$_crate-0.24.1"
	
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	CFLAGS+=" -ffat-lto-objects"

	
	cargo build \
		--offline \
		--locked \
		--features 'dns-over-https-rustls,dns-over-h3,dns-over-quic,dnssec-openssl' \
		--release
}

package() {
	cd "$srcdir/$_crate-0.24.1"
	install -Dm755 "target/release/dnskey-to-pem" -t "$pkgdir/usr/bin"
	install -Dm755 "target/release/get-root-ksks" -t "$pkgdir/usr/bin"
	install -Dm755 "target/release/pem-to-public-dnskey" -t "$pkgdir/usr/bin"
	install -Dm755 "target/release/resolve" -t "$pkgdir/usr/bin"
	install -Dm755 "target/release/recurse" -t "$pkgdir/usr/bin"
	install -Dm755 "target/release/dns" -t "$pkgdir/usr/bin"
}