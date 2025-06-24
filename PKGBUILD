# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: LuckyTurtleDev [aur at lukas1818 dot de]

_pkgtag=2.6.0 #auto updated by CI
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
sha512sums=('0e76a55afca63118e78178d9f5e44935793146396c706132655e366e9028269258e18577c55c24b8eda57187485ff5d1866b5063633d830d4f764bb38e047d80')

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
