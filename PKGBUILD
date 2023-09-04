# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=python-lief
pkgver=0.13.2
pkgrel=1
pkgdesc="Cross-platform library for parsing, modifying, and abstracting binary formats"
arch=('x86_64')
url="https://github.com/lief-project/lief"
license=('Apache')
depends=('python')
makedepends=(
cmake
python-setuptools
python-build
python-installer
python-wheel
ninja
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/lief-project/LIEF/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('c68ef94ee613c6557faccc135bdaba4322c2e044be2b806ceea1de763cc099cf')

prepare() {
  cd LIEF-${pkgver}
  # fix for https://github.com/lief-project/LIEF/issues/918
  sed -i '1 i\#include <cstdint>' include/LIEF/DEX/Field.hpp
}

build() {
  cd LIEF-${pkgver}
  PYTHONPATH="$PWD" python -m build api/python --wheel --no-isolation
}

package() {
  cd LIEF-${pkgver}
  PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" api/python/dist/*.whl
}
