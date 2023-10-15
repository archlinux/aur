# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="hickory-dns"
pkgname="hickory-dns"
pkgver=0.24.0
pkgrel=1
pkgdesc='Hickory DNS is a safe and secure DNS server with DNSSEC support. Eventually t...'
url='https://hickory-dns.org/'
license=('Apache' 'MIT')

depends=('gcc-libs')
makedepends=('cargo')
replaces=('trust-dns')

source=("$_crate-$pkgver.tar.gz::https://crates.io/api/v1/crates/hickory-dns/0.24.0/download"
		'hickory-dns.service')
sha512sums=('428063dd01e5833b76d6a23cd0d95aa57583e24c2f200326a5fa4142fc0b100ff73fa32d653258aa6c13ac89ac04c5fcfd2a63d87b0b603fad318a13e02323ed'
            "fc985e788258f918f7239d207418b1c68a110cff3722682b812b34548727e077f71745c07f28df28999523c80a54480a688fdf2cbf7c1ffa068cce24c3f49baf")

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
		--features 'dns-over-https-rustls,dns-over-h3,dns-over-quic' \
		--release
}

package() {
	cd "$srcdir/$_crate-$pkgver"
	install -Dm755 "target/release/hickory-dns" -t "$pkgdir/usr/bin"
	install -Dm644 'LICENSE-MIT' -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 'LICENSE-APACHE' -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 "$srcdir/hickory-dns.service" -t "$pkgdir//usr/lib/systemd/system/"
}