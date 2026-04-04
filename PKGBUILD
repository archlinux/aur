# Maintainer: Yamashiro <dev cosmicheron com>
# Former maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname='heliocron'
pkgver='1.0.0'
pkgrel='1'
pkgdesc='Execute tasks relative to sunset, sunrise and other such solar events'
arch=('x86_64' 'aarch64')
url='https://github.com/mfreeborn/heliocron'
license=('Apache-2.0' 'MIT')
depends=('glibc' 'libgcc')
provides=('heliocron')
makedepends=('cargo')
_src="${pkgname}-${pkgver}"
source=("${_src}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('82da28397b4f36aee1412d76653a68b116c44c801a6d0917bff2c77f2429cd8abfa37554795d1bb88472994f9af54612189dcfcabd247fb050c273293ecd87ba')

prepare() {
	cd "$_src"
	cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
	cd "$_src"
	cargo build --release --frozen
}

check() {
	cd "$_src"
	cargo test --frozen --features 'integration-test'
}

package() {
	install -Dt "${pkgdir}/usr/bin" "${_src}/target/release/${pkgname}"
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${_src}/LICENSE-"{'APACHE','MIT'}
}

# vim:set ts=2 sw=2 et:
