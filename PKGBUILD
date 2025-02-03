# Maintainer: Dennis Herbrich <dennis.herbrich@veloxis.de>
pkgname=openapi-python-client
pkgver=0.23.1
pkgrel=1
pkgdesc='Generate modern Python clients from OpenAPI 3.0 and 3.1 documents'
arch=('any')
url='https://github.com/openapi-generators/openapi-python-client'
license=('MIT')
depends=(
  'python>=3.9'
  'python-jinja>=3.0.0'
  'python-typer>0.6'
  # 'python-shellingham>=1.3.2'  # NOTE: declared, but seemingly unused
  'python-pydantic>=2.1.1'
  'python-attrs>=22.2.0'  # see https://github.com/openapi-generators/openapi-python-client/issues/1084
  'python-dateutil>=2.8.1'
  'python-httpcore>=1.0.0'  # implicit by python-httpx, explicitly used in source (once)
  'python-httpx>=0.20.0'
  'python-ruamel-yaml>=0.18.6'
  'python-typing_extensions>=4.8.0'
  )
makedepends=(
  'python-pdm>2.12.0'
  'python-hatchling'
  'python-build'
  'python-installer'
  'python-wheel'
  )
optdepends=(
  'python-pdm>=2.12.0: use generated PDM metadata'
  'python-poetry: use generated Poetry metadata'
  'python-setuptools: use generated setuptools metadata'
  'ruff>=0.2,<=0.9: linter check of generated code'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/openapi-generators/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6ebbb44474960c55e32aa0e828f3961456393e33e7263d66fcbda4b4f5be31c2')

build() {
  cd "${pkgname}-${pkgver}"
  pdm build --no-sdist
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

check() {
  cd "${pkgname}-${pkgver}"
	pdm install
	pdm test
}
