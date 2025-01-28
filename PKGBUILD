# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-pykdtree
pkgdesc='Fast kd-tree implementation with OpenMP-enabled queries'
url='https://github.com/storpipfugl/pykdtree'
pkgver=1.4.0
pkgrel=1
arch=('x86_64')
license=('LGPL-3.0-only')

depends=(
  'gcc-libs'
  'glibc'
  'python-numpy'
)
makedepends=(
  'cython'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
)

_pypi=pykdtree
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
)
sha256sums=(
  'ffcc5f2478d5837f9d743c3ac46c76a478737a350a7d672ddcac7ea6617fca19'
)

build() {
  cd "$_pypi-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pypi-$pkgver"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl

  cp pykdtree/test_tree.py test-env
  cd test-env
  bin/python -m pytest -v
}

package() {
  cd "$_pypi-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  rm "$pkgdir"/usr/lib/python*/site-packages/pykdtree/test_tree.py
}
