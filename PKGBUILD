# Maintainer: Barry Smith <smithbarry@gmx.com>

pkgname=throttled
pkgver=0.5
pkgrel=1
pkgdesc="Workaround for Intel throttling issues on Thinkpads in Linux."
arch=('i686' 'x86_64')
url="https://github.com/erpalma/throttled"
license=('MIT')
depends=('python-dbus' 'python-psutil' 'python-gobject')
provides=('lenovo-throttling-fix' 'throttled')
conflicts=('lenovo-throttling-fix-git' 'lenovo-throttling-fix')
backup=('etc/lenovo_fix.conf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/erpalma/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('8df2478bad26b0d8be4f6b4a1016bf4fc1b854bc1214955b7e999b7208d4f815')

prepare() {
  sed -i "s|ExecStart=.*|ExecStart=/usr/lib/$pkgname/lenovo_fix.py|" $pkgname-$pkgver/systemd/lenovo_fix.service
}

build() {
  cd $pkgname-$pkgver
  python -m compileall lenovo_fix.py
}

package() {
  cd throttled-$pkgver
  install -Dm644 etc/lenovo_fix.conf "$pkgdir"/etc/lenovo_fix.conf
  install -Dm644 systemd/lenovo_fix.service "$pkgdir"/usr/lib/systemd/system/lenovo_fix.service
  install -Dm755 lenovo_fix.py "$pkgdir"/usr/lib/$pkgname/lenovo_fix.py
  install -Dm755 mmio.py "$pkgdir"/usr/lib/$pkgname/mmio.py
  cp -a __pycache__ "$pkgdir"/usr/lib/$pkgname/
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
