# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-pykdtree
pkgdesc='Fast kd-tree implementation with OpenMP-enabled queries'
url='https://github.com/storpipfugl/pykdtree'
pkgver=1.3.13
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
 'python-nose'
)

_pypi=pykdtree
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
)
sha256sums=(
  '3accf852e946653e399c3d4dbbe119dbc6d3f72cfd2d5a95cabf0bf0c7f924fe'
)

prepare() {
  cd "$_pypi-$pkgver"
  sed -i -e 's/numpy>=2.0.0rc1,<3/numpy/' pyproject.toml
}

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
  bin/python -m nose
}

package() {
  cd "$_pypi-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
