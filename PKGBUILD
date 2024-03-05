#  Maintainer: Blair Bonnett <blair.bonnett@gmail.com>
# Contributor: Andrej Radović <r.andrej@gmail.com>

pkgname=python-iteration-utilities
pkgver=0.12.1
pkgrel=1
pkgdesc="Utilities based on Pythons iterators and generators."
url='https://iteration-utilities.readthedocs.io'
license=('Apache-2.0')
arch=('x86_64')

depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')

_pypi=iteration_utilities
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
)
sha256sums=(
  'a17bd698bc65b796b265e56f02a8d71f517716dc066a4c507e12563795bfe3bd'
)

build() {
  cd "$_pypi-$pkgver"
  python -m build --no-isolation --wheel
}

check() {
  cd "$_pypi-$pkgver"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer "dist/$_pypi-$pkgver-"*.whl
  test-env/bin/python -m pytest
}

package() {
  cd "$_pypi-$pkgver"
  python -m installer --destdir="$pkgdir" "dist/$_pypi-$pkgver-"*.whl

  # Remove source code from the final package.
  find "$pkgdir" -type f -name "*.[ch]" -delete
  find "$pkgdir" -type d -name "_iteration_utilities" -delete
}
