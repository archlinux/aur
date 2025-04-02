# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="svg2pdf-cli"
_cratever="0.13.0"
pkgname="svg2pdf"
pkgver=0.13.0
pkgrel=1
pkgdesc='The command line interface for svg2pdf.'
url='https://crates.io/crates/svg2pdf-cli'
license=('Apache-2.0' 'MIT')

depends=('gcc-libs')
makedepends=('cargo' 'cargo-auditable')

source=("$_crate-$_cratever.tar.gz::https://static.crates.io/crates/svg2pdf-cli/0.13.0/download")
sha512sums=('028398c8926edc912a94744dc7b577f0c85a5d1911a6f2f86fb13827f9e1f705cdfe4a5453e21394026fb8924a28c8a899964331680b236537630eeda0507791')

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
		--release
}

package() {
	cd "$srcdir/$_crate-$_cratever"
	install -Dm755 "target/release/svg2pdf" -t "$pkgdir/usr/bin"
}
