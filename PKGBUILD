# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=python-llm-gemini
_gitpkgname=llm-gemini
pkgver=0.26
pkgrel=1
pkgdesc="LLM plugin to access Google's Gemini family of models"
arch=('any')
url='https://github.com/simonw/llm-gemini'
license=('Apache-2.0')
depends=(
  'python'
  'python-click'
  'python-httpx'
  'python-llm'
  'python-ijson'
  'python-pydantic'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
)
checkdepends=(
  'python-inline-snapshot'
  'python-pytest'
  'python-pytest-recording'
)

source=(
  "${_gitpkgname}-${pkgver}.tar.gz::https://github.com/simonw/llm-gemini/archive/${pkgver}.tar.gz"
)

sha512sums=('833dcbf9e741980c72c60a08ce1bbdf8976a198a46a62c0bab10dbaa6bbec3c6be12a8c108c9bb6e70a8bb68fff4cdeb56ad52249789b7802643724fc7bf4f37')

build() {
  cd "${_gitpkgname}-${pkgver}"
  echo >&2 'Building wheel'
  python -m build --wheel --no-isolation
}

check() {
  cd "${_gitpkgname}-${pkgver}"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl

  echo >&2 'Running unit tests'
  test-env/bin/python -m pytest
}

package() {
  cd "${_gitpkgname}-${pkgver}"

  echo >&2 'Packaging the wheel'
  python -I -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    README.md

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE
}
