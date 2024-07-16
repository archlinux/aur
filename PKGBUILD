# Maintainer: Antheas Kapenekakis <aur at antheas dot dev>
pkgname=hhd
pkgver=3.2.1
pkgrel=1
pkgdesc='Handheld Daemon. A tool for managing the quirks of handheld devices.'
arch=('x86_64')
url='https://github.com/hhd-dev/hhd'
license=('GPL-3.0-or-later' 'MIT')
depends=('python' 'python-setuptools' 'python-evdev' 'python-rich' 'python-yaml' 'python-xlib' 'libusb')
optdepends=('hhd-user: allows running hhd as a user service.')
makedepends=('python-'{'build','installer','setuptools','wheel'})
source=("https://pypi.python.org/packages/source/h/hhd/hhd-${pkgver}.tar.gz")
sha512sums=('b56baa8aad12c87e09bbe57a60c7437cea19a5db86390ffc07fe79aefd75a89925a17131c8fe72b38dc2b43ba5d0034191b5eeb4c86063d7fcaca36f1b118f3a')

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
