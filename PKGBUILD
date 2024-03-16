# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: LuckyTurtleDev [aur at lukas1818 dot de]

_crate="tauri-cli"
pkgname="tauri-cli-prerelease"
pkgver=2.0.0_beta.9
pkgrel=1
pkgdesc='Command line interface for building Tauri apps'
url='https://tauri.app'
license=('Apache' 'MIT')

depends=('gcc-libs' 'cargo' 'webkit2gtk-4.1' 'base-devel' 'curl' 'wget' 'file' 'openssl' 'appmenu-gtk-module' 'libappindicator-gtk3' 'librsvg')
makedepends=('cargo')
conflicts=('tauri-cli')

source=("$_crate-2.0.0-beta.9.tar.gz::https://crates.io/api/v1/crates/tauri-cli/2.0.0-beta.9/download")
sha512sums=('8db26b69dbc93301095b85d80a1371d5fbd7fcc9512cdba33afbd9dcfe6a5d2fe684185379d7225a97aa5ee68bb60e6429fb759c2c6991c478717ebe230473be')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

prepare() {
	cd "$srcdir/$_crate-2.0.0-beta.9"

	export RUSTUP_TOOLCHAIN=stable

	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/$_crate-2.0.0-beta.9"
	
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	CFLAGS+=" -ffat-lto-objects"

	
	cargo build \
		--offline \
		--locked \
		--release
}

package() {
	cd "$srcdir/$_crate-2.0.0-beta.9"
	install -Dm755 "target/release/cargo-tauri" -t "$pkgdir/usr/bin"
	install -Dm644 'LICENSE_APACHE-2.0' -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 'LICENSE_MIT' -t "$pkgdir/usr/share/licenses/$pkgname/"
}