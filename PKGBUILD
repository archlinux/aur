# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=python-llm-gemini
_gitpkgname=llm-gemini
pkgver=0.30
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
  'python-nest-asyncio'
  'python-pytest'
  'python-pytest-asyncio'
  'python-pytest-recording'
)

source=(
  "${_gitpkgname}-${pkgver}.tar.gz::https://github.com/simonw/llm-gemini/archive/${pkgver}.tar.gz"
)

sha512sums=('5b607c65f0f066f1fb6e8aa8e2b52c4a4a6e067c0a5b48389eb6e4ebc2133a802bcaccab8ee4e9358ec2672c0a52b309d321780ba26ed11e61f61eabe0848975')

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
