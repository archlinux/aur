# Maintainer: Layne Bernardo <lmbernar (at) uark (dot) edu>
pkgname='qthttpserver-git'
pkgver=r68.7dc185f
pkgrel=3
pkgdesc="Provide a Qt framework for a simple HTTP server"
arch=('x86_64')
url="https://github.com/qt-labs/qthttpserver"
license=('GPL3')
depends=('qt5-base' 'qt5-websockets')
makedepends=('git')
source=('git+https://github.com/qt-labs/qthttpserver.git'
	'git+https://github.com/nodejs/http-parser.git')
md5sums=('SKIP' 'SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	git submodule init
	git config submodule.http-parser.url $srcdir/http-parser
	git submodule update
}

build() {
	cd "$srcdir/${pkgname%-git}"
	qmake
	make
}

check() {
	cd "$srcdir/${pkgname%-git}"
	make -k check
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make INSTALL_ROOT="$pkgdir/" install
}
