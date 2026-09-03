# Maintainer: @RubenKelevra <rubenkelevra@gmail.com>

_pkgname='docling'
pkgname="python-${_pkgname}"
pkgver='2.124.0'
pkgrel=1
pkgdesc='Python SDK for parsing documents into a unified representation'
url="https://github.com/docling-project/${_pkgname}"
license=('MIT')
arch=('any')
depends=(
	'python>=3.10'
	'python-pydantic>=2.0.0'
	'python-docling-core>=2.91.0'
	'python-pydantic-settings>=2.3.0'
	'python-filetype>=1.2.0'
	'python-requests>=2.32.2'
	'python-certifi>=2024.7.4'
	'python-pluggy>=1.0.0'
	'python-tqdm>=4.65.0'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-hatchling'
	'python-wheel'
)
checkdepends=('python-pytest')
optdepends=('docling: command-line interface')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('9b6c7073f0bc717912651b5470f250d66ff31c68959cb326ad99ffde5072d19807987e4bf9f350429edb770884806ff6f7f6473ebd58aae7dfbf2f4e4c10776f')

build() {
	cd -- "${_pkgname}-${pkgver}" || return 1
	python -m build --wheel --no-isolation
}

check() {
	cd -- "${_pkgname}-${pkgver}" || return 1
	HF_HUB_OFFLINE=1 TRANSFORMERS_OFFLINE=1 python -m pytest -q \
		tests/test_service_datamodels.py \
		tests/test_settings_load.py \
		tests/test_backend_docling_json.py
}

package() {
	cd -- "${_pkgname}-${pkgver}" || return 1
	python -m installer --destdir="${pkgdir}" --compile-bytecode 2 dist/*.whl

	# The Python package exposes CLI modules, but the executable entry points
	# belong to the separate unprefixed docling application package.
	rm -- "${pkgdir}/usr/bin/docling" "${pkgdir}/usr/bin/docling-tools"
	rmdir -- "${pkgdir}/usr/bin"
	install -D -m644 -- LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
