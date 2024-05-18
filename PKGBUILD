# Maintainer: SelfRef <arch@selfref.dev>

_basename="asus-stylus-driver"
pkgname="${_basename}-git"
pkgver=r59.3107a32
pkgrel=1
pkgdesc="Supplement driver for Asus Pen stylus"
arch=('any')
url="https://github.com/asus-linux-drivers/asus-stylus-driver"
license=('GPL-2.0')
depends=('python' 'python-libevdev' 'libevdev')
makedepends=('git')
source=("$_basename"::"git+https://github.com/asus-linux-drivers/asus-stylus-driver.git")
install=layout.install
md5sums=('SKIP')

pkgver() {
	cd "$_basename"
	( set -o pipefail
		git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

package() {
	cd ${_basename}
	install -Dm644 -t "$pkgdir/usr/share/asus_stylus-driver" asus_stylus.py
	install -Dm644 -t "$pkgdir/usr/share/asus_stylus-driver/stylus_layouts" stylus_layouts/*
	install -dm755 "$pkgdir/var/log/asus_stylus-driver"

	_default_layout=$(basename -s .py $(ls stylus_layouts | head -n 1))
	sed -i "s/\$LAYOUT/$_default_layout/" asus_stylus.service
	install -Dm644 -t "$pkgdir/usr/lib/systemd/system" asus_stylus.service

	install -Dm644 -t "$pkgdir/usr/share/licenses/$_basename" LICENSE.md
}
