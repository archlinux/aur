# Maintainer: Alexandre Bouvier <contact@amb.tf>
_extname=parle
_pkgname=php-$_extname
pkgname=$_pkgname-git
pkgver=0.8.5.r3.gc6343f5
pkgrel=1
pkgdesc="Parser and lexer for PHP"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/weltling/parle"
license=('BSD-2-Clause')
depends=('gcc-libs' 'glibc' 'php>=7.4')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
backup=("etc/php/conf.d/$_extname.ini")
source=(
	"$_pkgname::git+$url.git"
	"fix-build-php85.patch"
)
b2sums=(
	'SKIP'
	'c2f9d3f7c65d4be167dce25b68c2aab31fec6e1e4c830253c18502f49b51cf397d8aff43ff44890d66012968499c6b0dd4e75fd3007d4d7574bcb82862978e2f'
)

pkgver() {
	cd $_pkgname
	git describe --long --abbrev=7 | sed 's/^parle-//;s/[^-]*-g/r&/;s/-/./g'
}

prepare() {
	cd $_pkgname
	echo ";extension=$_extname" > ../$_extname.ini
	patch -Np1 < ../fix-build-php85.patch
}

build() {
	cd $_pkgname
	LDFLAGS+=" -Wl,-z,undefs"
	phpize
	./configure --enable-parle-utf32 --prefix=/usr
	make
}

check() {
	cd $_pkgname
	export NO_INTERACTION=1
	export REPORT_EXIT_STATUS=1
	make test
}

package() {
	cd $_pkgname
	# shellcheck disable=SC2154
	make INSTALL_ROOT="$pkgdir" install
	install -Dm644 -t "$pkgdir"/etc/php/conf.d ../$_extname.ini
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
