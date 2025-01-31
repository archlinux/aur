# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-numpy-quaternion
pkgver=2024.0.7
pkgrel=1
pkgdesc="Add built-in support for quaternions to NumPy"
url="https://quaternion.readthedocs.io/"
arch=('x86_64')
license=('MIT')

depends=(
  'python-numpy'
  'python-scipy'
)
optdepends=(
  "python-numba: speedup of numerical functions"
)
makedepends=(
  'python-build'
  'python-hatchling'
  'python-installer'
  'python-setuptools'
)
checkdepends=(
 'python-pytest'
 'python-pytest-cov'
)

_pypi=numpy_quaternion
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/${_pypi/_/-}/$_pypi-$pkgver.tar.gz"
)
sha256sums=(
  '99f4c401c0330fb15b9c718b1b372248dd22dcd475fc0bd7dcff2fdcb688c257'
)

build() {
  cd "$_pypi-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pypi-$pkgver"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer "dist/numpy_quaternion-$pkgver-"*.whl
  test-env/bin/python -m pytest --no-cov
}

package() {
  cd "$_pypi-$pkgver"
  python -m installer --destdir="$pkgdir" "dist/numpy_quaternion-$pkgver-"*.whl
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
