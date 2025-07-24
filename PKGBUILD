# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: LuckyTurtleDev [aur at lukas1818 dot de]

_pkgtag=4.6.1 #auto updated by CI
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
sha512sums=('98c9fc0d120745851bc3a42e4f5679fa5db9179408b0077568ec92b38d7b37d57fa97407beda76b6591c4df72a4b2dc7c4684fde14c93e776eed670f202354c8')

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
