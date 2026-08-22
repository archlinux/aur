# Maintainer: a821 at mail de
# Contributor: Sander Vocke <sandervocke@gmail.com>

_pkgname=py-build-cmake
pkgname=python-py-build-cmake
pkgver=0.5.1
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
sha512sums=('40b231ce35ea6b0bfce11ca65f5bd1471d6f8b921f137dd272328ca81beb042b326f557b1ab508139cca68c4b073143aaa47b89883252ecfb6d644873618c58e')

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
