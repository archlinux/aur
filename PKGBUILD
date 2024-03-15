# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-qualify
_gitpkgname=qualify
pkgver=0.1.1
pkgrel=1
# shellcheck disable=SC2016  # Not meant to be expanded
pkgdesc='Import top-level modules from a directory not on `sys.path`'
arch=('any')
url='https://github.com/claui/qualify'
license=('Apache-2.0')
depends=(
  'python-colorama'
  'python-wrapt'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-myst-parser'
  'python-poetry-core'
  'python-sphinx'
  'python-wheel'
)
checkdepends=('python-pytest')
options=('!strip')
source=("${_gitpkgname}-${pkgver}.tar.gz::https://github.com/claui/qualify/archive/v${pkgver}.tar.gz")
sha512sums=('ed7acebcda0c0e144b16b653dc99fdc259353081a52b5fb5846fbc2fb1f1eb9e506e267dd207c6059fc52b442d5b488cb4eea8d7a8118fe61eb5875da20db197')

build() {
  cd "${srcdir}/${_gitpkgname}-${pkgver}"
  echo >&2 'Building wheel'
  python -m build --wheel --no-isolation

  echo >&2 'Generating man page'
  sphinx-build -aqEW -b man doc/sphinx build/man
}

check() {
  cd "${srcdir}/${_gitpkgname}-${pkgver}"
  python -m pytest
}

package() {
  cd "${srcdir}/${_gitpkgname}-${pkgver}"

  echo >&2 'Packaging the wheel'
  python -I -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging README.md'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    'README.md'

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    'LICENSE'

  echo >&2 'Packaging the man page'
  install -D -m 644 -t "${pkgdir}/usr/share/man/man3" \
    build/man/*.3
}
