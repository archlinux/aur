# Maintainer: @RubenKelevra <rubenkelevra@gmail.com>
# Contributor: devome <evinedeng@hotmail.com>

_pkgname='ebcdic'
pkgname="python-${_pkgname}"
pkgver=2.0.1
pkgrel=1
pkgdesc='Additional EBCDIC codecs'
arch=('any')
url='https://github.com/roskakori/CodecMapper'
license=(
	'BSD-2-Clause'
	'Python-2.0.1'
)
depends=('python>=3.9')
makedepends=(
	'ant>=1.8'
	'java-environment>=7'
	'python-build'
	'python-flit-core>=3.12'
	'python-installer'
	'python-wheel'
)
checkdepends=('python-pytest>=8.4.1')
# Upstream published 2.0.1 without a tag; this is its release commit.
_commit='e125113c9bf056f9cebb622efbb42e1068c5f7d6'
# tools/gencodec.py and its generated codec implementation derive from Python 3.2.
_python_license_version='3.2.6'
source=(
	"${_pkgname}-${pkgver}.tar.gz::${url}/archive/${_commit}.tar.gz"
	"python-${_python_license_version}-LICENSE::https://raw.githubusercontent.com/python/cpython/v${_python_license_version}/LICENSE"
	'offline-build.patch'
)
b2sums=(
	'95d344c34239b2106376298b8e27e760f58f669664c567dd51ba1865689d4347f0fff2aff4e00f8e31a997fe73a8b1a454eba9d38771023e7904c6098c11d94e'
	'f6b2c25ae67e78737a9f3ed10530d06c69c72b8986dbc47f1a71c067cc8ecf5859265cb2c1c930de051d4d1437a1f7de4568460207eaaed9a259684582a903fa'
	'f46df38342870d63098b50a9f55b24ce2d04df804ea5724edeb5701eb34c264b2278d37822aa19be27185b351f17cc46eed5cc0948c4d36766b645c7abf6f643'
)

prepare() {
	cd -- "${srcdir}/CodecMapper-${_commit}" || return 1
	grep -Fxq "__version__ = \"${pkgver}\"" "${_pkgname}/${_pkgname}/_version.py" || return 1
	patch -Np1 -i "${srcdir}/offline-build.patch"
	# Keep the upstream tests out of the runtime wheel.
	mv -- "${_pkgname}/${_pkgname}/test" "${_pkgname}/tests"

	cp -- "${srcdir}/python-${_python_license_version}-LICENSE" "${_pkgname}/LICENSE.python"
	printf '\n\nCodecMapper generator provenance and changes:\n\n' >> "${_pkgname}/LICENSE.python"
	sed -n '1,/^"""$/p' tools/gencodec.py >> "${_pkgname}/LICENSE.python"
}

build() {
	cd -- "${srcdir}/CodecMapper-${_commit}" || return 1
	ant -noinput ebcdic
	cd -- "${_pkgname}" || return 1
	python -m build --wheel --no-isolation
}

check() {
	cd -- "${srcdir}/CodecMapper-${_commit}/${_pkgname}" || return 1
	PYTEST_DISABLE_PLUGIN_AUTOLOAD=1 python -m pytest -q
}

package() {
	cd -- "${srcdir}/CodecMapper-${_commit}/${_pkgname}" || return 1
	python -m installer --destdir="${pkgdir}" --compile-bytecode 2 dist/*.whl
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 LICENSE.python "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.python"
}
