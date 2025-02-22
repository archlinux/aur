# Maintainer: SelfRef <arch@selfref.dev>

_basename="asus-stylus-driver"
pkgname="${_basename}-git"
pkgver=r81.ca0f0ff
pkgrel=2
pkgdesc="Supplement driver for Asus Pen stylus"
arch=('any')
url="https://github.com/asus-linux-drivers/asus-stylus-driver"
license=('GPL-2.0')
depends=('python' 'python-libevdev' 'libevdev')
makedepends=('git')
source=("$_basename"::"git+https://github.com/asus-linux-drivers/asus-stylus-driver.git")
install=layout.install
sha256sums=('SKIP')

pkgver() {
	cd "$_basename"
	( set -o pipefail
		git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

package() {
	cd ${_basename}/src
	install -Dm644 -t "$pkgdir/usr/lib/asus-stylus" asus-stylus.py
	install -Dm644 -t "$pkgdir/usr/lib/asus-stylus/layouts" layouts/*
	install -Dm644 -t "$pkgdir/usr/bin" asus-stylus
	install -Dm644 -t "$pkgdir/usr/lib/systemd/system" asus-stylus.service
	install -dm755 "$pkgdir/var/log/asus-stylus"

	_default_layout=$(basename -s .py $(ls layouts | head -n 1))
	sed -i "s/\$LAYOUT/$_default_layout/" config.ini
	install -Dm644 -t "$pkgdir/etc/asus-stylus" config.ini

	cd ..
	install -Dm644 -t "$pkgdir/usr/share/licenses/$_basename" LICENSE.md
}
