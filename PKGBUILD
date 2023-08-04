# Maintainer: Stefan Melmuk <stefan.melmuk@gmail.com>

pkgname=crowbook
pkgver=0.16.1
pkgrel=0
pkgdesc="Converts books written in Markdown to HTML, LaTeX/PDF and EPUB"
arch=('x86_64')
url="https://github.com/lise-henry/crowbook"
license=('LGPL')
makedepends=('cargo')
optdepends=('texlive-latexextra: create PDF')
source=("https://github.com/lise-henry/crowbook/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('4b519919b69c07ac4e1c1cc636875ea3')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_HOME="${srcdir}/cargo"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	export CARGO_HOME="${srcdir}/cargo"
	export CARGO_TARGET_DIR=target
	cargo build --release --frozen
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	export CARGO_HOME="${srcdir}/cargo"
	export CARGO_TARGET_DIR=target-test
	cargo test --release --frozen
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	export CARGO_HOME="${srcdir}/cargo"
	install -Dm0755 -t "${pkgdir}/usr/bin" target/release/${pkgname}
}
