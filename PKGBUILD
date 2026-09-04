# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="hickory-util"
_cratever="0.26.2"
pkgname="hickory-util"
pkgver=0.26.2
pkgrel=1
pkgdesc='Utilities that complement Hickory DNS. '
url='https://hickory-dns.org/'
license=('Apache-2.0' 'MIT')

depends=('libgcc')
makedepends=('cargo' 'cargo-auditable')
conflicts=('trust-dns-util')
replaces=('trust-dns-util')

source=("$_crate-$_cratever.tar.gz::https://static.crates.io/crates/hickory-util/0.26.2/download")
sha512sums=('249015d1dd896f6573824f1bae33e3a838aed7cb8e0b8dad589bd11967dbdd5a568bcb88f69c520497de59dd7729942dd0550c6c9d11a5f7e1f6a2b3df7894d9')

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
