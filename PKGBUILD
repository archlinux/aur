# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="hickory-util"
_cratever="0.26.3"
pkgname="hickory-util"
pkgver=0.26.3
pkgrel=1
pkgdesc='Utilities that complement Hickory DNS. '
url='https://hickory-dns.org/'
license=('Apache-2.0' 'MIT')

depends=('libgcc')
makedepends=('cargo' 'cargo-auditable')
conflicts=('trust-dns-util')
replaces=('trust-dns-util')

source=("$_crate-$_cratever.tar.gz::https://static.crates.io/crates/hickory-util/0.26.3/download")
sha512sums=('3fd65d4005236182bb1cad3c584635ae6a8f39a90b76f55488e2959320e278c51634d79396c73e77af886f49d2f2aafb03cacf721e90023795d96191ab1b055a')

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
		--features 'h3-ring,https-ring,quic-ring,tls-ring,dnssec-ring,rustls-platform-verifier' \
		--release
}

package() {
	cd "$srcdir/$_crate-$_cratever"
	install -Dm755 "target/release/dns" -t "$pkgdir/usr/bin"
	install -Dm755 "target/release/recurse" -t "$pkgdir/usr/bin"
	install -Dm755 "target/release/resolve" -t "$pkgdir/usr/bin"
}
