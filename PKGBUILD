# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="svg2pdf-cli"
pkgname="svg2pdf"
pkgver=0.10.0
pkgrel=1
pkgdesc='The command line interface for svg2pdf.'
url='https://crates.io/crates/svg2pdf-cli'
license=('Apache' 'MIT')

depends=('gcc-libs')
makedepends=('cargo')

source=("$_crate-$pkgver.tar.gz::https://crates.io/api/v1/crates/svg2pdf-cli/0.10.0/download")
sha512sums=('d8f5c5fe44472fbcccafffb6143d6460c0ded24c4aa2d3a2adbb22ec6ba7734833676dc3da5f2a719b92867540a96cd85161f237275ebed2a97dc2377d3cdc6c')

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
		--release
}

package() {
	cd "$srcdir/$_crate-$pkgver"
	install -Dm755 "target/release/svg2pdf" -t "$pkgdir/usr/bin"
}