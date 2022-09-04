#  Maintainer: Blair Bonnett <blair.bonnett@gmail.com>
# Contributor: Maikel Wever <maikelwever@gmail.com>

pkgname=python-numpy-stl
pkgver=2.17.1
pkgrel=3
pkgdesc="Library to make working with STL files (and 3D objects in general) fast and easy"
url="https://github.com/WoLpH/numpy-stl/"
license=('BSD')
depends=('python' 'python-numpy' 'python-utils')
makedepends=('cython' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-cov' 'xorg-server-xvfb')
source=(
  "numpy-stl-v${pkgver}.tar.gz::https://github.com/WoLpH/numpy-stl/archive/v${pkgver}.tar.gz"
  'skip-flake8.patch'
)
sha256sums=(
  '6228bd07cdb67bb3e4a67721146c425a6f2b0546dba8dfa082d7cf58642c0f1a'
  '4c55e93314ee8d3538b015a3a99c27fb11f187f262ff9eb7c651da116bf90577'
)
arch=('x86_64')

prepare() {
  cd "$srcdir/numpy-stl-$pkgver"
  patch -p0 -i "$srcdir/skip-flake8.patch"
}

build() {
  cd "$srcdir/numpy-stl-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir/numpy-stl-$pkgver"
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-${python_version}" pytest \
    -vv tests --cov-fail-under=50
}

package() {
  cd "$srcdir/numpy-stl-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
