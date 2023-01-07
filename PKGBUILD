# Maintainer: éclairevoyant
# Contributor: Adrián Pérez de Castro <aperez at igalia dot com>

_pkgname=torch7-xlua
pkgname="$_pkgname-git"
pkgver=1.0.0.r36.41308fe
pkgrel=1
pkgdesc='A set of useful functions to extend Lua (string, table, ...)'
arch=('x86_64' 'i686')
url='https://github.com/torch/xlua'
license=('BSD')
depends=('torch7-git>=r819')
makedepends=('cmake' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
	cd $_pkgname
	cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd $_pkgname
	make DESTDIR="$pkgdir" install

	# Move pure Lua modules
	install -dm755 "$pkgdir/usr/share/lua/5.1/"
	mv "$pkgdir/usr/lua/xlua" "$pkgdir/usr/share/lua/5.1/"
	rm -rf "$pkgdir/usr/lua"

	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
