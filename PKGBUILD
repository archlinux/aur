# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="qrcode2pdf"
_cratever="0.1.0"
pkgname="qrcode2pdf"
pkgver=0.1.0
pkgrel=1
pkgdesc='Render barcodes (QR Codes, Aztec, Data Matrix, etc) using rxing into a krilla...'
url='https://crates.io/crates/qrcode2pdf'
license=('EUPL-1.2')

depends=('gcc-libs')
makedepends=('cargo' 'cargo-auditable')

source=("$_crate-$_cratever.tar.gz::https://static.crates.io/crates/qrcode2pdf/0.1.0/download")
sha512sums=('5c4fb7db2795c86eb914d4a06b42e443d087e344c81264ff7e557afa7467c9eaf66018c9bda40bc3f0755a5afcf6fbf460594f58b0c72afb564647534aeabedd')

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
