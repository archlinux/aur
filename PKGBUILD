# Maintainer: David Runge <dvzrv@archlinux.org>

_name=calmjs
pkgname=python-calmjs
pkgver=3.4.4
pkgrel=2
pkgdesc="Framework for building toolchains and utilities for working with the JavaScript/Node.js ecosystem"
arch=(any)
url="https://github.com/calmjs/calmjs"
license=(GPL2)
depends=(python python-calmjs.parse python-calmjs.types python-setuptools)
makedepends=(python-build python-installer python-wheel)
checkdepends=(npm yarn)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.zip)
sha512sums=('77a69a0318f1d254ee80fa51d585442b65e6569231370e02f0e0f1b23f66445aa25d2ae8e774a616718d7107bdf2fc130952a4f5418972aa9b2b2b51cd02a69e')
b2sums=('14558a865da131f87852932185b61e3a52ac963c4fa1782013214f79ced5e8745d527b27ac453a1c1d02c47f251fa926653241ac69aee1363b003e007dbd0597')

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
