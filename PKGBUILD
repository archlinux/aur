# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="hickory-dns"
pkgname="hickory-dns-git"
pkgver=0.24.0.r2.gbb203245
pkgrel=1
pkgdesc='Hickory DNS is a safe and secure DNS server with DNSSEC support. Eventually t...'
url='https://hickory-dns.org/'
license=('Apache' 'MIT')

depends=('gcc-libs')
makedepends=('cargo')
replaces=('trust-dns-git')
conflicts=('hickory-dns')
provides=('hickory-dns')

source=("$_crate::git+https://github.com/$_crate/$_crate"
		'hickory-dns.service')
sha512sums=('SKIP'
            'fc985e788258f918f7239d207418b1c68a110cff3722682b812b34548727e077f71745c07f28df28999523c80a54480a688fdf2cbf7c1ffa068cce24c3f49baf')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

pkgver() {
	cd "$srcdir/$_crate"
	git describe --long --tags | sed -E 's,^v?([^-]+)-([0-9]+)-(g[0-9a-f]+)$,\1.r\2.\3,'
}

build() {
	cd "$srcdir/$_crate"
	
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	
	cargo build \
		-p "$_crate" \
		--locked \
		--features 'dns-over-https-rustls,dns-over-h3,dns-over-quic' \
		--release
}

package() {
	cd "$srcdir/$_crate"
	install -Dm755 "target/release/hickory-dns" -t "$pkgdir/usr/bin"
	install -Dm644 'LICENSE-MIT' -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 'LICENSE-APACHE' -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 "$srcdir/hickory-dns.service" -t "$pkgdir//usr/lib/systemd/system/"
}
