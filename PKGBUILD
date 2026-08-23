# Maintainer: @RubenKelevra <rubenkelevra@gmail.com>

_pkgname='isaacus'
_repo="${_pkgname}-python"
_commit='640547832859f180d0668eac81a7ba7cbcfdc906'
pkgname="python-${_pkgname}"
pkgver=0.22.1
pkgrel=1
pkgdesc='Official Python library for the Isaacus API'
arch=('any')
url="https://github.com/isaacus-dev/${_repo}"
license=('Apache-2.0')
depends=(
	'python>=3.9'
	'python-httpx>=0.23.0'
	'python-httpx<1'
	'python-pydantic>=1.9.0'
	'python-pydantic<3'
	'python-typing_extensions>=4.14'
	'python-typing_extensions<5'
	'python-anyio>=3.5.0'
	'python-anyio<5'
	'python-distro>=1.7.0'
	'python-distro<2'
	'python-sniffio'
)
makedepends=(
	'python-build'
	'python-hatch-fancy-pypi-readme'
	'python-hatchling>=1.26.3'
	'python-installer'
	'python-wheel'
)
checkdepends=(
	'python-dirty-equals'
	'python-httpx-aiohttp>=0.1.9'
	'python-pytest'
	'python-pytest-asyncio'
	'python-pytest-xdist'
	'python-respx'
)
optdepends=('python-httpx-aiohttp>=0.1.9: aiohttp-based asynchronous HTTP backend')
source=(
	"${_pkgname}-${pkgver}.tar.gz::${url}/archive/${_commit}.tar.gz"
	'test_aiohttp_backend.py'
)
b2sums=(
	'168e891341c619330526c05c13a0a3801cb40fa1b33660eb115b9cdae956bde9f27ef47685105482af0a7ed58e8c4407ee24fc5f912cd6e13c9a63632405b269'
	'a7b12ee49973a66f84a332a0b5a0c4dbccabf6cc3bfec01e678e8cc045b4f845b86e818c3c60681f893b3ebb9629b236c10b3b2f9c49ddad4d879072231bb333'
)

_srcdir="${_repo}-${_commit}"

prepare() {
	cd -- "${_srcdir}" || return 1
	grep -Fqx -- "version = \"${pkgver}\"" pyproject.toml
	sed -i 's/"hatchling==1.26.3"/"hatchling>=1.26.3"/' pyproject.toml
	grep -Fqx -- 'requires = ["hatchling>=1.26.3", "hatch-fancy-pypi-readme"]' pyproject.toml
}

build() {
	cd -- "${_srcdir}" || return 1
	python -m build --wheel --no-isolation
}

check() {
	cd -- "${_srcdir}" || return 1
	PYTHONPATH=src pytest
	PYTHONPATH=src python "${srcdir}/test_aiohttp_backend.py"
}

package() {
	cd -- "${_srcdir}" || return 1
	python -m installer --destdir="${pkgdir}" --compile-bytecode=2 dist/*.whl
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
