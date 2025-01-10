# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: LuckyTurtleDev [aur at lukas1818 dot de]

_pkgtag=2.2.3 #auto updated by CI
_crate="tauri-cli"
pkgname="tauri-cli"
pkgver=$_pkgtag
pkgrel=1 #auto reset by CI
pkgdesc='Command line interface for building Tauri apps'
url='https://tauri.app'
license=('Apache-2.0' 'MIT')

depends=('gcc-libs' 'cargo' 'gcc' 'webkit2gtk-4.1' 'curl' 'wget' 'file' 'openssl' 'appmenu-gtk-module' 'libappindicator-gtk3' 'librsvg')
makedepends=('cargo')

source=("$_crate-$_pkgtag.tar.gz::https://crates.io/api/v1/crates/tauri-cli/$_pkgtag/download")
sha512sums=('40a91e8d39590a5510e8d6c6043596bff754fe9909e664db985952eec0ba664b0f92cae815051d85761c4ff7529970fa172cf3f4f56192a94e170685f4fb87ef')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

prepare() {
	cd "$srcdir/$_crate-$_pkgtag"

	export RUSTUP_TOOLCHAIN=stable

	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/$_crate-$_pkgtag"
	
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	CFLAGS+=" -ffat-lto-objects"

	
	cargo build \
		--offline \
		--locked \
		--release
}

package() {
	cd "$srcdir/$_crate-$_pkgtag"
	install -Dm755 "target/release/cargo-tauri" -t "$pkgdir/usr/bin"
	install -Dm644 'LICENSE_MIT' -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 'LICENSE_APACHE-2.0' -t "$pkgdir/usr/share/licenses/$pkgname/"
}
