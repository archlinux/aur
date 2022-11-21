# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pytest_httpserver
pkgname=python38-pytest-httpserver
pkgver=1.0.6
pkgrel=1
pkgdesc="Http server for pytest to test http clients"
arch=(any)
url="https://github.com/csernazs/pytest-httpserver"
license=(MIT)
depends=(python3.8 python-pytest python-werkzeug)
makedepends=(python38-build python38-installer python38-poetry-core python38-wheel)
checkdepends=(python38-ipdb python38-pytest python38-requests)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('9040d07bf59ac45d8de3db1d4468fd2d1d607975e4da4c872ecc0402cdbf7b3e')
b2sums=('0a3afcd370b502264eb7a5fa9ce4d82fed34c4a4b53597423bb157b15ed3bd2f02976b24f4d803928ad6bed5ad40612587d2541afb438cc634ca43bda9781ae1')

build() {
  cd $_name-$pkgver
  python3.8 -m build --wheel --no-isolation
}

check() {
  local _site_packages=$(python3.8 -m "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  # install to temporary location, as importlib is used
  python3.8 -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  pytest -vv --ignore tests/test_release.py
}

package() {
  cd $_name-$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 CHANGES.rst README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
