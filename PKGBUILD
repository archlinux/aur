# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-tree-sitter-embedded-template
_gitpkgname=tree-sitter-embedded-template
pkgver=0.23.2
pkgrel=1
pkgdesc='Tree-sitter grammar for embedded template languages like ERB, EJS'
arch=('x86_64')
url='https://github.com/tree-sitter/tree-sitter-embedded-template'
license=('MIT')
depends=('python')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest' 'python-tree-sitter')

source=(
  "${_gitpkgname}-${pkgver}.tar.gz::https://github.com/tree-sitter/tree-sitter-embedded-template/archive/v${pkgver}.tar.gz"
)

sha512sums=(
  'd842e29a980461d4872e74a2ad5ffd9cb2c96e14d811cd39621afc016c250dbcb1aca8c377822e3edeac6e465a7b793b803d0825c151e660394f6a8d6098b46f'
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
