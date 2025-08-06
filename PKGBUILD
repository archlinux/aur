# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-pykdtree
pkgdesc='Fast kd-tree implementation with OpenMP-enabled queries'
url='https://github.com/storpipfugl/pykdtree'
pkgver=1.4.3
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
  'd9187930ffb8c822c52595b64948b47346694ee2a49e2702420b58f743d786f5'
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
