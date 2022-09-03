# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="trust-dns"
pkgname="trust-dns"
pkgver=0.22.0
pkgrel=1
pkgdesc='Trust-DNS is a safe and secure DNS server with DNSEC support. Eventually this...'
url='http://www.trust-dns.org/index.html'
license=('Apache' 'MIT')

depends=('gcc-libs')
makedepends=('cargo')
conflicts=('bind')

source=("$_crate-$pkgver.tar.gz::https://crates.io/api/v1/crates/trust-dns/0.22.0/download")
sha512sums=('07c24eb58d85e683e385a2b163341da1e23db148199f6da4cc01b5a73a145b9b41c507aefbc4f197da53e8cc8fb88b3644eedfaa5fb3a82b5fc7c2f19e67170a')

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
		--features 'dns-over-tls,dns-over-https-rustls' \
		--release
}

package() {
	cd "$srcdir/$_crate-$pkgver"
	install -Dm755 "target/release/named" -t "$pkgdir/usr/bin"
	install -Dm755 "target/release/trust-dns" -t "$pkgdir/usr/bin"
}