# Maintainer: Alexandre Bouvier <contact@amb.tf>
_extname=parle
_pkgname=php-$_extname
pkgname=$_pkgname-git
pkgver=0.8.3.r1.gc06528f
pkgrel=1
pkgdesc="Parser and lexer for PHP"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/weltling/parle"
license=('custom')
depends=('php>=7.4')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
backup=("etc/php/conf.d/$_extname.ini")
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long | sed 's/^parle-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	echo ";extension=$_extname" > $_extname.ini
}

build() {
	cd $_pkgname
	LDFLAGS+=" -Wl,-z,undefs"
	phpize
	./configure --enable-parle-utf32 --prefix=/usr
	make
}

check() {
	export NO_INTERACTION=1
	export REPORT_EXIT_STATUS=1
	make -C $_pkgname test
}

package() {
	cd $_pkgname
	# shellcheck disable=SC2154
	make INSTALL_ROOT="$pkgdir" install
	install -Dm644 -t "$pkgdir"/etc/php/conf.d ../$_extname.ini
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
