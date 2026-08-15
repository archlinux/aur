# Maintainer: @RubenKelevra <rubenkelevra@gmail.com>

_pkgname='saxonche'
pkgname="python-${_pkgname}-bin"
_pyabi='cp314'
_pyver='3.14'
pkgver='13.0.0'
_wheelbase="${_pkgname}-${pkgver}-${_pyabi}-${_pyabi}-manylinux_2_24"
pkgrel=1
pkgdesc='Official Python bindings for the SaxonC-HE XSLT, XQuery and XPath processor'
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
provides=("python-${_pkgname}=${pkgver}")
conflicts=("python-${_pkgname}")
source=(
	'SAXON-LICENSE.txt'
	'JAMESCLARK.txt'
	'JLINE2.txt'
	'W3C-LICENSE.txt'
)
source_x86_64=("${_wheelbase}_x86_64.pypi.whl::https://files.pythonhosted.org/packages/28/c6/f9e6cc024e5e899bcca4c4b730457c1990b2c62197d470867a3b7aef796b/${_wheelbase}_x86_64.whl")
source_aarch64=("${_wheelbase}_aarch64.pypi.whl::https://files.pythonhosted.org/packages/b0/40/0ed698395b0fd216a6ef95c9fe1435648ca80a7ebf1289d422a6d97928a1/${_wheelbase}_aarch64.whl")
b2sums=(
	'0719ae14362c858005ce79de6e9e258f4d72d53c6bb28caa1e38483969dfc941e4cb517fd91241dd59b872594232a87f510a9f2f1ba801f99de304878a7e0998'
	'4f3df2dbe3766828196839b2329eb362ba1c88f1f2871830b8ac0469feadb13cac0ebaca3c9ce151b2d4a68b6b056871d9a6befbe11fd1863c33593da7098e8d'
	'd2da14cb27b0242a2a86f86bfd29b7ab8ef297017c6b58dbe91f7c1c81684cf95c1a56a603035e69cb83f367284575eb483616bdd66a816a374606ffe5db0ea2'
	'87a8912fd4da4ec6a627405205d7341aea440ca0c40b9201474dc5e645bf79fec74d9e42c7e72b3ab8eea873b2393c8b8dce6c644c671e968cc842ba310d5485'
)
b2sums_x86_64=('6ecd710bcbe91ba238d6509a6da5ac48bb3edfd3a6c076e9e80ab349b221f33a4dbfa9d28a9c24400db6aa75c4b4c5c99573d869a3ab51f31b881bacba18abc8')
b2sums_aarch64=('c22151212c13665f7b4342ae0af70962e1c75f12409f132d32bfc080cfa9f9657a89ced41de1aa8a08153118c148498e49110ab70d1576f924ff587696ebf631')
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
