# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-pyproject-patcher
_gitpkgname=pyproject-patcher
pkgver=0.1.1
pkgrel=1
# shellcheck disable=SC2016  # Not meant to expand
pkgdesc='Collection of convenience functions to patch `pyproject.toml` in place'
arch=('any')
url='https://github.com/claui/pyproject-patcher'
license=('Apache-2.0')
depends=(
  'python'
  'python-colorama'
  'python-distlib'
  'python-inplace'
  'python-tomlkit'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-poetry-core'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
)

source=(
  "${_gitpkgname}-${pkgver}.tar.gz::https://github.com/claui/pyproject-patcher/archive/v${pkgver}.tar.gz"
)

sha512sums=(
  '78a868d238bc1e7746e6245b5ae49ec1baccdf0d914cacfc40b3ab898a288ea9b7db8bcb512016c0b4cce78574bc8cd9b070f57c82b558c69d7f027ef916d2f9'
)

build() {
  cd "${_gitpkgname}-${pkgver}"
  echo >&2 'Building wheel'
  python -m build --wheel --no-isolation
}

check() {
  cd "${_gitpkgname}-${pkgver}"
  echo >&2 'Running unit tests'
  python -m pytest
}

package() {
  cd "${_gitpkgname}-${pkgver}"

  echo >&2 'Packaging the wheel'
  python -I -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    'README.md'

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    'LICENSE'
}
