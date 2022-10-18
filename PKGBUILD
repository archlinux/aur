# Maintainer: Stefan Melmuk <stefan.melmuk@gmail.com>

pkgname=crowbook
pkgver=0.15.2e
pkgrel=8
pkgdesc="Converts books written in Markdown to HTML, LaTeX/PDF and EPUB"
arch=('x86_64')
url="https://github.com/lise-henry/crowbook"
license=('LGPL')
makedepends=('cargo')
optdepends=('texlive-latexextra: create PDF')
source=("https://github.com/lise-henry/crowbook/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('397ab6bde9a234b369c2fe0889003e27')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	# Update needed to fix build issues caused by a breaking change in Rust 1.64:
	# https://blog.rust-lang.org/2022/09/22/Rust-1.64.0.html#compatibility-notes
	cargo update
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	export CARGO_TARGET_DIR=target
	cargo build --release --frozen
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	export CARGO_TARGET_DIR=target-test
	cargo test --release --frozen
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm0755 -t "${pkgdir}/usr/bin" target/release/${pkgname}
}
