# Maintainer: David Runge <dave@sleepmap.de>
_name=kaptan
pkgname=python-kaptan
pkgver=0.6.0
pkgrel=1
pkgdesc="Configuration manager in your pocket"
arch=(any)
url="https://github.com/emre/kaptan"
license=(BSD-3-Clause)
depends=(
  python
  python-yaml
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('079f851c252ca03e8d7edc863e50769c74c270e7b00c3437fac08567d2ebbb160f6d0b946f984cf093163194f9ee77fa1cbdfa536802e89ce1382864cc058f5c')
b2sums=('c87b4e392cdc429d6d0d535b9e926fe16787449962b782a6ee7f5c54a7ac799f7c64059861d5fbc1ae25c97a0df43754476f4848a6e682017baa514bbda9bc5b')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH"
  pytest -vv
}

package_python-kaptan() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  # license
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  # docs
  install -vDm 644 {AUTHORS,README.rst} -t "$pkgdir/usr/share/doc/$pkgname"
}
