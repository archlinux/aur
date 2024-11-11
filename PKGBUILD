# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="cargo-doc2readme"
pkgname="cargo-doc2readme"
pkgver=0.5.0
pkgrel=1
pkgdesc='cargo subcommand to create a readme file containing the rustdoc comments from...'
url='https://crates.io/crates/cargo-doc2readme'
license=('Apache-2.0')

depends=('gcc-libs')
makedepends=('cargo')

source=("$_crate-0.5.0.tar.gz::https://crates.io/api/v1/crates/cargo-doc2readme/0.5.0/download")
sha512sums=('1db317678a60cf1171610407e776c09a495c10fb12cc34338fed9899576267e4618ebb3bba8640fbb1992ded7ee8bf999b9ffc9a55fa3e23b69f7f7202fbb4db')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

prepare() {
	cd "$srcdir/$_crate-0.5.0"

	export RUSTUP_TOOLCHAIN=stable

	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/$_crate-0.5.0"
	
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	CFLAGS+=" -ffat-lto-objects"

	
	cargo build \
		--offline \
		--locked \
		--release
}

package() {
	cd "$srcdir/$_crate-0.5.0"
	install -Dm755 "target/release/cargo-doc2readme" -t "$pkgdir/usr/bin"
	install -Dm644 'LICENSE' -t "$pkgdir/usr/share/licenses/$pkgname/"
}