# Maintainer: Dennis Herbrich <dennis.herbrich@veloxis.de>
pkgname=openapi-python-client
pkgver=0.29.0
pkgrel=1
pkgdesc='Generate modern Python clients from OpenAPI 3.0 and 3.1 documents'
arch=('any')
url='https://github.com/openapi-generators/openapi-python-client'
license=('MIT')
depends=(
  'python>=3.11'
  'python-jinja>=1:3.0.0'
  'python-jinja<1:4.0.0'
  'python-typer>0.16'
  'python-typer<0.27'
  'python-pydantic>=2.10'
  'python-pydantic<3.0.0'
  'python-attrs>=22.2.0'  # see https://github.com/openapi-generators/openapi-python-client/issues/1084
  'python-httpcore>=1.0.0'  # implicit by python-httpx, explicitly used in source (once)
  'python-httpx>=0.23.1'
  'python-httpx<0.29.0'
  'python-ruamel-yaml>=0.18.6'
  'python-ruamel-yaml<0.20.0'
  )
makedepends=(
  'python-pdm>=2.26.3'
  'python-hishel>=1.0.0'
  'python-hatchling'
  'python-build'
  'python-installer'
  'python-wheel'
  )
optdepends=(
  'python-pdm>=2.12.0: use generated PDM metadata'
  'python-poetry: use generated Poetry metadata'
  'python-setuptools: use generated setuptools metadata'
  'python-uv-build>=0.11.0: use generated uv metadata'
  'ruff>=0.2: linter check of generated code'
)
changelog=CHANGELOG.md
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/openapi-generators/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d51db552c8118bd8e8f5de97b3d1ebabad6bdf6e174a10ea7b536adac2e08a27')

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
