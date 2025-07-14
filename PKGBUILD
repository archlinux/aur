# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-headers-more
pkgver=0.39
pkgrel=1

_modname="${pkgname#nginx-mainline-mod-}"

pkgdesc="Set and clear input and output headers (module for mainline nginx)"
arch=('i686' 'x86_64')
depends=('nginx-mainline')
makedepends=('nginx-mainline-src')
url="https://github.com/openresty/headers-more-nginx-module"
license=('BSD')

source=(https://github.com/openresty/$_modname-nginx-module/archive/v$pkgver/$_modname-$pkgver.tar.gz)
sha256sums=('dde68d3fa2a9fc7f52e436d2edc53c6d703dcd911283965d889102d3a877c778')

prepare() {
	mkdir -p build
	cd build
	ln -sf /usr/src/nginx/auto
	ln -sf /usr/src/nginx/src
}

build() {
	cd build
	/usr/src/nginx/configure --with-compat --add-dynamic-module=../$_modname-nginx-module-$pkgver
	make modules
}

package() {
	cd build/objs
	for mod in *.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
	done
}
