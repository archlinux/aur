# Maintainer: Claudia Pellegrino <auerhuhn@archlinux.org>

pkgname=python-tree-sitter-c-sharp
_gitpkgname=tree-sitter-c-sharp
pkgver=0.23.5
pkgrel=1
pkgdesc='C# grammar for tree-sitter'
arch=('x86_64')
url='https://github.com/tree-sitter/tree-sitter-c-sharp'
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
  'python-pytest'
  'python-tree-sitter'
)

source=(
  "${_gitpkgname}-${pkgver}.tar.gz::https://github.com/tree-sitter/tree-sitter-c-sharp/archive/v${pkgver}.tar.gz"
)

sha512sums=('c99f7d776bd8de04ebf8fbeaa31b98f37a3c9d8ec307c8415aa2172fa281e9332f0c2d4ef230421448ade5d51c7c7032e82cd7834ac74a999dc21f2821658223')

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
