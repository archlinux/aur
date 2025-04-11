# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="hickory-dns"
_cratever="0.25.1"
pkgname="hickory-dns"
pkgver=0.25.1
pkgrel=1
pkgdesc='Hickory DNS is a safe and secure DNS server with DNSSEC support. Eventually t...'
url='https://hickory-dns.org/'
license=('Apache-2.0' 'MIT')

depends=('gcc-libs')
makedepends=('cargo' 'cargo-auditable')
replaces=('trust-dns')

source=("$_crate-$_cratever.tar.gz::https://static.crates.io/crates/hickory-dns/0.25.1/download"
        'hickory-dns.service'
        'fix-include-str-outside-package.patch'
        'fix-dev-dependency-not-published.patch')
sha512sums=('422ef7b7f9f0c0e5cb7764e22f79afd60055bcca64c0ded29cce6dfa51ba708ced3850ea52717fca1ca08eb43304e6f63b142680b1ab6fef309bef2cc225a3ac'
            'fc985e788258f918f7239d207418b1c68a110cff3722682b812b34548727e077f71745c07f28df28999523c80a54480a688fdf2cbf7c1ffa068cce24c3f49baf'
            '778a33455c0dfdf15a74d9f4aafa60322edbaf43d61814732ba2649ac19fedc18fd329d040af8d26465853e8e11aa4390db0bc00390e5fb8f59c142e72c629eb'
            '5e69ec1b2641a9611283f6a618a039500d8a53684152c4dd54c47a55713397bb80f89480de938f5588ea282b68e0620f8a4fe0260a8f6c2da45d252c71a4c040')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

prepare() {
	cd "$srcdir/$_crate-$_cratever"
	
	patch -Np2 -i "$srcdir/fix-include-str-outside-package.patch"
	patch -Np2 -i "$srcdir/fix-dev-dependency-not-published.patch"

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
		--features 'h3-ring,https-ring,quic-ring,tls-ring,dnssec-ring,rustls-platform-verifier,blocklist,recursor,resolver' \
		--release
}

_check() {
	cd "$srcdir/$_crate-$_cratever"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	CFLAGS+=" -ffat-lto-objects"

	cargo test \
		--frozen \
		--features 'h3-ring,https-ring,quic-ring,tls-ring,dnssec-ring,rustls-platform-verifier,blocklist,recursor,resolver' \
		--release \
		"${@}" \
		-- \
		--skip config_tests \
		--skip named_https_tests \
		--skip named_quic_tests \
		--skip named_rustls_tests \
		--skip named_tests \
		--skip named_test_rsa_dnssec \
		--skip store_file_tests \
		--skip store_sqlite_tests
}

check() {
	_check --bins
	_check --lib
	_check --tests
}

package() {
	cd "$srcdir/$_crate-$_cratever"
	install -Dm755 "target/release/hickory-dns" -t "$pkgdir/usr/bin"
	install -Dm644 'LICENSE-MIT' -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 'LICENSE-APACHE' -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 "$srcdir/hickory-dns.service" -t "$pkgdir//usr/lib/systemd/system/"
}
