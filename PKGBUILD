# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="pdfutil"
_cratever="0.4.0"
pkgname="pdfutil"
pkgver=0.4.0
pkgrel=3
pkgdesc='A utility for PDF document manipulation.'
url='https://github.com/J-F-Liu/lopdf/tree/master/pdfutil'
license=('MIT')

depends=('gcc-libs')
makedepends=('cargo' 'cargo-auditable')

source=("$_crate-$_cratever.tar.gz::https://static.crates.io/crates/pdfutil/0.4.0/download")
sha512sums=('c1d3c503e2043cf8b7a4824727ea559b8cc1a201ccd78fd85c640f8e33a5c64199fa7466adfbbee5c730cdb35c6510b3a17a6f484c0174b99d9afb94160dfa68')

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
	install -Dm755 "target/release/pdfutil" -t "$pkgdir/usr/bin"
}