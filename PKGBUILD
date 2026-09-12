# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=romancitodev
_pkgname=cargo-pretty
pkgname=${_pkgname}
pkgdesc="A cargo build wrapper with a live, animated status view"

pkgver=0.2.1
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')
license=('MIT')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

makedepends=('cargo')
depends=('glibc' 'libgcc' 'cargo')

options=('!lto' '!strip')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/${_pkgvername}.tar.gz")
sha256sums=('c6a19b0d7a32ec6d0ec8594c576b05ea82b94dcf21a22d4a771b38809c2d8d37')


prepare() {
	cd "${pkgname}-${pkgver}" || exit

	cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
	cd "${pkgname}-${pkgver}" || exit

	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

check() {
	cd "${pkgname}-${pkgver}" || exit

	export CARGO_TARGET_DIR=target
	cargo test --frozen --release
}

package() {
	cd "${pkgname}-${pkgver}" || exit

	install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
