# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="refinery_cli"
pkgname="refinery_cli"
pkgver=0.8.14
pkgrel=1
pkgdesc='Provides the CLI for the Refinery crate'
url='https://crates.io/crates/refinery_cli'
license=('MIT')

depends=('gcc-libs' 'openssl' 'sqlite')
makedepends=('cargo')

source=("$_crate-0.8.14.tar.gz::https://crates.io/api/v1/crates/refinery_cli/0.8.14/download")
sha512sums=('9b36ec2de9699015e5becef18d56f9aae4f162ceef9150819136f72f0be242827eddf9cd1c779b96ae6a72472b4c884aa3ada260ef6c5d70ecfc60cd25ddecab')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

prepare() {
	cd "$srcdir/$_crate-0.8.14"

	export RUSTUP_TOOLCHAIN=stable

	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/$_crate-0.8.14"
	
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	CFLAGS+=" -ffat-lto-objects"

	
	cargo build \
		--offline \
		--locked \
		--no-default-features \
		--features 'postgresql,mysql,sqlite' \
		--release
}

package() {
	cd "$srcdir/$_crate-0.8.14"
	install -Dm755 "target/release/refinery" -t "$pkgdir/usr/bin"
}