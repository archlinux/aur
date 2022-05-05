# Maintainer: Alexandre Bouvier <contact@amb.tf>
_extname=dbus
_pkgname=php-$_extname
pkgname=$_pkgname-git
pkgver=r90.b147624
pkgrel=1
pkgdesc="Extension for interaction with DBUS busses"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/derickr/pecl-dbus"
license=('PHP')
depends=('php')
makedepends=('dbus' 'git' 'libxml2')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
backup=("etc/php/conf.d/$_extname.ini")
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	echo ";extension=$_extname" > $_extname.ini
}

build() {
	cd $_pkgname
	LDFLAGS+=" -Wl,-z,undefs"
	phpize
	./configure --prefix=/usr
	make
}

package() {
	depends+=('libdbus-1.so' 'libxml2.so')
	# shellcheck disable=SC2154
	make -C $_pkgname INSTALL_ROOT="$pkgdir" install
	install -Dm644 -t "$pkgdir"/etc/php/conf.d $_extname.ini
}
