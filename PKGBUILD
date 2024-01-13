# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-headers-more
pkgver=0.37
pkgrel=1

_modname="${pkgname#nginx-mainline-mod-}"

pkgdesc="Set and clear input and output headers (module for mainline nginx)"
arch=('i686' 'x86_64')
depends=('nginx-mainline')
makedepends=('nginx-mainline-src')
url="https://github.com/openresty/headers-more-nginx-module"
license=('BSD')

source=(https://github.com/openresty/$_modname-nginx-module/archive/v$pkgver/$_modname-$pkgver.tar.gz)
sha256sums=('cf6e169d6b350c06d0c730b0eaf4973394026ad40094cddd3b3a5b346577019d')

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
