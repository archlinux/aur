# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-pykdtree
pkgdesc='Fast kd-tree implementation with OpenMP-enabled queries'
url='https://github.com/storpipfugl/pykdtree'
pkgver=1.3.12
pkgrel=1
arch=('x86_64')
license=('LGPL-3.0-only')
depends=('gcc-libs' 'python-numpy')
makedepends=('cython' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-nose')

_pypi=pykdtree
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
)
sha256sums=(
  'cc20b2a67c64056485a314d2c2b6dba354af7ee1c8fb8dae1be6f2936a374341'
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
