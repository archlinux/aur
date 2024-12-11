# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="hickory-dns"
_cratever="0.24.2"
pkgname="hickory-dns"
pkgver=0.24.2
pkgrel=1
pkgdesc='Hickory DNS is a safe and secure DNS server with DNSSEC support. Eventually t...'
url='https://hickory-dns.org/'
license=('Apache-2.0' 'MIT')

depends=('gcc-libs')
makedepends=('cargo')
replaces=('trust-dns')

source=("$_crate-$_cratever.tar.gz::https://static.crates.io/crates/hickory-dns/0.24.2/download"
		'hickory-dns.service')
sha512sums=('d8ad950095abfd467326aa91755107e403ce8de76f226d3db6cbd3b8dc21973faaed86e60c41d9de45cb5e6135f036dd7f85c8dd0c9d68214511c8704ab5df01'
            "fc985e788258f918f7239d207418b1c68a110cff3722682b812b34548727e077f71745c07f28df28999523c80a54480a688fdf2cbf7c1ffa068cce24c3f49baf")

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
		--features 'dns-over-https-rustls,dns-over-h3,dns-over-quic' \
		--release
}

package() {
	cd "$srcdir/$_crate-$_cratever"
	install -Dm755 "target/release/hickory-dns" -t "$pkgdir/usr/bin"
	install -Dm644 'LICENSE-MIT' -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 'LICENSE-APACHE' -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 "$srcdir/hickory-dns.service" -t "$pkgdir//usr/lib/systemd/system/"
}