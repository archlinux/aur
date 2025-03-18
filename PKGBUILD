# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-llm-openrouter
_gitpkgname=llm-openrouter
pkgver=0.4
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

sha512sums=('56ac78e1a8b85e2cf3b0c9d115a9bd12550c54a93790c09e52c742913c57e51fbeecb09b80c2dabe1b8d46495a46d7e1fe025d8b59fb072d32f959177ede4470')

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
