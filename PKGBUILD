# Maintainer: Blair Bonnett <blair.bonnett@gmail.com>

pkgname=python-pyvhdlmodel
pkgdesc='An abstract VHDL language model'
pkgver=0.31.2
pkgrel=1
arch=('any')
url='https://github.com/VHDL/pyVHDLModel'
license=('Apache-2.0')

depends=(
  'python-pytooling'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
  'python-pytest-cov'
)

_pyname=pyVHDLModel
source=(
  "$_pyname-$pkgver.tar.gz::https://github.com/VHDL/pyVHDLModel/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=(
  'aa7ac198a27b9ea744a85ab08683bb4f43414198b518f1a53a9e3db2b23a5106'
)

prepare() {
  cd "$_pyname-$pkgver"
  sed -i -e "s/pyTooling ~= 8.4/pyTooling/" pyproject.toml
}

build() {
  cd "$_pyname-$pkgver"
  python -m build --no-isolation --wheel
}

check() {
  cd "$_pyname-$pkgver"
  rm -rf testenv
  python -m venv --system-site-packages testenv
  testenv/bin/python -m installer dist/pyvhdlmodel-"$pkgver"*.whl
  testenv/bin/python -m pytest -v tests/unit
}

package() {
  cd "$_pyname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/pyvhdlmodel-"$pkgver"*.whl
}
