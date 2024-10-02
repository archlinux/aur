# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="svg2pdf-cli"
pkgname="svg2pdf"
pkgver=0.12.0
pkgrel=1
pkgdesc='The command line interface for svg2pdf.'
url='https://crates.io/crates/svg2pdf-cli'
license=('Apache-2.0' 'MIT')

depends=('gcc-libs')
makedepends=('cargo')

source=("$_crate-0.12.0.tar.gz::https://crates.io/api/v1/crates/svg2pdf-cli/0.12.0/download")
sha512sums=('99503ea03b579f93461b718c84a7d578d21b5697d3458917118800e4555e66d2e9183669102779ee54ced7656b1fefbe891e1a607576e476db3f98f2db29bf91')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

prepare() {
	cd "$srcdir/$_crate-0.12.0"

	export RUSTUP_TOOLCHAIN=stable

	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/$_crate-0.12.0"
	
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	CFLAGS+=" -ffat-lto-objects"

	
	cargo build \
		--offline \
		--locked \
		--release
}

package() {
	cd "$srcdir/$_crate-0.12.0"
	install -Dm755 "target/release/svg2pdf" -t "$pkgdir/usr/bin"
}