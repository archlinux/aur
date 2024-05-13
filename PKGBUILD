# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-miepython
pkgdesc='Mie scattering of light off perfect spheres'
pkgver=2.5.4
pkgrel=1
arch=('any')
url='https://miepython.readthedocs.io/'
license=('MIT')

depends=('python-matplotlib' 'python-numba' 'python-numpy')
optdepends=(
  'jupyter-notebook: to run the included example notebooks'
  'python-scipy: to run the included examples'
)
checkdepends=('jupyter-nbconvert' 'jupyter-nbformat' 'python-pytest' 'python-scipy')
makedepends=(
  'python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm'
  'python-wheel'
)

_pyname=miepython
source=(
  "$_pyname-$pkgver.tar.gz::https://github.com/scottprahl/$_pyname/archive/$pkgver.tar.gz"
)
sha256sums=(
  '1fb677017e1ac33cb764a18c038ccc5d16848e7fb3d043294d72b6d89947fe32'
)

build() {
  cd "$_pyname-$pkgver"
  python -m build --no-isolation --wheel
}

check() {
  cd "$_pyname-$pkgver"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer "dist/$_pyname-$pkgver"-*.whl
  test-env/bin/python -m pytest -v --notebooks
}

package() {
  cd "$_pyname-$pkgver"
  python -m installer --destdir="$pkgdir" "dist/$_pyname-$pkgver"-*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
  install -m755 -d "$pkgdir/usr/share/$pkgname/examples"
  install -m755 -d "$pkgdir/usr/share/$pkgname/examples/notebooks"
  install -m644 -t "$pkgdir/usr/share/$pkgname/examples" miepython/examples/*.py
  install -m644 -t "$pkgdir/usr/share/$pkgname/examples/notebooks" docs/*.ipynb
}
