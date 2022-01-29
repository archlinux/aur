# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-miepython
pkgdesc='Mie scattering of light off perfect spheres'
pkgver=2.2.3
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
makedepends=('python-setuptools')

_pyname=miepython
source=(
  "$_pyname-$pkgver.tar.gz::https://github.com/scottprahl/$_pyname/archive/v$pkgver.tar.gz"
  'install_data.patch'
)
sha256sums=(
  '17682fa74fdf4b6927cc7775452c5692ed51932b085c18210211257318c93740'
  'ffcfec40dcd66351e840aa4c20c3682897da1f52a0258f81632036859a87967e'
)

prepare() {
  cd "$_pyname-$pkgver"
  patch -p0 -i "$srcdir/install_data.patch"
}

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
