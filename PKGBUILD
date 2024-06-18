# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-pyproject-patcher
_gitpkgname=pyproject-patcher
pkgver=0.2.2
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
  'python-myst-parser'
  'python-poetry-core'
  'python-sphinx'
  'python-sphinx_rtd_theme'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
  'python-setuptools-git-versioning'
)

source=(
  "${_gitpkgname}-${pkgver}.tar.gz::https://github.com/claui/pyproject-patcher/archive/v${pkgver}.tar.gz"
)

sha512sums=('33a10d559c8b3ad8cf145c2c15068dfc5ec4eb696b54f5cfeabaf50779c2293ff9708ec09a4af5f1e6cfae654dde2f6066e3da1da65798165c39a2d72941ee7e')

build() {
  cd "${_gitpkgname}-${pkgver}"

  echo >&2 'Building wheel'
  python -m build --wheel --no-isolation

  echo >&2 'Generating man page'
  sphinx-build -aqEW -b man doc/sphinx build/man

  echo >&2 'Generating HTML documentation'
  sphinx-build -aqEW -b singlehtml doc/sphinx build/singlehtml
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
    'README.md' 'USAGE.md'
  install -D -m 644 -t "${pkgdir}/usr/share/man/man3" \
    build/man/*.3
  cp -R --preserve=mode -t "${pkgdir}/usr/share/doc/${pkgname}" \
    build/singlehtml/{index.html,_static}

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    'LICENSE'
}
