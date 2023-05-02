# Maintainer: Bao Trinh <qubidt@gmail.com>

pkgname=unmake
pkgver=0.0.8
pkgrel=1
pkgdesc="a makefile linter"
arch=('x86_64' 'aarch64')
url="https://github.com/mcandre/unmake"
license=('BSD')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cd44125874e99766850d3a2031b201f152d917de9071d8f55a391a673c24f615')

prepare() {
	cd "${pkgname}-${pkgver}"
	cargo update  # upstream doesn't provide Cargo.lock file
	cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
	cd "${pkgname}-${pkgver}"
	cargo build --release --frozen
}

check() {
	cd "${pkgname}-${pkgver}"
	cargo test --release --frozen
}

package() {
	cd "${pkgname}-${pkgver}"
	install -vDm755 -t "${pkgdir}/usr/bin" 'target/release/unmake'
	install -vDm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" 'LICENSE.md'
	install -vDm644 -t "${pkgdir}/usr/share/doc/${pkgname}" 'README.md'
	install -vdm755 "${pkgdir}/usr/share/doc/${pkgname}/examples"
	cp -vR -t "${pkgdir}/usr/share/doc/${pkgname}/examples" fixtures/*
}
