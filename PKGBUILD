# Maintainer: Blair Bonnett <blair dot bonnett at gmail>

pkgname=python-numba-kdtree
pkgdesc="A k-d tree implementation for numba"
pkgver=0.1.8
pkgrel=1
url='https://github.com/mortacious/numba-kdtree'
arch=('x86_64')
license=('MIT')

depends=('python-numba')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-plyfile' 'python-pytest' 'python-scipy')

_pkgname='numba-kdtree'
source=(
  "$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=(
  'e713e847ba39d522c9a9a56c25f91cdb14e970f2b27fe68bb674d4205702fcb6'
)

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')

  # Exporting PYTHONPATH and running the tests from srcdir fails as pytest
  # modifies the path so it tries to import an unbuilt version of the library.
  cd "build/lib.linux-$CARCH-cpython-${python_version}"
  cp -r ../../tests .
  pytest -v -k "not construct_in_numba_function"
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
