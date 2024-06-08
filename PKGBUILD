# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-pyproject-patcher
_gitpkgname=pyproject-patcher
pkgver=0.2.1
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
  'python-typing_extensions'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-poetry-core'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
  'python-setuptools-git-versioning'
)

source=(
  "${_gitpkgname}-${pkgver}.tar.gz::https://github.com/claui/pyproject-patcher/archive/v${pkgver}.tar.gz"
)

sha512sums=('b096addc392a2ccf3755a2130a73c153908c0bf1c36d7ff688dd488ff6fc9db3d2900801a920f97c1987b02dcf972c84167e827c7adb51b34226f0a9bf02c842')

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
