# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="refinery_cli"
_cratever="0.10.0"
pkgname="refinery_cli"
pkgver=0.10.0
pkgrel=1
pkgdesc='Provides the CLI for the Refinery crate'
url='https://crates.io/crates/refinery_cli'
license=('MIT')

depends=('libgcc' 'openssl' 'sqlite')
makedepends=('cargo' 'cargo-auditable')

source=("$_crate-$_cratever.tar.gz::https://static.crates.io/crates/refinery_cli/0.10.0/download")
sha512sums=('e6d7fc0f2c42f735e8e432a549da0a30d66fa3a445b3b44255ad414ea8a65270d24b18f784772e12a77434ef17399a831217960674d93fa095455547f2d08f48')

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

	cargo auditable build \
		--frozen \
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
		--frozen \
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
