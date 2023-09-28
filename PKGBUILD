# Maintainer: Sir-Photch <sir-photch@posteo.me>

pkgname=python-signalstickers-client
_pkgname=${pkgname#python-}
pkgver=3.3.0
pkgrel=1
pkgdesc='Python client for Signal stickers'
arch=(any)
url='https://pypi.org/project/signalstickers-client/'
license=(LGPL3)
depends=(
	'python'
	'python-anyio'
	'python-protobuf'
	'python-cryptography'
	'python-httpx'
)
makedepends=(
	'python-build'
	'python-installer'
)

source=(
	"https://files.pythonhosted.org/packages/source/s/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
	"https://raw.githubusercontent.com/signalstickers/${_pkgname}/master/tests/mock_httpx.py"
	"https://github.com/signalstickers/${_pkgname}/raw/master/tests/test_data/8f827147a008bf8b24f4188be657aead/0.bin"
	"https://github.com/signalstickers/${_pkgname}/raw/master/tests/test_data/8f827147a008bf8b24f4188be657aead/1.bin"
	"https://github.com/signalstickers/${_pkgname}/raw/master/tests/test_data/8f827147a008bf8b24f4188be657aead/manifest.bin"
)
sha256sums=(
	'e5b7bf49d561087f2517656adac269b7d47d86d18efb08fe43b0a9f12f0d657a'
	'6f49b3109d8b86c983e4e61f02799471ee984d7b66773b569749f77af2af6704'
	'fa642ce1a7bf458f9d7d92e1e0337b57991782037d86651d237755154cf6cc4d'
	'904e84864ebc9055cf5e80e1d6e1d69f9475f759ef69f4838a952202fc978ac9'
	'67926f3dbe79dab67fce4203c9e889a510f8b1cc22352a0c8084687ca7708d4d'
)

build() {
	cd "${_pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

check() {
	# these sourcefiles and test-files are missing from the pypi tarball and are required for tests to run
	mv mock_httpx.py "${srcdir}/${_pkgname}-${pkgver}/tests"
	testdata_dir="${srcdir}/${_pkgname}-${pkgver}/tests/test_data/8f827147a008bf8b24f4188be657aead"
	mkdir -p "${testdata_dir}"
	mv 0.bin "${testdata_dir}"
	mv 1.bin "${testdata_dir}"
	mv manifest.bin "${testdata_dir}"

	cd "${srcdir}/${_pkgname}-${pkgver}"	
	pytest
}

package() {
	cd "${_pkgname}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
}


