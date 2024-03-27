# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="cargo-doc2readme"
pkgname="cargo-doc2readme"
pkgver=0.4.0
pkgrel=1
pkgdesc='cargo subcommand to create a readme file containing the rustdoc comments from...'
url='https://crates.io/crates/cargo-doc2readme'
license=('Apache')

depends=('gcc-libs')
makedepends=('cargo')

source=("$_crate-0.4.0.tar.gz::https://crates.io/api/v1/crates/cargo-doc2readme/0.4.0/download")
sha512sums=('0c8d9717e48e3f8e2aba162072bcc93c1fa5751b59693c7b6abbf28f7d92f26a112aeb65d337de11cdfdbb37eeb1b0688c81105d8c1eea0ac50ebc7012a87cdd')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

prepare() {
	cd "$srcdir/$_crate-0.4.0"

	export RUSTUP_TOOLCHAIN=stable

	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/$_crate-0.4.0"
	
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	CFLAGS+=" -ffat-lto-objects"

	
	cargo build \
		--offline \
		--locked \
		--release
}

package() {
	cd "$srcdir/$_crate-0.4.0"
	install -Dm755 "target/release/cargo-doc2readme" -t "$pkgdir/usr/bin"
	install -Dm644 'LICENSE' -t "$pkgdir/usr/share/licenses/$pkgname/"
}