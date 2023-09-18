# Maintainer: Blair Bonnett <blair dot bonnett at gmail>

pkgname=python-numba-kdtree
pkgdesc="A k-d tree implementation for numba"
pkgver=0.3.0
pkgrel=1
url='https://github.com/mortacious/numba-kdtree'
arch=('x86_64')
license=('MIT')

depends=('python-numba')
makedepends=('python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-plyfile' 'python-pytest' 'python-scipy')

_pypi='numba-kdtree'
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
)
sha256sums=(
  '96c74547711cfb5a96a2336a7300b7e42c4f67e2f64bc479170d6a5c6261cb5c'
)

build() {
  cd "$_pypi-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pypi-$pkgver"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer "dist/numba_kdtree-$pkgver"-*.whl

  # Copy the tests into the environment and run from there. Running the tests
  # in their original location fails as pytest modifies the path so the tests
  # try and fail to import an unbuilt version of the library.
  cd test-env
  cp -r ../tests .
  bin/python -m pytest -v tests
}

package() {
  cd "$_pypi-$pkgver"
  python -m installer --destdir="$pkgdir" "dist/numba_kdtree-$pkgver"-*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
