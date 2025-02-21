# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="hickory-util"
_cratever="0.24.4"
pkgname="hickory-util"
pkgver=0.24.4
pkgrel=1
pkgdesc='Utilities that complement Hickory DNS. '
url='https://hickory-dns.org/'
license=('Apache-2.0' 'MIT')

depends=('gcc-libs' 'openssl')
makedepends=('cargo' 'cargo-auditable')
conflicts=('trust-dns-util')
replaces=('trust-dns-util')

source=("$_crate-$_cratever.tar.gz::https://static.crates.io/crates/hickory-util/0.24.4/download")
sha512sums=('e4a423429e66d74469880f7322b897d215558b8c5acc8895b8b2cc6602d43f802daa4d823bc5430bbd7a04c91c4bd0a8794b28847371274617147435b090ea48')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

prepare() {
	cd "$srcdir/$_crate-$_cratever"

	export RUSTUP_TOOLCHAIN=stable

	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/$_crate-$_cratever"
	
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	CFLAGS+=" -ffat-lto-objects"

	cargo auditable build \
		--frozen \
		--features 'dns-over-https-rustls,dns-over-h3,dns-over-quic,dnssec-openssl' \
		--release
}

_check() {
	cd "$srcdir/$_crate-$_cratever"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	CFLAGS+=" -ffat-lto-objects"

	cargo test \
		--frozen \
		--features 'dns-over-https-rustls,dns-over-h3,dns-over-quic,dnssec-openssl' \
		--release \
		"${@}" \
		-- \
		--skip read_pem_into_key_pair
}

check() {
	_check --bins
	_check --lib
}

package() {
	cd "$srcdir/$_crate-$_cratever"
	install -Dm755 "target/release/dns" -t "$pkgdir/usr/bin"
	install -Dm755 "target/release/dnskey-to-pem" -t "$pkgdir/usr/bin"
	install -Dm755 "target/release/get-root-ksks" -t "$pkgdir/usr/bin"
	install -Dm755 "target/release/pem-to-public-dnskey" -t "$pkgdir/usr/bin"
	install -Dm755 "target/release/recurse" -t "$pkgdir/usr/bin"
	install -Dm755 "target/release/resolve" -t "$pkgdir/usr/bin"
}
