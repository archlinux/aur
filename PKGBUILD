# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="lottieconv"
pkgname="lottieconv"
pkgver=0.2.0
pkgrel=1
pkgdesc='Convert lottie files to WEBP or GIF'
url='https://crates.io/crates/lottieconv'
license=('MIT')

depends=('gcc-libs' 'rlottie' 'libwebp')
makedepends=('cargo' 'clang')
conflicts=('lottie2gif' 'lottie2webp')
replaces=('lottie2gif' 'lottie2webp')

source=("$_crate-$pkgver.tar.gz::https://crates.io/api/v1/crates/lottieconv/0.2.0/download")
sha512sums=('a2b1ec0b16dfbab1f1efe1573e8c9a5b61509a58ae843c317772db70d205431673190a06d0c0854a43febe0008f227ab8264f3c3b48799e1ead5d373dc07e715')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

prepare() {
	cd "$srcdir/$_crate-$pkgver"

	cargo fetch --locked
}

build() {
	cd "$srcdir/$_crate-$pkgver"
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
}