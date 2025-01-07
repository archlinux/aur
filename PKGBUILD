# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: LuckyTurtleDev [aur at lukas1818 dot de]

_crate="cargo-hf2"
_cratever="0.3.3"
pkgname="cargo-hf2"
pkgver=0.3.3
pkgrel=2
pkgdesc='Cargo Subcommand for Microsoft HID Flashing Library for UF2 Bootloaders'
url='https://crates.io/crates/cargo-hf2'
license=('Apache-2.0' 'MIT')

depends=('gcc-libs' 'hidapi' 'libusb')
makedepends=('cargo' 'cargo-auditable')
optdepends=('adafruit-boards-udev: udev rule for adafruit boards')

source=("$_crate-$_cratever.tar.gz::https://static.crates.io/crates/cargo-hf2/0.3.3/download")
sha512sums=('ea717e7031af5ed10756fec04af91fd4aba3157df3e6d2b1d79f141cb9f1a73669db95b6d521b2617baf05aed039f6024a622a7e1ae0ce62251bd46bd3ee1a8b')

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
	install -Dm755 "target/release/cargo-hf2" -t "$pkgdir/usr/bin"
	install -Dm644 'LICENSE.md' -t "$pkgdir/usr/share/licenses/$pkgname/"
}