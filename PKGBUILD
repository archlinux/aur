# Maintainer: Bao Trinh <qubidt@gmail.com>

pkgname=unmake
pkgver=0.0.6
pkgrel=1
pkgdesc="a makefile linter"
arch=('x86_64' 'aarch64')
url="https://github.com/mcandre/unmake"
license=('BSD')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('788252ec8b791699c93eb6195a0c18a47cacaeb744391ee15978917acff85bdf')

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
