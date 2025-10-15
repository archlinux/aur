# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=python-llm-anthropic
_gitpkgname=llm-anthropic
pkgver=0.20
pkgrel=1
pkgdesc='LLM plugin for models hosted by Anthropic, including the Claude series'
arch=('any')
url='https://github.com/simonw/llm-anthropic'
license=('Apache-2.0')
depends=(
  'python'
  'python-anthropic>=0.70'

  # Undeclared transitive dependency of `python-anthropic`.
  # Remove once added there.
  'python-docstring-parser'

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
  'python-pytest-asyncio'
  'python-pytest-recording'
)

source=(
  "${_gitpkgname}-${pkgver}.tar.gz::https://github.com/simonw/llm-anthropic/archive/${pkgver}.tar.gz"
)

sha512sums=('edbd2d340cecf22322ccde73f9c68cbdb517714c719dbf61dc1cfea5b6e5064bf8ffd1bf8cf6b3923608019093ed7855757a9b5fe43f5b56cf55f112f05a515b')

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
