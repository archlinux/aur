# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-tree-sitter-yaml
_gitpkgname=tree-sitter-yaml
pkgver=0.7.1
pkgrel=1
pkgdesc='YAML Grammar for tree-sitter'
arch=('x86_64')
url='https://github.com/tree-sitter-grammars/tree-sitter-yaml'
license=('MIT')
depends=(
  'glibc'
  'python'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest' 'python-tree-sitter'
)

source=(
  "${_gitpkgname}-${pkgver}.tar.gz::https://github.com/tree-sitter-grammars/tree-sitter-yaml/archive/v${pkgver}.tar.gz"
)

sha512sums=('dca046e3485896a4b536ffaca2673562dd67bcc405f0b795a9edbc7fa7ca5e7ed852a4e76ad598584638f70f1f727c5642bd4b12ef876fdf50677089b205e908')

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
