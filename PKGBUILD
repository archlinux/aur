# Maintainer: éclairevoyant

_pkgname=torch7-sys
pkgname="$_pkgname-git"
pkgver=1.1.0.r25.f073f05
pkgrel=1
pkgdesc='A system utility package for Torch.'
arch=('x86_64' 'i686')
url='https://github.com/torch/sys'
license=('BSD')
depends=('torch7-git>=r819')
makedepends=('cmake' 'git')
provides=('torch7-sys')
conflicts=('torch7-sys')
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

	# Move Lua C module
	install -dm755 "$pkgdir/usr/lib/lua/5.1/"
	mv "$pkgdir/usr/lib/libsys.so" "$pkgdir/usr/lib/lua/5.1/"

	# Move pure Lua modules
	install -dm755 "$pkgdir/usr/share/lua/5.1/"
	mv "$pkgdir/usr/lua/sys" "$pkgdir/usr/share/lua/5.1/"
	rm -rf "$pkgdir/usr/lua"

	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
