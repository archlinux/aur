# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="refinery_cli"
pkgname="refinery_cli"
pkgver=0.8.12
pkgrel=1
pkgdesc='Provides the CLI for the Refinery crate'
url='https://crates.io/crates/refinery_cli'
license=('MIT')

depends=('gcc-libs' 'openssl' 'sqlite')
makedepends=('cargo')

source=("$_crate-$pkgver.tar.gz::https://crates.io/api/v1/crates/refinery_cli/0.8.12/download")
sha512sums=('b30427f5265a8074afff3af5711eb1f536c8f2ddb97e5af16ea5b13f2ce6b5cb9743b6b351c4ba1cea1dc7d29cbb6ffef4eb539b46f098a2b47132a1f5231a96')

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
		--no-default-features \
		--features 'postgresql,mysql,sqlite' \
		--release
}

package() {
	cd "$srcdir/$_crate-$pkgver"
	install -Dm755 "target/release/refinery" -t "$pkgdir/usr/bin"
}