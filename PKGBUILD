# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-headers-more
pkgver=0.33
pkgrel=33

_modname="${pkgname#nginx-mainline-mod-}"

pkgdesc="Set and clear input and output headers (module for mainline nginx)"
arch=('i686' 'x86_64')
depends=('nginx-mainline')
makedepends=('nginx-mainline-src')
url="https://github.com/openresty/headers-more-nginx-module"
license=('BSD')

source=(https://github.com/openresty/$_modname-nginx-module/archive/v$pkgver/$_modname-$pkgver.tar.gz)
sha256sums=('a3dcbab117a9c103bc1ea5200fc00a7b7d2af97ff7fd525f16f8ac2632e30fbf')

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
