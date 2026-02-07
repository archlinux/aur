# Maintainer: Antheas Kapenekakis <aur at antheas dot dev>
pkgname=hhd
pkgver=4.1.8
pkgrel=1
pkgdesc='Handheld Daemon. A tool for managing the quirks of handheld devices.'
arch=('x86_64')
url='https://github.com/hhd-dev/hhd'
license=('LGPL-2.1-or-later')
depends=('python' 'python-setuptools' 'python-evdev' 'python-rich' 'python-yaml' 'python-xlib' 'python-dbus' 'libusb' 'python-pyserial' 'lsof'  'python-pyroute2' 'python-gobject')
optdepends=('hhd-user: allows running hhd as a user service.')
makedepends=('python-'{'build','installer','setuptools','wheel','babel'})
replaces=('adjustor')
source=("https://github.com/hhd-dev/hhd/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('b1598025af54f5407a268e7b44ccff0b8d97a6362f9ceedde73dbd2a3d26472581d43277e47c9d964085bed6761fbf99cc1d7d570064675871512eba901e58b2')

build() {
  cd "hhd-$pkgver"
  pybabel compile -D hhd -d ./i18n
  pybabel compile -D adjustor -d ./i18n || true
  cp -rf ./i18n/* ./src/hhd/i18n
  python -m build --wheel --no-isolation
}

package() {
  cd "hhd-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  
  # Install minimally necessary rules for running as a system service
	mkdir -p ${pkgdir}/usr/lib/udev/rules.d/
  install -m644 usr/lib/udev/rules.d/83-hhd.rules ${pkgdir}/usr/lib/udev/rules.d/83-hhd.rules
	mkdir -p ${pkgdir}/usr/lib/udev/hwdb.d/
  install -m644 usr/lib/udev/hwdb.d/83-hhd.hwdb ${pkgdir}/usr/lib/udev/hwdb.d/83-hhd.hwdb
	mkdir -p ${pkgdir}/usr/lib/systemd/system/
  install -m644 usr/lib/systemd/system/hhd@.service ${pkgdir}/usr/lib/systemd/system/hhd@.service
  install -m644 usr/lib/systemd/system/hhd.service ${pkgdir}/usr/lib/systemd/system/hhd.service
}
