# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pyftdi
pkgname=python-pyftdi
pkgver=0.55.0
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
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('ddd120385eb36b54376bd7360ae2851fcc9314290733a6b8335680697d5dc266bd2f37c4b66dbdc50a141a25e9f3e1647c780fb0a31b8e5583dd74ea0a559792')
b2sums=('83485f96317ca261af4554da73ee25357ec601f48f34b21c3c8b039e99b65d5db3d06a7b77fd08b115bba883f83e57501041a90cd9ba41199ad790943084622c')

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
