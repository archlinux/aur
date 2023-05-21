# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="refinery_cli"
pkgname="refinery_cli"
pkgver=0.8.10
pkgrel=1
pkgdesc='Provides the CLI for the Refinery crate'
url='https://crates.io/crates/refinery_cli'
license=('MIT')

depends=('gcc-libs' 'openssl' 'sqlite')
makedepends=('cargo')

source=("$_crate-$pkgver.tar.gz::https://crates.io/api/v1/crates/refinery_cli/0.8.10/download")
sha512sums=('eb4770c0519100d27eb231b4d480b8fa1512709429d32ec878b59be25427c138f9f9402c8ff34e1f01cc31f1fee7b6ddeb5b6f09b50ea4dc6773d2abe6e85a00')

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