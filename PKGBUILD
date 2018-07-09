# Maintainer: Felix Yan <felixonmars@archlinux.org>

_pkgname=lenovo-throttling-fix
pkgname=$_pkgname-git
pkgver=0.47.56a4c54
pkgrel=1
pkgdesc="Workaround for Intel throttling issues on Thinkpads in Linux."
arch=('any')
url="https://github.com/erpalma/lenovo-throttling-fix"
license=('MIT') 
depends=('python-dbus' 'python-psutil' 'python-gobject' 'python-periphery')
makedepends=('git')
backup=('etc/lenovo_fix.conf')
source=("git+https://github.com/erpalma/${_pkgname}.git")
md5sums=('SKIP')

prepare() {
  sed -i 's|ExecStart=.*|ExecStart=/usr/lib/lenovo-throttling-fix/lenovo_fix.py|' $_pkgname/systemd/lenovo_fix.service
  sed -i 's|from mmio import|from periphery.mmio import|' $_pkgname/lenovo_fix.py
}

build() {
  cd $_pkgname
  python -m compileall lenovo_fix.py
}

pkgver() {
  cd $_pkgname
  echo 0.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd $_pkgname
  install -Dm644 etc/lenovo_fix.conf "$pkgdir"/etc/lenovo_fix.conf
  install -Dm644 systemd/lenovo_fix.service "$pkgdir"/usr/lib/systemd/system/lenovo_fix.service
  install -Dm755 lenovo_fix.py "$pkgdir"/usr/lib/lenovo-throttling-fix/lenovo_fix.py
  cp -a __pycache__ "$pkgdir"/usr/lib/lenovo-throttling-fix/
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
