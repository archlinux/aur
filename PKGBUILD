# Maintainer: éclairevoyant
# Contributor: Adrián Pérez de Castro <aperez at igalia dot com>

_pkgname=torch7-nn
pkgname="$_pkgname-git"
pkgver=r1839.8726825
pkgrel=1
pkgdesc='Neural networks package for Torch7'
arch=('x86_64' 'i686')
url='https://github.com/torch/nn'
license=('custom')
depends=('torch7-git>=r819')
makedepends=('cmake' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
	mv "$pkgdir/usr/lib/libTHNN.so" "$pkgdir/usr/lib/lua/5.1/"

	# Move pure Lua modules
	install -dm755 "$pkgdir/usr/share/lua/5.1/"
	mv "$pkgdir/usr/lua/nn" "${pkgdir}/usr/share/lua/5.1/"
	rm -rf "$pkgdir/usr/lua"

	install -Dm644 COPYRIGHT.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
