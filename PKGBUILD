# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="hickory-util"
_cratever="0.24.2"
pkgname="hickory-util"
pkgver=0.24.2
pkgrel=1
pkgdesc='Utilities that complement Hickory DNS. '
url='https://hickory-dns.org/'
license=('Apache-2.0' 'MIT')

depends=('gcc-libs' 'openssl')
makedepends=('cargo')
conflicts=('trust-dns-util')
replaces=('trust-dns-util')

source=("$_crate-$_cratever.tar.gz::https://static.crates.io/crates/hickory-util/0.24.2/download")
sha512sums=('2690e381591ac7899aa9838b6f20cf28ad2ed8212eb41340ed9a49b388c61c910c04021b73a1683142e07d1bbff8ff1a9a81dd0bad2a88b08481242b5544b9b2')

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

	cargo build \
		--offline \
		--locked \
		--features 'dns-over-https-rustls,dns-over-h3,dns-over-quic,dnssec-openssl' \
		--release
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