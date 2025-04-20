# Maintainer: Costin Botescu <costin.botescu@gmail.com>
pkgname=ocompiler
pkgname_atsource=o
pkgver=1.5+225
pkgrel=2
pkgdesc="O language compiler"
arch=('x86_64')
url="https://github.com/colin-i/${pkgname_atsource}"
license=('0BSD')
depends=('lib32-glibc')
makedepends=('lib32-glibc' 'bc')
source=("${pkgname_atsource}-`echo ${pkgver} | sed 's/\./\-/'`.tar.gz::https://github.com/colin-i/${pkgname_atsource}/archive/`echo ${pkgver} | sed 's/\./\-/'`.tar.gz"
	"obj.txt::https://github.com/colin-i/${pkgname_atsource}/releases/download/`echo ${pkgver} | sed 's/\./\-/'`/obj.txt")
sha256sums=('bd4c0d1680232e6c1fefb74c22e9289fad8f6a2a802790a4e506d90da7c2a2ae'
	'c4dabe84b108379ada23137d656ea8cb9c500b0c79c7324d1a52c8c87497029e')

ver_atsource_fn() {
	cd "${pkgname_atsource}-`echo ${pkgver} | sed 's/\./\-/; s/+/\-/'`"
}

prepare() {
	patches="`cat ../list`"
	ver_atsource_fn
	for var in ${patches[@]}; do
		echo ${var}
		patch --strip=1 --input=../../${var}
	done
	ln ../../obj.txt src
}

build() {
	ver_atsource_fn
	L=-L/usr/lib32 make
}

check() {
	ver_atsource_fn
	L=-L/usr/lib32 make test
}

package() {
	ver_atsource_fn
	make DESTDIR="$pkgdir/" install
}
