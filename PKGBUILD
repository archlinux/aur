# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-pyftdi
_name=${pkgname#python-}
pkgver=0.57.2
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
source=("${_name}-${pkgver}.tar.gz::${url}/archive/refs/tags/v$pkgver.tar.gz")
# source=(https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl)
sha512sums=('c0adee63f619069b9d96c57adb447e23db0a942e9ed477bc42d9f507b5160a7b07d70627856588d90aa198c2b356645e3b847cbca2facb080dd0b15d635c29ff')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

# check() {
#   cd $_name-$pkgver
#
#   local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
#
#   # install to temporary location, as importlib is used
#   python -m installer --destdir=test_dir dist/*.whl
#   export PYTHONPATH="$_name-$pkgver/test_dir/$site_packages:$PYTHONPATH"
#   python $_name/tests/mockusb.py
#   export FTDI_VIRTUAL=on
#   python $_name/tests/gpio.py
#   python $_name/tests/eeprom_mock.py
# }

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  #   python -m installer --destdir="$pkgdir" ${srcdir}/${_name//-/_}-$pkgver-py3-none-any.whl
}
