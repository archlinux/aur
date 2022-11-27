# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="refinery_cli"
pkgname="refinery_cli"
pkgver=0.8.7
pkgrel=1
pkgdesc='Provides the CLI for the Refinery crate'
url='https://crates.io/crates/refinery_cli'
license=('MIT')

depends=('gcc-libs' 'openssl' 'sqlite')
makedepends=('cargo')

source=("$_crate-$pkgver.tar.gz::https://crates.io/api/v1/crates/refinery_cli/0.8.7/download")
sha512sums=('18dcfcb0f1dc9626832739c8c4002b2468e3d6bc259912347ef1f81cab63a9b67117cffbd356f4ae0d1326e6faa29d47262210458d473b2d5616e2a2dc307bd5')

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
		--no-default-features \
		--features 'postgresql,mysql,sqlite' \
		--release
}

package() {
	cd "$srcdir/$_crate-$pkgver"
	install -Dm755 "target/release/refinery" -t "$pkgdir/usr/bin"
}