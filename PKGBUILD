# Maintainer: Rowan Lewis <rl@nbsp.io>

_gitname=php-uv
pkgname=$_gitname-git
pkgver=r504.73a295a
pkgrel=2
pkgdesc="An experimental interface to libuv for php"
arch=('i686' 'x86_64')
url="https://github.com/chobie/php-uv"
license=('PHP')
depends=('php>=5.5' 'libuv-git')
makedepends=('git')
backup=('etc/php/conf.d/uv.ini')
source=('git+https://github.com/steverhoades/php-uv.git#branch=libuv-1.0')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_gitname"
	git submodule update --init
}

build() {
	cd "$srcdir/$_gitname"
	phpize
	./configure --prefix=/usr --with-uv
	make
}

package() {
	cd "$srcdir/$_gitname"
	make INSTALL_ROOT="$pkgdir" install
	echo 'extension=uv.so' > uv.ini
	install -Dm644 uv.ini "$pkgdir/etc/php/conf.d/uv.ini"
}
