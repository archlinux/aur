# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-cfclient
pkgver=2022.9
pkgrel=1
pkgdesc='Host applications and library for Crazyflie written in Python.'
arch=('any')
url='https://github.com/bitcraze/crazyflie-clients-python'
license=('GPL-2.0')
depends=(python python-cflib python-appdirs python-pyzmq python-pyqtgraph
         python-pyaml python-asyncqt python-qtm python-numpy python-vispy
         python-pyserial python-pyqt5 python-pyqt5-sip)
optdepends=(crazyflie-udev crazyradio-udev)
makedepends=(python python-build python-installer python-wheel python-setuptools
             python-cx-freeze python-importlib-metadata)
source=("$pkgname-$pkgver.tar.gz::https://github.com/bitcraze/crazyflie-clients-python/archive/$pkgver.tar.gz")
sha256sums=('5e13029fce4eeaa83507ed1be3244d9665711a7148c0a2499da5c7f89ca74c07')

_pkgname=crazyflie-clients-python

prepare() {
    sed -i "s/= get_version()/= \"${pkgver}\"/g" ${srcdir}/${_pkgname}-${pkgver}/setup.py
    # 23 is line number after `'build_exe': {`
    sed -i "23i'bin_path_includes': ['/usr/lib/python3.10/site-packages/cx_Freeze/bases']," ${srcdir}/${_pkgname}-${pkgver}/setup.py
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
