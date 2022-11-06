# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="lottieconv"
pkgname="lottieconv"
pkgver=0.2.2
pkgrel=1
pkgdesc='Convert lottie files to WEBP or GIF'
url='https://crates.io/crates/lottieconv'
license=('MIT')

depends=('gcc-libs' 'libwebp' 'rlottie')
makedepends=('cargo' 'clang')
conflicts=('lottie2gif' 'lottie2webp')
replaces=('lottie2gif' 'lottie2webp')

source=("$_crate-$pkgver.tar.gz::https://crates.io/api/v1/crates/lottieconv/0.2.2/download")
sha512sums=('bb51db1ed824c8a39e63534f4616924be6929f842419e50819b1770bcf447bd788ee8a40f36e6e943fceb80b529245aa50c9538bd9e993ff2b1f8806152cec74')

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