# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="trust-dns"
pkgname="trust-dns"
pkgver=0.22.0
pkgrel=4
pkgdesc='Trust-DNS is a safe and secure DNS server with DNSEC support. Eventually this...'
url='http://www.trust-dns.org/index.html'
license=('Apache' 'MIT')

depends=('gcc-libs')
makedepends=('cargo')
conflicts=('bind')

source=("$_crate-$pkgver.tar.gz::https://crates.io/api/v1/crates/trust-dns/0.22.0/download"
        "0001-fix-not-linking-openssl.patch"
        "named.service")
sha512sums=('07c24eb58d85e683e385a2b163341da1e23db148199f6da4cc01b5a73a145b9b41c507aefbc4f197da53e8cc8fb88b3644eedfaa5fb3a82b5fc7c2f19e67170a'
            'd7e3df286761bf8412bf37f9ad4ed4419e1e969d183df5ffbbd3002bde6b94f8c7958aa2e5c07a683932ef64288c4c18a6a45660be4e4ae4299a6cfc7d67d768'
            'ff17dec7c7d73254b561d2e27a161b70fdf806203b94a6a1733f7e37347b696469a38de377462202c93b2c76676ec0150098ad115cfc9117b29a493c911b178b')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

prepare() {
	cd "$srcdir/$_crate-$pkgver"
	patch -N -p0 -i "$srcdir/0001-fix-not-linking-openssl.patch"

	cargo fetch
}

build() {
	cd "$srcdir/$_crate-$pkgver"
	cargo build \
		--offline \
		--features 'dns-over-tls,dns-over-https-rustls' \
		--release
}

package() {
	cd "$srcdir/$_crate-$pkgver"
	install -Dm755 "target/release/named" -t "$pkgdir/usr/bin"
	install -Dm755 "target/release/trust-dns" -t "$pkgdir/usr/bin"
	install -Dm644 "LICENSE-MIT" -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 "LICENSE-APACHE" -t "$pkgdir/usr/share/licenses/$pkgname/"

	cd "$srcdir"
	install -Dm755 "named.service" "$pkgdir/etc/systemd/system/named.service"
}
