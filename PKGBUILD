# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Buck Yeh <buck.yeh at gmail dot com>
pkgname=bux-sqlite
pkgver=1.0.1
pkgrel=1
epoch=
pkgdesc='Wrapper classes and utilities of the original SQLite3 CAPI'
arch=('x86_64')
url='https://github.com/buck-yeh/bux-sqlite.git'
license=('MIT')
groups=()
depends=('sqlite' 'bux' 'fmt')
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
	if [[ ! -f src/libbux-sqlite.a ]]; then
		return 1
	fi
	if [[ ! -f include/bux/oo_sqlite.h ]]; then
		return 1
	fi
	return 0
}

package() {
	cd "$pkgname" || return 1
	mkdir -p "$pkgdir/usr/lib"
	mkdir -p "$pkgdir/usr/include/bux"
	cp src/libbux-sqlite.a "$pkgdir/usr/lib/"
	cp include/bux/*.h "$pkgdir/usr/include/bux/"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
