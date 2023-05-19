# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-miepython
pkgdesc='Mie scattering of light off perfect spheres'
pkgver=2.3.2
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
  "$_pyname-$pkgver.tar.gz::https://github.com/scottprahl/$_pyname/archive/v$pkgver.tar.gz"
)
sha256sums=(
  '97e5b32afbf6755c60dc8db9a31f43b0422a11e58bb454ff01475d39f70ef98d'
)

prepare() {
  cd "$_pyname-$pkgver"
  sed -i -e 's/setuptools_scm >= 2.0.0, <3/setuptools_scm/' pyproject.toml
}

build() {
  cd "$_pyname-$pkgver"
  python -m build --no-isolation --wheel
}

check() {
  cd "$_pyname-$pkgver"

  # We need an absolute path here. The notebook tests are run in a different
  # directory so a relative path causes test failures.
  PYTHONPATH="$PWD/build/lib" pytest -v --notebooks
}

package() {
  cd "$_pyname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
  install -m755 -d "$pkgdir/usr/share/$pkgname/examples"
  install -m755 -d "$pkgdir/usr/share/$pkgname/examples/notebooks"
  install -m644 -t "$pkgdir/usr/share/$pkgname/examples" miepython/examples/*.py
  install -m644 -t "$pkgdir/usr/share/$pkgname/examples/notebooks" docs/*.ipynb
}
