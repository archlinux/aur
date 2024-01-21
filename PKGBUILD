#  Maintainer: Blair Bonnett <blair.bonnett@gmail.com>
# Contributor: Andrej Radović <r.andrej@gmail.com>

pkgname=python-iteration-utilities
pkgver=0.12.0
pkgrel=1
pkgdesc="Utilities based on Pythons iterators and generators."
url="https://github.com/MSeifert04/iteration_utilities"
license=('Apache-2.0')
arch=('x86_64')

depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')

_pypi=iteration_utilities
source=(
  "$_pypi-$pkgver.tar.gz::https://github.com/MSeifert04/iteration_utilities/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=(
  '38245a7f48588ee21329438d094f207a41a15c5960f7cfac3b1ec0a08a55bcf9'
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
