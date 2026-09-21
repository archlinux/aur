# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appauthor=anistark
_appname=wasmrun
pkgname=${_appname}-bin
pkgver=0.23.0
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
sha256sums_x86_64=('bbb1fd43c5c92a238dcfb7f2b7c1846b1cc49748b55f80fd860d0aa01fbca1dc')
sha256sums_aarch64=('5345b37ed11cc39d57adf52fe36fd1645d96141f931f9b2c350a925803014e83')

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
