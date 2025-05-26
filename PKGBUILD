# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-miepython
pkgdesc='Mie scattering of light off perfect spheres'
pkgver=3.0.2
pkgrel=1
arch=('any')
url='https://miepython.readthedocs.io/'
license=('MIT')

depends=(
  'python-matplotlib'
  'python-numba'
  'python-numpy'
  'python-scipy'
)
optdepends=(
  'jupyter-notebook: to run the included example notebooks'
)
checkdepends=(
  'jupyter-nbconvert'
  'jupyter-nbformat'
  'python-pytest'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
  'python-wheel'
)

source=(
  "git+https://github.com/scottprahl/miepython.git#tag=$pkgver"
)
sha256sums=(
  'b77217a8f5dbcc38515fd3f2e01afac35ab2e6a93cf120c30ea3b54c09a2c341'
)

build() {
  cd miepython
  python -m build --no-isolation --wheel
}

check() {
  cd miepython
  rm -rf test-env
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer "dist/miepython-$pkgver"-*.whl
  test-env/bin/python -m pytest
}

package() {
  cd miepython
  python -m installer --destdir="$pkgdir" "dist/miepython-$pkgver"-*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
  install -m755 -d "$pkgdir/usr/share/$pkgname/examples"
  install -m755 -d "$pkgdir/usr/share/$pkgname/examples/notebooks"
  install -m644 -t "$pkgdir/usr/share/$pkgname/examples" miepython/examples/*.py
  install -m644 -t "$pkgdir/usr/share/$pkgname/examples/notebooks" docs/*.ipynb
}
