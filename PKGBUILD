# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="b64url"
pkgname="b64url"
pkgver=0.1.1
pkgrel=1
pkgdesc='Command line URL-safe Base-64 encoder/decoder'
url='https://crates.io/crates/b64url'
license=('MIT')

depends=('gcc-libs')
makedepends=('cargo')

source=("$_crate-0.1.1.tar.gz::https://crates.io/api/v1/crates/b64url/0.1.1/download")
sha512sums=('0c8749474cd23766744f1df72b5a17f20a170e9eac1b3663f91a7e3bf20760f5f36e08bd0fa859edc368cd01d949fd669abd927c109f276c11b801719afad94b')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

prepare() {
	cd "$srcdir/$_crate-0.1.1"

	export RUSTUP_TOOLCHAIN=stable

	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/$_crate-0.1.1"
	
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	CFLAGS+=" -ffat-lto-objects"

	
	cargo build \
		--offline \
		--locked \
		--release
}

package() {
	cd "$srcdir/$_crate-0.1.1"
	install -Dm755 "target/release/b64url" -t "$pkgdir/usr/bin"
	install -Dm644 'LICENSE' -t "$pkgdir/usr/share/licenses/$pkgname/"
}