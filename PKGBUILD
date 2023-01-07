# Maintainer: éclairevoyant
# Contributor: Jingbei Li <i at jingbei dot li>

_pkgname=torch7-optim
pkgname="$_pkgname-git"
pkgver=1.0.3.0.r240.a5ceed7
pkgrel=1
pkgdesc='Numeric optimization package for Torch'
arch=('x86_64' 'i686')
url='https://github.com/torch/optim'
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
	mv "$pkgdir/usr/lua/optim" "$pkgdir/usr/share/lua/5.1/"
	rm -rf "$pkgdir/usr/lua"

	install -Dm644 COPYRIGHT.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
