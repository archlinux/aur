# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="cargo-clean-all"
pkgname="cargo-clean-all"
pkgver=0.6.2
pkgrel=1
pkgdesc='Recursively clean all cargo projects in a given directory that match the spec...'
url='https://github.com/dnlmlr/cargo-clean-all'
license=('MIT')

depends=('gcc-libs')
makedepends=('cargo')

source=("$_crate-0.6.2.tar.gz::https://crates.io/api/v1/crates/cargo-clean-all/0.6.2/download")
sha512sums=('dd3b1940ba418d73d85c861bc30ec443b522d20986e9400dbafdb6f16243407ca2cde5392c60cb25e5cd71014feebac7a78269257a00a6b58152295a54f71d3f')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

prepare() {
	cd "$srcdir/$_crate-0.6.2"

	export RUSTUP_TOOLCHAIN=stable

	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/$_crate-0.6.2"
	
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	CFLAGS+=" -ffat-lto-objects"

	
	cargo build \
		--offline \
		--locked \
		--release
}

package() {
	cd "$srcdir/$_crate-0.6.2"
	install -Dm755 "target/release/cargo-clean-all" -t "$pkgdir/usr/bin"
	install -Dm644 'LICENSE' -t "$pkgdir/usr/share/licenses/$pkgname/"
}