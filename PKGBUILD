# Maintainer: Artem Klevtsov <a.a.klevtsov@gmail com>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=afancontrol
pkgver=2.2.1
pkgrel=1
epoch=1
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
sha256sums=('e984d83791a0a0131e5fc874f7e3240e874c6bb9215075ef02e740091ea6a450')

prepare() {
  cd "$pkgname-$pkgver"
  sed -i 's|etc/systemd|lib/systemd|g' setup.py
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
