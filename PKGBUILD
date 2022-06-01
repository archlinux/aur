# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Buck Yeh <buck.yeh at gmail dot com>
pkgname=bux-mariadb-client
pkgver=1.0.3
pkgrel=1
epoch=
pkgdesc='Loose-coupled throw-on-error C++20 wrapper classes and utilities of mysql/mariadb Connector/C API'
arch=('x86_64')
url='https://github.com/buck-yeh/bux-mariadb-client.git'
license=('MIT')
groups=()
depends=('mariadb-libs' 'bux' 'fmt')
makedepends=('cmake' 'make' 'gcc' 'git' 'binutils' 'fakeroot' 'gawk')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=()
noextract=()
md5sums=()
validpgpkeys=()

prepare() {
	rm -Rf "$pkgname"
	mkdir -p "$pkgname"
	cd "$pkgname" || return 1
	git clone -b "$pkgver" --single-branch $url .
}

build() {
	cd "$pkgname" || return 1
	cmake -D FETCH_DEPENDEES=1 .
	cd src || return 1
	make -j
}

check() {
	cd "$pkgname" || return 1
	if [[ ! -f src/libbux-mariadb-client.a ]]; then
		return 1
	fi
	if [[ ! -f include/bux/oo_mariadb.h ]]; then
		return 1
	fi
	return 0
}

package() {
	cd "$pkgname" || return 1
	mkdir -p "$pkgdir/usr/lib"
	mkdir -p "$pkgdir/usr/include/bux"
	cp src/libbux-mariadb-client.a "$pkgdir/usr/lib/"
	cp include/bux/*.h "$pkgdir/usr/include/bux/"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
