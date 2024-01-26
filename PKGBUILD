# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-numpy-quaternion
pkgver=2023.0.2
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
  'python-build' 'python-installer' 'python-setuptools' 'python-wheel'
)
checkdepends=('python-pytest' 'python-pytest-cov')

_pypi=numpy-quaternion
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
)
sha256sums=(
  '37f73d7f84c645bd9be95cb4862bd900b7f99bd2f801232006dde00641bf2fd7'
)

prepare() {
    cd "$_pypi-$pkgver"
    sed -i -e 's/, "oldest-supported-numpy"//' pyproject.toml
}

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
