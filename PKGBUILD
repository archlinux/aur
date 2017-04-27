# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-headers-more
pkgver=0.32
pkgrel=3

_modname="${pkgname#nginx-mainline-mod-}"
_nginxver=1.13.0

pkgdesc="Set and clear input and output headers (module for mainline nginx)"
arch=('i686' 'x86_64')
depends=('nginx-mainline')
url="https://github.com/openresty/headers-more-nginx-module"
license=('BSD')

source=(
	http://nginx.org/download/nginx-$_nginxver.tar.gz
	https://github.com/openresty/$_modname-nginx-module/archive/v$pkgver/$_modname-$pkgver.tar.gz
)

sha256sums=('79f52ab6550f854e14439369808105b5780079769d7b8db3856be03c683605d7'
            'c6d9dab8ea1fc997031007e2e8f47cced01417e203cd88d53a9fe9f6ae138720')

build() {
	cd "$srcdir"/nginx-$_nginxver
	./configure $(nginx -V 2>&1 | grep 'configure arguments' | sed -r 's@^[^:]+: @@') --add-dynamic-module=../$_modname-nginx-module-$pkgver
	make modules
}

package() {
	cd "$srcdir"/nginx-$_nginxver/objs
	for mod in *.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
	done
}
