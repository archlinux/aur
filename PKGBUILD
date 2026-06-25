# Maintainer: a821 at mail de
# Contributor: Sander Vocke <sandervocke@gmail.com>

_pkgname=py-build-cmake
pkgname=python-py-build-cmake
pkgver=0.5.0
pkgrel=1
pkgdesc='PEP 517 compliant build backend for creating Python packages with extensions built using CMake'
arch=('any')
url='https://github.com/tttapa/py-build-cmake'
license=('MIT')
depends=(
    'python'
    'python-click'
    'python-distlib'
    'python-lark-parser'
    'python-packaging'
    'python-pyproject-metadata'
    'python-tomli'
)
makedepends=('git' 'python-build' 'python-installer')
checkdepends=('python-pytest')
source=("git+$url#tag=$pkgver")
sha512sums=('f7a4bdd7e17194ac7ebb0a31ed664da7324d72d0a90f1bef6ca4bd675237d3a4a5b507a71c7da44252b34ff8abd7ff61b9440fbe7f35790f98b074344f1f1287')

prepare() {
  cd $_pkgname
  # this syncs python-pyproject-metadata's version in Arch repo
  sed -i 's/~=0.9.1/~=0.9/' pyproject.toml
}

build() {
  cd $_pkgname
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $_pkgname
  PYTHONPATH=src pytest
}

package() {
  cd $_pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm755 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
