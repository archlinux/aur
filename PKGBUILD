# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appauthor=anistark
_appname=wasmrun
pkgname=${_appname}-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Run WebAssembly instantly in your browser with a single command"

_ghurl="https://github.com/${_appauthor}/${_appname}"
__ghurlraw="https://raw.githubusercontent.com/${_appauthor}/${_appname}/v${pkgver}"
url="https://${_appname}.readthedocs.io/"

_barch=('x86_64' 'aarch64')
arch=('x86_64' 'aarch64')
license=('MIT')

conflicts=("${_appname}")
provides=("${_appname}")

depends=('emscripten')
optdepends=('wasm-pack')
makedepends=('tar' 'git')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${_appname}-v${pkgver}-${_barch[0]}.deb")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${_appname}-v${pkgver}-${_barch[1]}.deb")
sha256sums_x86_64=('83241031022d1b6ef3c5a8a0b8efbb495ee8b684c9f98289f184526830c67f40')
sha256sums_aarch64=('e67df52c69aa9e70bf4e383be01351c5cba0321065afbf1763c219d086734700')

prepare() {
	cd "${srcdir}/" || exit

	tar -xf "${srcdir}/data.tar.xz"

	rm -rf git && git clone -n --depth=1 --filter=tree:0 --branch "v${pkgver}" "${_ghurl}" git && cd git

	git sparse-checkout set --no-cone /examples && git checkout
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "usr/bin/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -dm755 "${pkgdir}/usr/share/${_appname}/examples/"
	cp -rf ./git/examples/* "${pkgdir}/usr/share/${_appname}/examples/"

	install -Dm644 "usr/share/doc/${_appname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "usr/share/doc/${_appname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
