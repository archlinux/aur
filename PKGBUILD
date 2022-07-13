# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="lottieconv"
pkgname="$_crate"
pkgver=0.1.0
pkgrel=1
pkgdesc='Convert lottie files to WEBP'
url='https://crates.io/crates/lottieconv'
license=('MIT')

depends=('gcc-libs' 'rlottie' 'libwebp')
makedepends=('cargo' 'clang')
conflicts=('lottie2gif' 'lottie2webp')
replaces=('lottie2gif' 'lottie2webp')

source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$_crate/$pkgver/download")
sha512sums=('579b767e6829c7973a3f2cd1e870709e101e10e8a82f08aeafefa0d37057020a05f076cc037cc925a4799761e9f8ffc4718427a1fb499a4ed195f68b63f9c674')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"

	cargo fetch --locked
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cargo build \
		--offline \
		--locked \
		--features 'clap,gif,webp' \
		--release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "target/release/lottie2gif" -t "$pkgdir/usr/bin"
	install -Dm755 "target/release/lottie2webp" -t "$pkgdir/usr/bin"
}