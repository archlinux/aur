# Maintainer: Blair Bonnett <blair dot bonnett at gmail>

pkgname=python-numba-kdtree
pkgdesc="A k-d tree implementation for numba"
pkgver=0.5.0
pkgrel=1
url='https://github.com/mortacious/numba-kdtree'
arch=('x86_64')
license=('MIT')

depends=(
  'gcc-libs'
  'glibc'
  'python-llvmlite'
  'python-numba'
  'python-numpy'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools-scm'
  'python-wheel'
)
checkdepends=(
  'python-plyfile'
  'python-pytest'
  'python-scipy'
)

source=(
  "git+https://github.com/mortacious/numba-kdtree.git#tag=v$pkgver"
)
sha256sums=(
  '9497a0d200170d1b1d274fd8817e61f41cf14efdeee348f071c5ecc1c612dbc0'
)

build() {
  cd numba-kdtree
  python -m build --wheel --no-isolation
}

check() {
  cd numba-kdtree
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
  cd numba-kdtree
  python -m installer --destdir="$pkgdir" "dist/numba_kdtree-$pkgver"-*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
