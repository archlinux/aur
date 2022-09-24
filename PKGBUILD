# Maintainer: Blair Bonnett <blair dot bonnett at gmail>

pkgname=python-numba-kdtree
pkgdesc="A k-d tree implementation for numba"
pkgver=0.1.5
pkgrel=1
url='https://github.com/mortacious/numba-kdtree'
arch=('x86_64')
license=('MIT')

depends=('python-numba')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-scipy')

_pkgname='numba-kdtree'
source=(
  "$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  "fix_tests.patch"
)
sha256sums=(
  '39dadafd85748d938068d2552514d9f1c53f921fa514baa3ec5b95f8591c1843'
  'cc48fdd6cf0dcb0a2b5ca77a74de5e8594505a324200353e9597a2d90c3fc10c'
)

prepare() {
  cd "$_pkgname-$pkgver"
  patch -p0 -i "$srcdir/fix_tests.patch"
}

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-${python_version}" pytest -v
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
