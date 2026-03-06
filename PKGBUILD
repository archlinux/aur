# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="qrcode2pdf"
_cratever="0.1.1"
pkgname="qrcode2pdf"
pkgver=0.1.1
pkgrel=2
pkgdesc='Render barcodes (QR Codes, Aztec, Data Matrix, etc) using rxing into a krilla...'
url='https://crates.io/crates/qrcode2pdf'
license=('EUPL-1.2')

depends=('libgcc')
makedepends=('cargo' 'cargo-auditable')

source=("$_crate-$_cratever.tar.gz::https://static.crates.io/crates/qrcode2pdf/0.1.1/download")
sha512sums=('0030ae379f9569364e2e5c5579855ccb989168c209f14cfa8e0f0012601fda9c66ba3921a8bde8f79f929d1803cca4b741da62d0ebffe1182c05b24ef5295d5c')

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
	install -Dm755 "target/release/aztec2pdf" -t "$pkgdir/usr/bin"
	install -Dm755 "target/release/datamatrix2pdf" -t "$pkgdir/usr/bin"
	install -Dm755 "target/release/pdf4172pdf" -t "$pkgdir/usr/bin"
	install -Dm755 "target/release/qrcode2pdf" -t "$pkgdir/usr/bin"
}
