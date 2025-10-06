# Maintainer: Blair Bonnett <blair.bonnett@gmail.com>

pkgname=python-pyvhdlmodel
pkgdesc='An abstract VHDL language model'
pkgver=0.31.3
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
  '7603c9693602582dde6cd82a782bfc54878cde3c31aee5a53321bfdd6792546a'
)

prepare() {
  cd "$_pyname-$pkgver"
  sed -i -e "s/pyTooling ~= 8.7/pyTooling/" pyproject.toml
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
