# Maintainer: Antheas Kapenekakis <aur at antheas dot dev>
pkgname=hhd
pkgver=3.3.15
pkgrel=1
pkgdesc='Handheld Daemon. A tool for managing the quirks of handheld devices.'
arch=('x86_64')
url='https://github.com/hhd-dev/hhd'
license=('GPL-3.0-or-later' 'MIT')
depends=('python' 'python-setuptools' 'python-evdev' 'python-rich' 'python-yaml' 'python-xlib' 'libusb')
optdepends=('hhd-user: allows running hhd as a user service.')
makedepends=('python-'{'build','installer','setuptools','wheel'})
source=("https://pypi.python.org/packages/source/h/hhd/hhd-${pkgver}.tar.gz")
sha512sums=('520556f70d43618f0dfa02d1975c642985b591726da6e499f2f9fcbfb2cc9d8703755a7f7d988675b9ba83f741382440cacf801c3ad1cd2bb167d8d69e533bae')

build() {
  cd "hhd-$pkgver"
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
}
