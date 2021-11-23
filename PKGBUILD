# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-miepython
pkgdesc='Mie scattering of light off perfect spheres'
pkgver=2.2.1
pkgrel=1
arch=('any')
url='https://miepython.readthedocs.io/'
license=('MIT')

depends=('python-matplotlib' 'python-numba' 'python-numpy')
optdepends=(
  'python-scipy: to run the included examples'
)
checkdepends=('jupyter-nbconvert' 'jupyter-nbformat' 'python-pytest' 'python-scipy')
makedepends=('python-setuptools')

_pyname=miepython
source=(
  "$_pyname-$pkgver.tar.gz::https://github.com/scottprahl/$_pyname/archive/v$pkgver.tar.gz"
)
sha256sums=(
  'd361a9bf49b28a5b1038287c88059abb3770f1b1e92f894cdd25cdb92a4df1ad'
)

build() {
  cd "$_pyname-$pkgver"
  python setup.py build
}

check() {
  cd "$_pyname-$pkgver"

  # We need an absolute path here. The notebook tests are run in a different
  # directory so a relative path causes test failures.
  PYTHONPATH="$PWD/build/lib" pytest -v --notebooks

  # Get rid of cached bytecode and Numba outputs.
  rm -rf build/lib/miepython/__pycache__
}

package() {
  cd "$_pyname-$pkgver"
  python setup.py install --skip-build --optimize=1 --root="$pkgdir" --prefix=/usr
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
  install -m755 -d "$pkgdir/usr/share/$pkgname/examples"
  install -m755 -d "$pkgdir/usr/share/$pkgname/examples/notebooks"
  install -m644 -t "$pkgdir/usr/share/$pkgname/examples" miepython/examples/*.py
  install -m644 -t "$pkgdir/usr/share/$pkgname/examples/notebooks" docs/*.ipynb
}
