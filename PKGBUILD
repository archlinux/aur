# Maintainer: okhsunrog <me@gornushko.com>

pkgname=throttled-git
pkgver=r304.581038c
pkgrel=1
pkgdesc="Workaround for Intel throttling issues in Linux."
arch=('any')
url="https://github.com/erpalma/throttled"
license=('MIT')
depends=('python-dbus' 'python-psutil' 'python-gobject')
conflicts=('lenovo-throttling-fix-git' 'lenovo-throttling-fix' 'throttled')
replaces=('lenovo-throttling-fix' 'throttled')
backup=('etc/lenovo_fix.conf')
source=("git+https://github.com/erpalma/throttled.git"
	'throttled.service')
sha256sums=('SKIP'
	'SKIP')

pkgver() {
	cd "${srcdir}/throttled/"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/throttled/"
  python -m compileall *.py
}

package() {
  cd "${srcdir}/throttled/"
  install -Dm644 etc/throttled.conf "$pkgdir"/etc/throttled.conf
  install -Dm644 ../throttled.service "$pkgdir"/usr/lib/systemd/system/throttled.service
  install -Dm755 throttled.py "$pkgdir"/usr/lib/$pkgname/throttled.py
  mkdir "$pkgdir"/usr/bin/
  ln -s /usr/lib/$pkgname/throttled.py "$pkgdir"/usr/bin/throttled
  install -Dm755 mmio.py "$pkgdir"/usr/lib/$pkgname/mmio.py
  cp -a __pycache__ "$pkgdir"/usr/lib/$pkgname/
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
