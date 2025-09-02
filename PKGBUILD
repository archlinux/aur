# Maintainer: krumelmonster <krumelmonster@zoho.com>

pkgname=python-usbsdmux
_name=usbsdmux
pkgver=25.08
pkgrel=1
pkgdesc="Command line tool and library to control the Pengutronix USB-SD-Mux"
arch=('any')
url="https://github.com/linux-automation/usbsdmux/"
license=('LGPL-2.1-or-later')
depends=('python')
makedepends=('python-setuptools')
source=("${url}archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd $_name-$pkgver
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 contrib/udev/99-usbsdmux.rules "$pkgdir/usr/lib/udev/rules.d/60-usbsdmux.rules"
}

post_install() {
  udevadm control --reload-rules
  udevadm trigger
}
