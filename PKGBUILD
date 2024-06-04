# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: LuckyTurtleDev [aur at lukas1818 dot de]

_pkgtag=4.0.0 #auto updated by CI
_crate="create-tauri-app"
pkgname="create-tauri-app"
pkgver=$_pkgtag
pkgrel=1 #auto reset by CI
pkgdesc='Rapidly scaffold out a new tauri app project.'
url='https://crates.io/crates/create-tauri-app'
license=('Apache' 'MIT')

depends=('tauri-cli')
makedepends=('cargo')

source=("$_crate-$pkgver.tar.gz::https://crates.io/api/v1/crates/create-tauri-app/$_pkgtag/download")
sha512sums=('6770c144bce5cacd82bd8a9295c218391d209ea1ce1b57596cece50f91f1f94055d50d46139075248e6279676adb3aa18059273f62c8856d27ec9efbd9fe2fc0')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

prepare() {
	cd "$srcdir/$_crate-$pkgver"

	export RUSTUP_TOOLCHAIN=stable

	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/$_crate-$pkgver"
	
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target

	
	cargo build \
		--offline \
		--locked \
		--release
}

package() {
	cd "$srcdir/$_crate-$pkgver"
	install -Dm755 "target/release/cargo-create-tauri-app" -t "$pkgdir/usr/bin"
	install -Dm644 'LICENSE.spdx' -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 'LICENSE_APACHE-2.0' -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 'LICENSE_MIT' -t "$pkgdir/usr/share/licenses/$pkgname/"
}
