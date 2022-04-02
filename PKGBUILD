# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-numpy-quaternion
pkgver=2022.4.1
pkgrel=1
pkgdesc="Add built-in support for quaternions to NumPy"
url="https://quaternion.readthedocs.io/"
arch=('x86_64')
license=('MIT')
depends=('python-numpy' 'python-scipy')
optdepends=(
  "python-numba: speedup of numerical functions"
)
makedepends=(
  'python-build' 'python-installer' 'python-setuptools'
  'python-wheel' 'python-oldest-supported-numpy'
)
checkdepends=('python-pytest' 'python-pytest-cov')

_pypi=numpy-quaternion
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
)
sha256sums=(
  '88dc0f923ee18e0ccb0321ace311fb17acc3973cd72ff4284bb07f8460fe0b58'
)

build() {
    cd "$_pypi-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_pypi-$pkgver"
    PYVER=$(python -c 'import sys; print("{}.{}".format(*sys.version_info[:2]))')
    PYTHONPATH="$PWD/build/lib.linux-$CARCH-$PYVER" pytest --no-cov
}

package() {
    cd "$_pypi-$pkgver"
    python -m installer --destdir="$pkgdir" "dist/numpy_quaternion-$pkgver-"*.whl
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
