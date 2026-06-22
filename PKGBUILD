# Maintainer: Blair Bonnett <blair.bonnett@gmail.com>

pkgname=python-pyvhdlmodel
pkgdesc='An abstract VHDL language model'
pkgver=0.35.0
pkgrel=1
arch=('any')
url='https://github.com/VHDL/pyVHDLModel'
license=('Apache-2.0')

depends=(
  'python-pytooling'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
  'python-pytest-cov'
)

_commit=6a832c3
source=(
  "git+https://github.com/VHDL/pyVHDLModel.git?signed#commit=$_commit"
)
sha256sums=(
  '0fb573b998d4ad04dc35bf79c60cf8a4e285f0ddde62b9ce1017565b04e2c077'
)
validpgpkeys=(
  '968479A1AFF927E37D1A566BB5690EEEBB952194'  # GitHub signing key
)

prepare() {
  cd pyVHDLModel
  sed -i -e "s/pyTooling ~= 8.8/pyTooling/" pyproject.toml
  sed -i -e "s/wheel ~= 0.45.0/wheel/" pyproject.toml
}

build() {
  cd pyVHDLModel
  python -m build --no-isolation --wheel
}

check() {
  cd pyVHDLModel
  rm -rf testenv
  python -m venv --system-site-packages testenv
  testenv/bin/python -m installer dist/pyvhdlmodel-"$pkgver"*.whl
  testenv/bin/python -m pytest tests \
    -o python_files='*' -o python_functions='test_*'
}

package() {
  cd pyVHDLModel
  python -m installer --destdir="$pkgdir" dist/pyvhdlmodel-"$pkgver"*.whl
}
