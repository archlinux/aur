# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="refinery_cli"
_cratever="0.9.1"
pkgname="refinery_cli"
pkgver=0.9.1
pkgrel=1
pkgdesc='Provides the CLI for the Refinery crate'
url='https://crates.io/crates/refinery_cli'
license=('MIT')

depends=('libgcc' 'openssl' 'sqlite')
makedepends=('cargo' 'cargo-auditable')

source=("$_crate-$_cratever.tar.gz::https://static.crates.io/crates/refinery_cli/0.9.1/download")
sha512sums=('e86e321263c54562909656c3f4b5be8e0bd1d1925c20a0dab1a6757506f5d90f96a9ecef5d1b5b6d754217689e98991ddf81692f5b6bd017944422d0fd5cb965')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

prepare() {
	cd "$srcdir/$_crate-$_cratever"

	export RUSTUP_TOOLCHAIN=stable

	cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/$_crate-$_cratever"
	
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	CFLAGS+=" -ffat-lto-objects"

	cargo auditable build \
		--offline \
		--no-default-features \
		--features 'postgresql,mysql,sqlite' \
		--release
}

_check() {
	cd "$srcdir/$_crate-$_cratever"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	CFLAGS+=" -ffat-lto-objects"

	cargo test \
		--offline \
		--no-default-features \
		--features 'postgresql,mysql,sqlite' \
		--release \
		"${@}"
}

check() {
	_check --bins
	_check --tests
}

package() {
	cd "$srcdir/$_crate-$_cratever"
	install -Dm755 "target/release/refinery" -t "$pkgdir/usr/bin"
}
