# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-tree-sitter-embedded-template
_gitpkgname=tree-sitter-embedded-template
pkgver=0.25.0
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

sha512sums=('259725024c11214f2d9b3e653536112029631f05475e1082cea6bcaf97ba07c5741d55fa031036ba128e0bf92f8fe10a512571b6729035779f7ab3017b001a37')

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
