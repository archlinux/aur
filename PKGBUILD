# Maintainer: 
# Contributor Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Artem Klevtsov <a.a.klevtsov@gmail com>
pkgname=afancontrol
pkgver=3.0.0
pkgrel=2
pkgdesc="Advanced Fan Control program, which controls PWM fans according to the current temperatures of the system components."
arch=('any')
url="https://github.com/KostyaEsmukov/afancontrol"
license=('MIT')
depends=('python-click')
makedepends=('python-setuptools')
optdepends=('lm_sensors: to use the motherboard-based sensors and PWM fans'
            'freeipmi: readonly PWM fans'
            'hddtemp: for measuring HDD/SSD temperatures'
            'python-pyserial: Arduino support'
            'python-prometheus_client: Prometheus support')
backup=("etc/$pkgname/$pkgname.conf")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('2d954c3e382c1d60d02dae89eec1349bd71440927a8fd582ae67031fdb1c3540')

prepare() {
  cd "$pkgname-$pkgver"
  sed -i 's/etc\/systemd/lib\/systemd/g' setup.py
  sed -i 's/usr\/local/usr/g' "pkg/$pkgname.conf"
}

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -d "$pkgdir/etc"
  mv "$pkgdir/usr/etc/afancontrol" "$pkgdir/etc"
  rmdir "$pkgdir/usr/etc"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
