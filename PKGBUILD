# Maintainer: David Runge <dvzrv@archlinux.org>

_name=click-command-tree
pkgname=python-click-command-tree
pkgver=1.1.0
pkgrel=1
pkgdesc="Click plugin to show the command tree of your CLI"
arch=(any)
url="https://github.com/whwright/click-command-tree"
license=(MIT)
depends=(python python-click)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
# tests not in sdist tarball: https://github.com/whwright/click-command-tree/issues/5
# source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
source=($_name-$pkgver.tar.gz::https://github.com/whwright/$_name/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('4cdbb2eb8f83134acb9400cf9b61bcce2f9533a4c2d004fe60a72a2a2142361a')
b2sums=('5a8626c747cefb670dfa0443a1ec0a6a4c613cc4593a001e5991ed6e5f3ac2c545312927885af02dc3ca9d60092d55605c56000b74eb6dcf2a505dbc645812c8')

prepare() {
  cd $_name-$pkgver
  # flake8 is not required for building the project: https://github.com/whwright/click-command-tree/issues/4
  sed -e '/flake8/d' -i setup.py
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  pytest -vv tests.py
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
