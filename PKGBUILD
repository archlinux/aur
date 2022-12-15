#  Maintainer: Blair Bonnett <blair.bonnett@gmail.com>
# Contributor: Maikel Wever <maikelwever@gmail.com>

pkgname=python-numpy-stl
pkgver=3.0.0
pkgrel=1
pkgdesc="Library to make working with STL files (and 3D objects in general) fast and easy"
url="https://github.com/WoLpH/numpy-stl/"
license=('BSD')
depends=('python' 'python-numpy' 'python-utils')
makedepends=('cython' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-cov' 'xorg-server-xvfb')
source=(
  "numpy-stl-v${pkgver}.tar.gz::https://github.com/WoLpH/numpy-stl/archive/v${pkgver}.tar.gz"
)
sha256sums=(
  'f692e107cd4d2fdc74f5669feea38c63ab38feee072d950763d5cd89571ce9e8'
)
arch=('x86_64')

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
