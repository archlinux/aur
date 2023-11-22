# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="lottieconv"
pkgname="lottieconv"
pkgver=0.3.0
pkgrel=1
pkgdesc='Convert lottie files to WEBP or GIF'
url='https://crates.io/crates/lottieconv'
license=('MIT')

depends=('gcc-libs' 'libwebp' 'rlottie')
makedepends=('cargo' 'clang')
conflicts=('lottie2gif' 'lottie2webp')
replaces=('lottie2gif' 'lottie2webp')

source=("$_crate-$pkgver.tar.gz::https://crates.io/api/v1/crates/lottieconv/0.3.0/download")
sha512sums=('aec0d45d2dfdcc70ff062d73780dfd5860bff0180d87797c0fab24b76e9c6fa39a87cbbdcbb51ee1ab25f1c99702a5a10c34f29e10328c6c555177854462bf7d')

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
		--features 'clap,gif,webp' \
		--release
}

package() {
	cd "$srcdir/$_crate-$pkgver"
	install -Dm755 "target/release/lottie2gif" -t "$pkgdir/usr/bin"
	install -Dm755 "target/release/lottie2webp" -t "$pkgdir/usr/bin"
	install -Dm644 'LICENSE' -t "$pkgdir/usr/share/licenses/$pkgname/"
}