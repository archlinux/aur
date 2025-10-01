# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=python-llm-mistral
_gitpkgname=llm-mistral
pkgver=0.15
pkgrel=1
pkgdesc='LLM plugin providing access to Mistral models using the Mistral API'
arch=('any')
url='https://github.com/simonw/llm-mistral'
license=('Apache-2.0')
depends=(
  'python'
  'python-click'
  'python-httpx'
  'python-httpx-sse'
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
  "${_gitpkgname}-${pkgver}.tar.gz::https://github.com/simonw/llm-mistral/archive/${pkgver}.tar.gz"
)

sha512sums=('c19a3647856f5160faff1668edd89c5d565e7b1ffd4d8ec747a963bb219883c953a4a712c1abb397c9f1c6fd907a4e7bb13ab28e9551da33e3b8ca0b4499c093')

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
