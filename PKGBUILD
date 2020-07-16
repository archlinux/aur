# Maintainer: Artem Klevtsov <a.a.klevtsov@gmail com>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=afancontrol
pkgver=2.1.0
pkgrel=1
epoch=1
pkgdesc="Advanced Fan Control program, which controls PWM fans according to the current temperatures of the system components."
arch=('any')
url="https://github.com/KostyaEsmukov/afancontrol"
license=('MIT')
depends=('python-click' 'lm_sensors')
makedepends=('python-setuptools')
optdepends=('hddtemp: for measuring HDD/SSD temperatures')
backup=("etc/$pkgname/$pkgname.conf")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('0c248291d43a31af4e06411a64cfa6623d63bec89b0c3594317388855b4a49cf')

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

  install -d "$pkgdir/etc/afancontrol"
  mv "$pkgdir/usr/etc/afancontrol" "$pkgdir/etc"
  rmdir "$pkgdir/usr/etc"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
