# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="hickory-util"
_cratever="0.24.3"
pkgname="hickory-util"
pkgver=0.24.3
pkgrel=1
pkgdesc='Utilities that complement Hickory DNS. '
url='https://hickory-dns.org/'
license=('Apache-2.0' 'MIT')

depends=('gcc-libs' 'openssl')
makedepends=('cargo' 'cargo-auditable')
conflicts=('trust-dns-util')
replaces=('trust-dns-util')

source=("$_crate-$_cratever.tar.gz::https://static.crates.io/crates/hickory-util/0.24.3/download")
sha512sums=('d0c970f5d7c7f8c842a72fd493be402f388a7e6db5e118f5dfc85ff73b5f4fbe302d89ef3868d3b13d29b24871d640149ece244003855c57563548c60f44b937')

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