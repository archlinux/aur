pkgname=msi-mpg341c
pkgver=0.1.0
pkgrel=1
pkgdesc='Linux userspace control for the MSI MPG 341C QD-OLED monitor'
arch=('any')
url='https://github.com/joshrzemien/msi-mpg341c'
license=('GPL-3.0-or-later')
depends=('ddcutil' 'python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('dad2094ae8db92969733b8ac8c4052e5e08b7de856aa34cb3e0b739bde86f97d')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"
  PYTHONPATH="src${PYTHONPATH:+:$PYTHONPATH}" python -m pytest
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 contrib/udev/71-msi-monitor.rules \
    "$pkgdir/usr/lib/udev/rules.d/71-msi-monitor.rules"
}
