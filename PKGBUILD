# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

# Package Information
_crate="trust-dns"
pkgname="$_crate"
pkgver=0.21.1
pkgrel=1
pkgdesc='Trust-DNS is a safe and secure DNS server with DNSec support. Eventually this...'
license=('Apache' 'MIT')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

# Generic Stuff for cargo packages
url="http://www.trust-dns.org/index.html"
depends=('gcc-libs')
makedepends=('cargo')
conflicts=('bind')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$_crate/$pkgver/download")
sha512sums=('627b563c96dd9de70b4b743c11c69beff4a3f66c70a72c6115c4a8e152969cb9d85f34eab264b0dbd239280d2e228ce8893c11f06501ce6e31be75a1a7030168')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cargo build \
		--locked \
		--features 'dns-over-tls,dns-over-https-rustls' \
		--release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "target/release/named" -t "$pkgdir/usr/bin"
}
