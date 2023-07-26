# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pyftdi
pkgname=python-pyftdi
pkgver=0.54.0
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
sha512sums=('b80808e22b6ed9b4f0280d13fdcdf8c89ab615ce90a3ca78ef8d33326d8724f4c771b0d92c1b6b34f048f487f334b0f2a1da84372cbcb1d14e86d8561af118f4')
b2sums=('575413599660bc1b2d179a769e8bdff03198ba0779a7c681c9ffb43fe050144b1db4a4a925a7c7a9971f09780c3debc40962ea414a4aa870bb432e333c9c4263')

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
