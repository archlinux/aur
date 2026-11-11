# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=yazeed
_pkgname=proc-cli
_appname=${_pkgname%-cli}
pkgname=${_pkgname}
pkgdesc="Semantic CLI tool for process management. Target by port, PID, name or path."

pkgver=2.4.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

makedepends=('cargo')
provides=("${_appname}")
replaces=("${pkgname%-cli}")

options=('!lto' '!strip')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('de95b86568cdc32b958334255dccced9cfd0d3930ccf566ba216d4451dfcd585')

prepare() {
	cd "${_pkgname}-${pkgver}" || exit

	cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
	cd "${_pkgname}-${pkgver}" || exit

	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

package() {
	cd "${_pkgname}-${pkgver}" || exit

	install -Dm755 "target/release/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
