# Maintainer: Mattia Ronchi <ronchimattia03 at gmail dot com>

pkgname=asm-lsp
pkgver=0.6.0
pkgrel=1
pkgdesc="A language server for NASM/GAS/GO Assembly"
arch=('any')
url="https://crates.io/crates/asm-lsp"
license=('custom:BSD-2-Clause')
makedepends=('cargo')
checkdepends=()
optdepends=()
source=("https://github.com/bergercookie/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('71348b181f77fbd0005bd6abbdfd793816cb581541a17e6ccd8714e0fcb7e755')

prepare(){
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET=target
	cargo build --frozen --release --all-features
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm0755 -t "$pkgdir/usr/bin" "target/release/$pkgname"
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	cp LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}
