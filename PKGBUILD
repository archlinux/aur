# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="svg2pdf-cli"
pkgname="svg2pdf"
pkgver=0.11.0
pkgrel=1
pkgdesc='The command line interface for svg2pdf.'
url='https://crates.io/crates/svg2pdf-cli'
license=('Apache-2.0' 'MIT')

depends=('gcc-libs')
makedepends=('cargo')

source=("$_crate-0.11.0.tar.gz::https://crates.io/api/v1/crates/svg2pdf-cli/0.11.0/download")
sha512sums=('86333caf20b0ccf19f50d78bfa7a7e267a75ba51876fd201c70cc85097ba3f7246a6f8a932524844647199d676675a3faee6cb603964ee1e74f871a4ddbde3a4')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

prepare() {
	cd "$srcdir/$_crate-0.11.0"

	export RUSTUP_TOOLCHAIN=stable

	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/$_crate-0.11.0"
	
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	CFLAGS+=" -ffat-lto-objects"

	
	cargo build \
		--offline \
		--locked \
		--release
}

package() {
	cd "$srcdir/$_crate-0.11.0"
	install -Dm755 "target/release/svg2pdf" -t "$pkgdir/usr/bin"
}