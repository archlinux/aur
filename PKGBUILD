# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-numpy-quaternion
pkgver=2022.4.3
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
  'ca37256f544a7e587ab08c1841a30e34aa7b85c7c9663527c61d77fbcad9dda7'
)

build() {
    cd "$_pypi-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_pypi-$pkgver"
    local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
    PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-${python_version}" pytest --no-cov
}

package() {
    cd "$_pypi-$pkgver"
    python -m installer --destdir="$pkgdir" "dist/numpy_quaternion-$pkgver-"*.whl
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
