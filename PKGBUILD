# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="refinery_cli"
_cratever="0.8.16"
pkgname="refinery_cli"
pkgver=0.8.16
pkgrel=1
pkgdesc='Provides the CLI for the Refinery crate'
url='https://crates.io/crates/refinery_cli'
license=('MIT')

depends=('gcc-libs' 'openssl' 'sqlite')
makedepends=('cargo' 'cargo-auditable')

source=("$_crate-$_cratever.tar.gz::https://static.crates.io/crates/refinery_cli/0.8.16/download")
sha512sums=('a759603cffa87e5a63d74c5cf6dce63d9f295b93ab71ea0f8e910dd52a6c9062d9a413cb12ac34b172dc8ce350ca2921fd6915c6c07588b8fef0d42ed8215b8e')

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
