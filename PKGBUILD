# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: LuckyTurtleDev [aur at lukas1818 dot de]

_crate="tauri-cli"
pkgname="tauri-cli"
pkgver=1.5.11
pkgrel=1
pkgdesc='Command line interface for building Tauri apps'
url='https://tauri.app'
license=('Apache' 'MIT')

depends=('gcc-libs' 'cargo' 'webkit2gtk-4.1' 'base-devel' 'curl' 'wget' 'file' 'openssl' 'appmenu-gtk-module' 'libappindicator-gtk3' 'librsvg')
makedepends=('cargo')

source=("$_crate-1.5.11.tar.gz::https://crates.io/api/v1/crates/tauri-cli/1.5.11/download")
sha512sums=('eb12c7dbac935a4d3ee38a2bab5283adb53c100e26ccf9d40190e909ae573562a8cb952fddf4a3757d29bbae9208642fbc8fd4371e1a9c15274f14699267d0ee')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

prepare() {
	cd "$srcdir/$_crate-1.5.11"

	export RUSTUP_TOOLCHAIN=stable

	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/$_crate-1.5.11"
	
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	CFLAGS+=" -ffat-lto-objects"

	
	cargo build \
		--offline \
		--locked \
		--release
}

package() {
	cd "$srcdir/$_crate-1.5.11"
	install -Dm755 "target/release/cargo-tauri" -t "$pkgdir/usr/bin"
	install -Dm644 'LICENSE_APACHE-2.0' -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 'LICENSE_MIT' -t "$pkgdir/usr/share/licenses/$pkgname/"
}