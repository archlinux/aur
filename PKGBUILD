# Maintainer: David Runge <dvzrv@archlinux.org>

_name=calmjs
pkgname=python-calmjs
pkgver=3.4.3
pkgrel=1
pkgdesc="Framework for building toolchains and utilities for working with the JavaScript/Node.js ecosystem"
arch=(any)
url="https://github.com/calmjs/calmjs"
license=(GPL2)
depends=(python python-calmjs.parse python-calmjs.types python-setuptools)
makedepends=(python-build python-installer python-wheel)
checkdepends=(npm yarn)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.zip)
sha512sums=('3fac1089a4743466dbc41c7963b0e9bdb64ef369a96420bfb3dea4070be5b5b9bb86109e70cc93983762bf1911a1d5dce11dd5870fbd3c939c6778e9a787bcc9')
b2sums=('7b081a58574810addf863cd0a400bc2142c5589ad68e3d5aef407d260f694e986b854db45cd8f37ad15541a78f934b36a671b9874a928559b9b23de055ce61dd')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH"

  # remove broken tests:
  # https://github.com/calmjs/calmjs/issues/66
  rm -vf src/$_name/tests/test_{command,npm,yarn}.py

  python -m unittest discover -vs src/$_name/tests/
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {CHANGES,README}.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
