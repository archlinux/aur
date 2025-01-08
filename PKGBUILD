# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: LuckyTurtleDev [aur at lukas1818 dot de]

_crate="hf2-cli"
_cratever="0.3.3"
pkgname="hf2-cli"
pkgver=0.3.3
pkgrel=3
pkgdesc='CLI for Microsoft HID Flashing Library for UF2 Bootloaders'
url='https://crates.io/crates/hf2-cli'
license=('Apache-2.0' 'MIT')

depends=('gcc-libs' 'hidapi' 'libusb')
makedepends=('cargo' 'cargo-auditable')
optdepends=('adafruit-boards-udev: udev rule for adafruit boards')

source=("$_crate-$_cratever.tar.gz::https://static.crates.io/crates/hf2-cli/0.3.3/download")
sha512sums=('038d37171f382c0637cb45e929495533bb4632d8ebd8a813d7da67ee509dc91e9ae4aa8008bfe4271d01b0e6b57723e4a995874f0b15746975d3344a77a3bb96')

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
	install -Dm755 "target/release/hf2" -t "$pkgdir/usr/bin"
	install -Dm644 'LICENSE.md' -t "$pkgdir/usr/share/licenses/$pkgname/"
}