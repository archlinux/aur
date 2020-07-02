# Maintainer: Simon Gardling (titaniumtown) <titaniumtown@gmail.com>
# Contributor: Lauri Niskanen <ape@ape3000.com>
# Contributor: George Gibbs <vash63 at gmail dot com>

pkgname=ds4drv-cemuhook-git
pkgver=0.5.1.216.8d3e126
pkgrel=1
pkgdesc="Sony DualShock 4 Userspace Driver (with additions for cemu and DSU motion control)"
arch=('any')
url="https://github.com/TheDrHax/ds4drv-cemuhook"
license=('MIT')
depends=('python-setuptools' 'bluez-utils-compat' 'python-evdev' 'python-pyudev')
makedepends=('git')
conflicts=('ds4drv' 'ds4drv-git')
install=ds4drv.install
source=(git+https://github.com/TheDrHax/ds4drv-cemuhook)
sha256sums=('SKIP')

pkgver() {
  cd ds4drv-cemuhook
  version=$(grep version setup.py | sed 's/      version=\"//' | sed 's/\",//')
  hash=$(git log --pretty=format:'%h' -n 1)
  revision=$(git rev-list --count HEAD)
  echo $version.$revision.$hash
}

package() { 
	cd ds4drv-cemuhook
	mkdir -pm755 $pkgdir/etc/udev/rules.d
        cp udev/50-ds4drv.rules $pkgdir/etc/udev/rules.d/50-ds4drv.rules
	mkdir -pm755 $pkgdir/usr/share/licenses/$pkgname
	cp LICENSE $pkgdir/usr/share/licenses/$pkgname/
	python setup.py install --root="$pkgdir/" --optimize=1
	mkdir -pm755 $pkgdir/etc/systemd/system
	cp systemd/ds4drv.service $pkgdir/etc/systemd/system/ds4drv.service
	cp ds4drv.conf $pkgdir/etc/ds4drv.conf
}

# vim: ft=sh syn=sh
