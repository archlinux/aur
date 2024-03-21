# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: LuckyTurtleDev [aur at lukas1818 dot de]

_crate="tauri-cli"
pkgname="tauri-cli-prerelease"
pkgver=2.0.0_beta.11
pkgrel=1
pkgdesc='Command line interface for building Tauri apps'
url='https://tauri.app'
license=('Apache' 'MIT')

depends=('gcc-libs' 'cargo' 'gcc' 'webkit2gtk-4.1' 'curl' 'wget' 'file' 'openssl' 'appmenu-gtk-module' 'libappindicator-gtk3' 'librsvg')
makedepends=('cargo')
conflicts=('tauri-cli')
provides=('tauri-cli=2.0.0_beta.11')

source=("$_crate-2.0.0-beta.11.tar.gz::https://crates.io/api/v1/crates/tauri-cli/2.0.0-beta.11/download")
sha512sums=('d4844ba7c6021e482c0a6297df2e33f98b96ebcc485da9315d79743572e4488db2a5b05fb70f087337ac061caa0fc69c82f6d5fb2eb63b64d799ecbae0ec82d4')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

prepare() {
	cd "$srcdir/$_crate-2.0.0-beta.11"

	export RUSTUP_TOOLCHAIN=stable

	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/$_crate-2.0.0-beta.11"
	
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	CFLAGS+=" -ffat-lto-objects"

	
	cargo build \
		--offline \
		--locked \
		--release
}

package() {
	cd "$srcdir/$_crate-2.0.0-beta.11"
	install -Dm755 "target/release/cargo-tauri" -t "$pkgdir/usr/bin"
	install -Dm644 'LICENSE_MIT' -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 'LICENSE_APACHE-2.0' -t "$pkgdir/usr/share/licenses/$pkgname/"
}