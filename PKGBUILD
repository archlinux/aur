# Maintainer: Blair Bonnett <blair.bonnett@gmail.com>

pkgname=python-pyvhdlmodel
pkgdesc='An abstract VHDL language model'
pkgver=0.33.1
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
  '1b8389c4e8e15e34d16a0832056fdde8a16a76f7828f62b3efb0e540ab194320'
)

prepare() {
  cd "$_pyname-$pkgver"
  sed -i -e "s/pyTooling ~= 8.8/pyTooling/" pyproject.toml
  sed -i -e "s/wheel ~= 0.45.0/wheel/" pyproject.toml
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
  testenv/bin/python -m pytest tests \
    -o python_files='*' -o python_functions='test_*'
}

package() {
  cd "$_pyname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/pyvhdlmodel-"$pkgver"*.whl
}
