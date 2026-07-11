# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgauthor=Vitruves
pkgname=firemark
pkgver=0.1.4
pkgrel=1
pkgdesc="A fast, single-binary watermarking tool for images and PDFs"

arch=('x86_64')
url="https://github.com/${pkgauthor}/${pkgname}"
license=('MIT')

depends=('glibc' 'libgcc')
provides=("${pkgname}")
makedepends=('cargo')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a0058a118664fd1348b4ab7c12e8cfb55802a8f142e1abfab925f6bcf0eb2a87')

prepare() {
	cd "${pkgname}-${pkgver}"

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "${pkgname}-${pkgver}"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --frozen
}

check() {
	cd "${pkgname}-${pkgver}"

	./target/release/${pkgname} -V
}

package() {
	cd "${pkgname}-${pkgver}"

	install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
