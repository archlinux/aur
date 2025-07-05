# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-pykdtree
pkgdesc='Fast kd-tree implementation with OpenMP-enabled queries'
url='https://github.com/storpipfugl/pykdtree'
pkgver=1.4.2
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
  'mypy'
  'python-pytest'
)

_pypi=pykdtree
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
)
sha256sums=(
  'bd2b967a16a5510efa873ee52d959d0d821389cc749bb51673ae68316eeb65f5'
)

build() {
  cd "$_pypi-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pypi-$pkgver"
  rm -rf test-env
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer "dist/pykdtree-$pkgver-"*.whl
  cd test-env
  bin/python -m pytest -v
}

package() {
  cd "$_pypi-$pkgver"
  python -m installer --destdir="$pkgdir" "dist/pykdtree-$pkgver-"*.whl
  rm "$pkgdir"/usr/lib/python*/site-packages/pykdtree/test_stub.py
  rm "$pkgdir"/usr/lib/python*/site-packages/pykdtree/test_tree.py
}
