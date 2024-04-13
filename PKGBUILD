# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pyftdi
pkgname=python-pyftdi
pkgver=0.55.4
pkgrel=2
pkgdesc="FTDI device driver written in pure Python"
arch=(any)
url="https://github.com/eblot/pyftdi"
license=(BSD-3-Clause)
depends=(
  python
  python-pyusb
  python-pyserial
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-ruamel-yaml
)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('3998572f1af781327678d99ab89ee33bda42bea6320cf62ed4e65a3c6a891754f8f17763482e0d852bff9c73ab80af8c2df8c71ed70af9079512680064b24ede')
b2sums=('4d680ff38bbb3b1abb320398fa7543f9524e52511ea3fbfcf08d00d1e69c345ad71341c3de5204c69c1023d6974fdefd763bf61d693e88a3154f2c710f5ab070')

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
  python $_name/tests/mockusb.py
  export FTDI_VIRTUAL=on
  python $_name/tests/gpio.py
  python $_name/tests/eeprom_mock.py
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
