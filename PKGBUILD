# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=python-llm-anthropic
_gitpkgname=llm-anthropic
pkgver=0.23
pkgrel=1
pkgdesc='LLM plugin for models hosted by Anthropic, including the Claude series'
arch=('any')
url='https://github.com/simonw/llm-anthropic'
license=('Apache-2.0')
depends=(
  'python'
  'python-anthropic>=0.75'
  'python-llm'
  'python-json-schema-to-pydantic'
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
  'python-pytest-asyncio'
  'python-pytest-recording'
)

source=(
  "${_gitpkgname}-${pkgver}.tar.gz::https://github.com/simonw/llm-anthropic/archive/${pkgver}.tar.gz"
)

sha512sums=('4ddff04905eebf002b40c33640a9a566837d4546030cac8ec4360d72f774efddc489f09f2b1e6eed893c9b73a1a4ef5159fd56fe70a9349fdef117047e428e77')

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
