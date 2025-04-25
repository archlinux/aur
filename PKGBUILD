# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-llm-openrouter
_gitpkgname=llm-openrouter
pkgver=0.4.1
pkgrel=1
pkgdesc='LLM plugin for models hosted by OpenRouter'
arch=('any')
url='https://github.com/simonw/llm-openrouter'
license=('Apache-2.0')
depends=(
  'python'
  'python-httpx'
  'python-llm'
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
  "${_gitpkgname}-${pkgver}.tar.gz::https://github.com/simonw/llm-openrouter/archive/${pkgver}.tar.gz"
)

sha512sums=('2ddb4c8a939286d57d1278b7dde7507a0eeaf9185d18b050f8a9b5accb31e0bcd6d8160eb39ec0cc01acda5335641aae20fa911716894ad93f3fa4484585f7df')

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
