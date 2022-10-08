# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="lottieconv"
pkgname="lottieconv"
pkgver=0.2.1
pkgrel=1
pkgdesc='Convert lottie files to WEBP or GIF'
url='https://crates.io/crates/lottieconv'
license=('MIT')

depends=('gcc-libs' 'libwebp' 'rlottie')
makedepends=('cargo' 'clang')
conflicts=('lottie2gif' 'lottie2webp')
replaces=('lottie2gif' 'lottie2webp')

source=("$_crate-$pkgver.tar.gz::https://crates.io/api/v1/crates/lottieconv/0.2.1/download")
sha512sums=('5a8328796d3ead53b834e488e7c6e276c0a124d067a4c8a34cb56ebe4443a5b873dad6bc434df3521ed8633974810dd42117c0cc1047a6442a57dc373175d229')

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