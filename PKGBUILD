# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="hickory-dns"
_cratever="0.25.2"
pkgname="hickory-dns"
pkgver=0.25.2
pkgrel=1
pkgdesc='Hickory DNS is a safe and secure DNS server with DNSSEC support. Eventually t...'
url='https://hickory-dns.org/'
license=('Apache-2.0' 'MIT')

depends=('gcc-libs')
makedepends=('cargo' 'cargo-auditable')
replaces=('trust-dns')

source=("$_crate-$_cratever.tar.gz::https://static.crates.io/crates/hickory-dns/0.25.2/download"
        'hickory-dns.service'
        'fix-include-str-outside-package.patch'
        'fix-dev-dependency-not-published.patch')
sha512sums=('96afeee082ef977e1fe597a5ca1b01adabda23dae6623317ccded715e379fe9b83bc11120164277b4d815840b0a4b6c29ec313f31502d85bcc2df603b486c903'
            'fc985e788258f918f7239d207418b1c68a110cff3722682b812b34548727e077f71745c07f28df28999523c80a54480a688fdf2cbf7c1ffa068cce24c3f49baf'
            '778a33455c0dfdf15a74d9f4aafa60322edbaf43d61814732ba2649ac19fedc18fd329d040af8d26465853e8e11aa4390db0bc00390e5fb8f59c142e72c629eb'
            '3b54fe437c3fad50879f0c6d340a054b5c376dadeee00fa3bb938f6a0cd822efd0fba43d4092d51da5bb22f3e67344b1d31340941b78d289f90697c1de46a2af')

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
