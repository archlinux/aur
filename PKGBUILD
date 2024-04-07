# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pyftdi
pkgname=python-pyftdi
pkgver=0.55.3
pkgrel=1
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
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('6133fe89bd30453ba102ce136a41d8cc695f41c023f9545828593e63f32716f1490ff8eee5f745fc39a3511b0b44a6da55aef26066165a901d1101d2287a9304')
b2sums=('de20e6bfddb7823bfcb6e159c4927dfc3c3d5795a1cf6c6ad9fe4b0d1d10680739d00f0290e131e63d36e5839204a9f6f08e44247a0b28661969a5df31d89efd')

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
