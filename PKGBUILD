# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-llm-openrouter
_gitpkgname=llm-openrouter
pkgver=0.5
pkgrel=1
pkgdesc='LLM plugin for models hosted by OpenRouter'
arch=('any')
url='https://github.com/simonw/llm-openrouter'
license=('Apache-2.0')
depends=(
  'python'
  'python-click'
  'python-httpx'
  'python-llm'
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
  "${_gitpkgname}-${pkgver}.tar.gz::https://github.com/simonw/llm-openrouter/archive/${pkgver}.tar.gz"
)

sha512sums=('dbdd755089c6ab8775c851db98c11c44b419b4c7a22bcb03452dec9f8e1bb6077014b799d6c327af7c0c61a25ba7b901d1d3abfc0955ef75a67661ab56f54e2c')

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
