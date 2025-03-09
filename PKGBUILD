# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-tree-sitter-yaml
_gitpkgname=tree-sitter-yaml
pkgver=0.7.0
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

sha512sums=(
  'cc3981ae9e41984107dc45e04cd870950bb49ba84f1ac57e968fb6a8ea4e37c34f4ae70a5caacf4b86e14a04ae86d6545aee44840df6b01492bebf07892c3f57'
)

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
