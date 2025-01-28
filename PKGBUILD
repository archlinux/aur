# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-pyftdi
_name=${pkgname#python-}
pkgver=0.56.0
pkgrel=4
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
sha512sums=('203c7032bef534841eff08b5b464b60709803d8b319ab61393c1bc31bba1df45ba538a6f67574d3e840c2e34466cdb68412a4fa442c8c01e0c1a8f1f328656f9')

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
