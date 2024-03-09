# Maintainer: Dennis Herbrich <dennis.herbrich@veloxis.de>
pkgname=openapi-python-client
pkgver=0.19.0
pkgrel=1
pkgdesc='Generate modern Python clients from OpenAPI 3.0 and 3.1 documents'
arch=('any')
url='https://github.com/openapi-generators/openapi-python-client'
license=('MIT')
depends=(
  'python>=3.8'
  'python-jinja>=3.0.0'
  'python-typer>0.6'
  # 'python-shellingham>=1.3.2'  # NOTE: declared, but seemingly unused
  'python-pydantic>=2.1.1'
  'python-attrs>=21.3.0'
  'python-dateutil>=2.8.1'
  'python-httpcore>=1.0.0'  # implicit by python-httpx, explicitly used in source (once)
  'python-httpx>=0.20.0'
  'python-yaml>=6.0'
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
  'python-ruff>=0.2: linter support in generated code'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/openapi-generators/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('79705cf290f50261df1a725362f77b9e3e0f87a8ee5c7fd8935610099a12313e')

build() {
  cd "${pkgname}-${pkgver}"
  pdm build --no-sdist --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# NOTE: check() with `pdm run test` deliberately not included. Too much of a
# hassle to get running properly, and checkdepends on a handful of (orphaned)
# AUR packages as well. Not worth the effort, IMHO.
