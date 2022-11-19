# Maintainer: David Runge <dvzrv@archlinux.org>

_name=inflect
pkgname=python38-inflect
pkgver=6.0.2
pkgrel=1
pkgdesc="Correctly generate plurals, singular nouns, ordinals, indefinite articles"
arch=(any)
url="https://github.com/jazzband/inflect"
license=(MIT)
depends=(python38 python38-pydantic)
makedepends=(python38-build python38-installer python38-setuptools-scm python38-toml python38-wheel)
checkdepends=(python38-pytest)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('ddb0439eeffbd21b3293208eb7e89f97fe556a3ba1e88de7e15d1c6bc5a59cdb25a224d7cfec5a010dd384728b15317c1dc752e3a8d4d95dd6eea8224a4f2877')
b2sums=('8faa09c53f836429b6e1a2965da3c4315260e1cb3ae7dc40fe226d7f4595e9bd54498167c044f67fed5f79e2997af5425cc13680b9c2b722ffd702095f60b038')

build() {
  cd $_name-$pkgver
  python3.8 -m build --wheel --no-isolation
}

check() {
  local _site_packages=$(python3.8 -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  # install to temporary location, as importlib is used
  python3.8 -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  pytest -vv -c /dev/null
}

package() {
  cd $_name-$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {CHANGES,README}.rst -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
