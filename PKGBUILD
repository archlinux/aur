# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: LuckyTurtleDev [aur at lukas1818 dot de]

_crate="tauri-cli"
pkgname="tauri-cli-prerelease"
pkgver=2.0.0_beta.10
pkgrel=1
pkgdesc='Command line interface for building Tauri apps'
url='https://tauri.app'
license=('Apache' 'MIT')

depends=('gcc-libs' 'cargo' 'gcc' 'webkit2gtk-4.1' 'curl' 'wget' 'file' 'openssl' 'appmenu-gtk-module' 'libappindicator-gtk3' 'librsvg')
makedepends=('cargo')
conflicts=('tauri-cli')
provides=('tauri-cli=2.0.0_beta.10')

source=("$_crate-2.0.0-beta.10.tar.gz::https://crates.io/api/v1/crates/tauri-cli/2.0.0-beta.10/download")
sha512sums=('c9cc717ae323da8ac507d53eb20733e577f9d7794df7abab9de77f35105a0dbde02b285a38f451d73839380462d52eb55b5b52dd89737f29def823badebb41e2')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

prepare() {
	cd "$srcdir/$_crate-2.0.0-beta.10"

	export RUSTUP_TOOLCHAIN=stable

	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/$_crate-2.0.0-beta.10"
	
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	CFLAGS+=" -ffat-lto-objects"

	
	cargo build \
		--offline \
		--locked \
		--release
}

package() {
	cd "$srcdir/$_crate-2.0.0-beta.10"
	install -Dm755 "target/release/cargo-tauri" -t "$pkgdir/usr/bin"
	install -Dm644 'LICENSE_APACHE-2.0' -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 'LICENSE_MIT' -t "$pkgdir/usr/share/licenses/$pkgname/"
}