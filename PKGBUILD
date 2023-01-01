# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="svg2pdf"
pkgname="svg2pdf"
pkgver=0.4.1
pkgrel=1
pkgdesc='Convert SVG files to PDFs.'
url='https://crates.io/crates/svg2pdf'
license=('Apache' 'MIT')

depends=('gcc-libs')
makedepends=('cargo')

source=("$_crate-$pkgver.tar.gz::https://crates.io/api/v1/crates/svg2pdf/0.4.1/download")
sha512sums=('b3a4b930f28972d4783438307fdd543a40e10db8bf5233fcd0761c58f5c7222c751d8afabcc7ec7e1973bf5031e12ae2acf14a64d2caab109c6948316beefff5')

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
		--features 'cli' \
		--release
}

package() {
	cd "$srcdir/$_crate-$pkgver"
	install -Dm755 "target/release/svg2pdf" -t "$pkgdir/usr/bin"
	install -Dm644 "LICENSE-APACHE" -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 "LICENSE-MIT" -t "$pkgdir/usr/share/licenses/$pkgname/"
}