# Maintainer: David Runge <dvzrv@archlinux.org>

_name=piccata
pkgname=python-piccata
pkgver=2.0.2
pkgrel=1
pkgdesc="A simple CoAP (RFC7252) toolkit"
arch=(any)
url="https://github.com/NordicSemiconductor/piccata"
license=(custom)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('7ea6411777bfd63d62e43086269b4f9ecc9072e6321a729ad02018e054063a32')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$site_packages:$PYTHONPATH"
  pytest -vv tests/
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  # remove (globally namespaced) tests: https://github.com/NordicSemiconductor/piccata/issues/14
  rm -frv "$pkgdir/$site_packages/tests/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
