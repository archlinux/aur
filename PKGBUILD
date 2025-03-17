# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-miepython
pkgdesc='Mie scattering of light off perfect spheres'
pkgver=3.0.0
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
  '7c67452be7d5134c74a7fc9a3f2e44ddba1d6bf64272297da6eb07c9a4eda2dd'
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
