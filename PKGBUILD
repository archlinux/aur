# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-numpy-quaternion
pkgver=2024.0.13
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
  'git'
  'python-build'
  'python-hatchling'
  'python-installer'
  'python-setuptools'
)
checkdepends=(
 'python-pytest'
 'python-pytest-cov'
)

source=(
  "git+https://github.com/moble/quaternion.git#tag=v$pkgver"
)
sha256sums=(
  'dd724c650e5d2d188945ec2fbc595aed4733f62894ea677d0c9a014a28421e4c'
)

build() {
  cd quaternion
  python -m build --wheel --no-isolation
}

check() {
  cd quaternion
  rm -rf test-env
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer "dist/numpy_quaternion-$pkgver-"*.whl
  test-env/bin/python -m pytest --no-cov
}

package() {
  cd quaternion
  python -m installer --destdir="$pkgdir" "dist/numpy_quaternion-$pkgver-"*.whl
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
