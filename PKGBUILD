# Maintainer: @RubenKelevra <rubenkelevra@gmail.com>
# Contributor: devome <evinedeng@hotmail.com>

_pkgname='red-black-tree-mod'
pkgname="python-${_pkgname}"
pkgver=1.22
pkgrel=2
pkgdesc='Flexible Python implementation of red-black trees'
arch=('any')
url="https://stromberg.dnsalias.org/svn/${_pkgname}"
license=('MIT')
depends=('python')
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-wheel'
)
# Upstream has no 1.22 SVN tag; r11079 is the last code revision before the PyPI 1.22 release.
_revision=11079
_sourceurl="${url%/*}/!svn/bc/${_revision}/${_pkgname}/trunk"
source=(
	"${_pkgname}-${pkgver}-COPYING::${_sourceurl}/COPYING"
	"${_pkgname}-${pkgver}-Makefile::${_sourceurl}/Makefile"
	"${_pkgname}-${pkgver}-red_black_tree_mod.m4::${_sourceurl}/red_black_tree_mod.m4"
	"${_pkgname}-${pkgver}-setup.py::${_sourceurl}/setup.py"
	"${_pkgname}-${pkgver}-test-red_black_tree_mod::${_sourceurl}/test-red_black_tree_mod"
)
b2sums=(
	'939da4554c6cb4dd1b05cb6a4f9a8247bf32772718142d3795d1a72e120891099c927dac87ed4d58e886fc14d56e80f79840ed1bb59d385e4ecac58921af0457'
	'8b9b88c3aba2731467c7b77850fc115dbf1a29deb88d4d3d46a369e1c8ee8864ee2db3fb49f014a738ed7c582642c83b8cae3dbfc181239a4333b9cc6ff9d161'
	'405766aca0fa0d9baeee2cb297bcb9f1490afe9d88202e5b66d6a6c2c87111dfad740703b340bbbcf9159fe6ffa04f3a1577a1c343bd1f33540eecb8bf7979f8'
	'4576eac85dd368da20afd48dd7bca328dcee1e7261a63205370649ccb2a1660364202a6a2c5d4796f2be01759fc941754359b6628bbc47f97106e0c4a26c295b'
	'bc4c6c3e5bfad9bf9a652b2945f65996be73fa6d4af052e800bc8fec286ec5cc8a9cafdf96ff713edee13cbae80052fb4400acfe0a794a7337ce97d59a3d7cea'
)

prepare() {
	cd -- "${srcdir}" || return 1
	local file
	mkdir -p -- "${_pkgname}-${pkgver}" || return 1
	for file in 'COPYING' 'Makefile' 'red_black_tree_mod.m4' 'setup.py' 'test-red_black_tree_mod'; do
		cp -- "${_pkgname}-${pkgver}-${file}" "${_pkgname}-${pkgver}/${file}" || return 1
	done
}

build() {
	cd -- "${srcdir}/${_pkgname}-${pkgver}" || return 1
	make red_black_set_mod.py red_black_dict_mod.py || return 1
	python -m build --wheel --no-isolation
}

check() {
	cd -- "${srcdir}/${_pkgname}-${pkgver}" || return 1
	PYTHONPATH="${PWD}/build/lib" python -P test-red_black_tree_mod
}

package() {
	cd -- "${srcdir}/${_pkgname}-${pkgver}" || return 1
	python -m installer --destdir="${pkgdir}" --compile-bytecode 2 dist/*.whl || return 1
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
