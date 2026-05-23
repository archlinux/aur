# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=PerryTS
_pkgname=perry
pkgname=${_pkgname}-bin
pkgdesc="Native TypeScript compiler that compiles TypeScript to native executables"

pkgver=0.5.1025
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-aarch64')

url="https://www.perryts.com/"
_ghurl="https://github.com/${_pkgauthor}/${_pkgname}"
__ghurlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

makedepends=('git')
depends=('bash')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

options=(!strip)

source=("README-${pkgver}.md::${__ghurlraw}/README.md"
		"LICENSE-${pkgver}::${__ghurlraw}/LICENSE"
		"tests.patch")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}.tar.gz")
sha256sums=('c97ece8dd2230225d3b2a8590837c0d9d966e08f9fc6d1cb37180c52df612e7d'
            'c871483477d7105432645affac5be5edbd92b41a6faedb4c692e0681e46ada09'
            '44603f704684f21e930eb39da6fca39f5e90efd101e27218aaf06255e5bada9b')
sha256sums_x86_64=('37e3c581c2b15d89fa8708fea69a537260cdffb80e8ff8160e84e07ce404f3ca')
sha256sums_aarch64=('97803c0ad4be68eb0f5e1fa73f86e4c9ad5718a383af44e9f292105658e4d857')


prepare() {
	cd "${srcdir}/" || exit

	rm -rf git && git clone -n --depth=1 --filter=tree:0 "${_ghurl}" git && cd git

	git sparse-checkout set --no-cone /tests/wasm && git checkout

	patch -p1 < ../tests.patch
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	for lib in "lib${_pkgname}"*; do
		install -Dm644 "${lib}" "${pkgdir}/usr/lib/$(basename ${lib})"
	done

	install -dm755 "${pkgdir}/usr/share/${_pkgname}/tests"
	cp -rf "git/tests/wasm/"* "${pkgdir}/usr/share/${_pkgname}/tests/"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
