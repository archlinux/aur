# Maintainer: @RubenKelevra <rubenkelevra@gmail.com>

_pkgname='saxonche'
pkgname="python-${_pkgname}12-bin"
_pyabi='cp314'
_pyver='3.14'
pkgver='12.10.0'
_wheelbase="${_pkgname}-${pkgver}-${_pyabi}-${_pyabi}-manylinux_2_24"
pkgrel=1
pkgdesc="Official Python bindings for SaxonC-HE 12.x XSLT, XQuery and XPath processor series. Considered as 'most stable and reliable release', compared to 13.x"
url='https://www.saxonica.com/html/saxon-c/index.html'
license=('MPL-2.0 AND Apache-2.0 AND BSD-3-Clause AND X11 AND W3C-20150513')
arch=(
	'x86_64'
	'aarch64'
)
depends=(
	'python>=3.14'
	'python<3.15'
	'glibc'
	'gcc-libs'
	'zlib'
)
makedepends=('python-installer')
provides=(
	"python-${_pkgname}=${pkgver}"
	"python-${_pkgname}12=${pkgver}"
)
conflicts=(
	"python-${_pkgname}"
	"python-${_pkgname}12"
)
source=(
	'SAXON-LICENSE.txt'
	'JAMESCLARK.txt'
	'JLINE2.txt'
	'W3C-LICENSE.txt'
)
source_x86_64=("${_wheelbase}_x86_64.pypi.whl::https://files.pythonhosted.org/packages/2e/1c/a055f534990bef42e65086f6311277ac4a36ab0626a11858fbd1160b00f3/${_wheelbase}_x86_64.whl")
source_aarch64=("${_wheelbase}_aarch64.pypi.whl::https://files.pythonhosted.org/packages/a7/84/2e312c0917821895c4b3c2e80da2d0cd45a49ecc67f89ead18ca5fd55056/${_wheelbase}_aarch64.whl")
b2sums=(
	'0719ae14362c858005ce79de6e9e258f4d72d53c6bb28caa1e38483969dfc941e4cb517fd91241dd59b872594232a87f510a9f2f1ba801f99de304878a7e0998'
	'4f3df2dbe3766828196839b2329eb362ba1c88f1f2871830b8ac0469feadb13cac0ebaca3c9ce151b2d4a68b6b056871d9a6befbe11fd1863c33593da7098e8d'
	'd2da14cb27b0242a2a86f86bfd29b7ab8ef297017c6b58dbe91f7c1c81684cf95c1a56a603035e69cb83f367284575eb483616bdd66a816a374606ffe5db0ea2'
	'87a8912fd4da4ec6a627405205d7341aea440ca0c40b9201474dc5e645bf79fec74d9e42c7e72b3ab8eea873b2393c8b8dce6c644c671e968cc842ba310d5485'
)
b2sums_x86_64=('df5c5e617d73fefa2688e568234be947c809ee94105d11cef6bcfdd4c0002684b3a9503830910aa569fcaee04846d3529c9bfd4b3bf9e180872d3e928a16a321')
b2sums_aarch64=('86e86c3e717c9a6a338f327dfb53dcf18b69078c59bc61cf915da2e17f81709bffb3ae6890c7842b34fc47c9f1ca5750000d3c0b19a15cddeff154a5be97073e')
noextract=(
	"${_wheelbase}_x86_64.pypi.whl"
	"${_wheelbase}_aarch64.pypi.whl"
)

package() {
	local _wheel="${_wheelbase}_${CARCH}.pypi.whl"

	[[ -f "${srcdir}/${_wheel}" ]] || {
		printf 'Missing wheel for %s: %s\n' "${CARCH}" "${srcdir}/${_wheel}" >&2
		return 1
	}

	python -m installer --destdir="${pkgdir}" --compile-bytecode 2 "${srcdir}/${_wheel}"

	# Upstream's wheel includes Cython/C++ build sources as importable namespace
	# directories. They are not used by the extension at runtime.
	rm -r -- \
		"${pkgdir}/usr/lib/python${_pyver}/site-packages/cpp" \
		"${pkgdir}/usr/lib/python${_pyver}/site-packages/saxonc"
	printf '%s\n' 'saxonche' > \
		"${pkgdir}/usr/lib/python${_pyver}/site-packages/${_pkgname}-${pkgver}.dist-info/top_level.txt"

	install -Dm644 -- "${srcdir}/SAXON-LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/SAXON-LICENSE.txt"
	install -Dm644 -- "${srcdir}/JAMESCLARK.txt" "${pkgdir}/usr/share/licenses/${pkgname}/JAMESCLARK.txt"
	install -Dm644 -- "${srcdir}/JLINE2.txt" "${pkgdir}/usr/share/licenses/${pkgname}/JLINE2.txt"
	install -Dm644 -- "${srcdir}/W3C-LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/W3C-LICENSE.txt"
}
