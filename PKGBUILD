# Maintainer: @RubenKelevra <rubenkelevra@gmail.com>

_pkgname='isaacus'
_repo="${_pkgname}-python"
_commit='b265b7c84274f4f1953de579c71d896a52f0a106'
pkgname="python-${_pkgname}"
pkgver=0.22.0
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
	'cb7e82b253aa37cd96c5401ea905064e558ea689f2b9313db4ac61d73c29f2a436841ec60a20068311aeeda2e049cde56f872ab2da91bb541db3e6d6d5bb79f7'
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
