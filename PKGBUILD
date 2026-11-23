# Maintainer: dlock <hossam.saraya@gmail.com>
pkgname=ds5bridge-git
_pkgname=ds5bridge
pkgver=0.1.0.r1.gaa3b148
pkgrel=1
pkgdesc="Use a Bluetooth DualSense as a wired controller (native PlayStation support in Proton games)"
arch=(any)
url="https://github.com/daedlock/ds5bridge"
license=(MIT)
depends=(python systemd)
makedepends=(git python-build python-installer python-setuptools python-wheel)
provides=("$_pkgname")
conflicts=("$_pkgname")
install=ds5bridge.install
source=("git+$url.git")
sha256sums=(SKIP)

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname"
  python -m unittest discover -s tests
}

package() {
  cd "$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 data/72-ds5bridge.rules data/72-steam-virtual-gamepad-no-js.rules -t "$pkgdir/usr/lib/udev/rules.d/"
  install -Dm644 data/ds5bridge@.service -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
