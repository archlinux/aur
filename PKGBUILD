# Maintainer: Stefan Melmuk <stefan.melmuk@gmail.com>

pkgname=crowbook
pkgver=0.17.0
pkgrel=2
pkgdesc="Converts books written in Markdown to HTML, LaTeX/PDF and EPUB"
arch=('x86_64')
url="https://github.com/crowdagger/crowbook"
license=('LGPL-2.1-only')
makedepends=('cargo')
optdepends=('texlive-latexextra: create PDF')
source=("https://github.com/crowdagger/crowbook/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('13c628722fedf1bfebc0fd334e9ffa41a62888e3195d2ad1e5ea851694dc4a4c')
options=(!lto)

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
