# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="hickory-dns"
_cratever="0.26.3"
pkgname="hickory-dns"
pkgver=0.26.3
pkgrel=1
pkgdesc='Hickory DNS is a safe and secure DNS server with a variety of protocol featur...'
url='https://hickory-dns.org/'
license=('Apache-2.0' 'MIT')

depends=('libgcc')
makedepends=('cargo' 'cargo-auditable')
replaces=('trust-dns')

source=("$_crate-$_cratever.tar.gz::https://static.crates.io/crates/hickory-dns/0.26.3/download"
        'hickory-dns.service')
sha512sums=('9383bdf0b4f37dc25f214708c695f7cfb40a161a45c28fbb568c3d5b200e9259de6d5e9194f9c1dd38428cf80fcbfd0978fda2c9b99e89b473102f1e64114c4c'
            'fc985e788258f918f7239d207418b1c68a110cff3722682b812b34548727e077f71745c07f28df28999523c80a54480a688fdf2cbf7c1ffa068cce24c3f49baf')

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
		--features 'https-ring,quic-ring,tls-ring,dnssec-ring,rustls-platform-verifier,blocklist,recursor,resolver' \
		--release
}

package() {
	cd "$srcdir/$_crate-$_cratever"
	install -Dm755 "target/release/hickory-dns" -t "$pkgdir/usr/bin"
	install -Dm644 'LICENSE-APACHE' -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 'LICENSE-MIT' -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 "$srcdir/hickory-dns.service" -t "$pkgdir//usr/lib/systemd/system/"
}
