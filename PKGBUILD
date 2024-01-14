# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="svg2pdf-cli"
pkgname="svg2pdf"
pkgver=0.9.1
pkgrel=1
pkgdesc='The command line interface for svg2pdf.'
url='https://crates.io/crates/svg2pdf-cli'
license=('Apache' 'MIT')

depends=('gcc-libs')
makedepends=('cargo')

source=("$_crate-$pkgver.tar.gz::https://crates.io/api/v1/crates/svg2pdf-cli/0.9.1/download")
sha512sums=('d73df8dd7715b6dcf7d2a60dee530d0da55af136447b25df81d60e320d69d0ab3da602f5a35650b33b50a0429f8b3dcc924eda95302706e72973f23ff3ec1ef8')

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