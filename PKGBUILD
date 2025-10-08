# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-tree-sitter-yaml
_gitpkgname=tree-sitter-yaml
pkgver=0.7.2
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

sha512sums=('ad91f349db724af9feecb909a8f7b3eb0421b45432636f399d94ec48c9e0d7ece709d416c20949d2439c9de7aadf3d53762e2a74a97cb9115a94de81ce0914bf')

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
