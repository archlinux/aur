# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=PerryTS
_pkgname=perry
pkgname=${_pkgname}-bin
pkgdesc="Native TypeScript compiler that compiles TypeScript to native executables"

pkgver=0.5.1122
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
sha256sums=('9356ad3b1d634c61ceef7652f39779ab785286262a9ce4c1591c440e125be579'
            'c871483477d7105432645affac5be5edbd92b41a6faedb4c692e0681e46ada09'
            'dfdebdfbae47153c486750ce859fe5b1b1fdab83a876feed07551ddf1502cb47')
sha256sums_x86_64=('38c5cf1ceb2feb01aedb09c5eaf36e5f2d5532469fecaeca189cc68a93d8a048')
sha256sums_aarch64=('e9f8a7c0d061322bf70370aab1e83dbd207972c90aa1102adfc941501723800f')


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
