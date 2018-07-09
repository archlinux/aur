# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-memc
pkgver=0.18
pkgrel=11

_modname="${pkgname#nginx-mainline-mod-}"
_nginxver=1.15.1

pkgdesc='Extended version of the standard memcached module for mainline nginx'
arch=('i686' 'x86_64')
depends=('nginx-mainline')
url="https://github.com/openresty/memc-nginx-module"
license=('BSD')

source=(
	https://nginx.org/download/nginx-$_nginxver.tar.gz
	https://github.com/openresty/$_modname-nginx-module/archive/v$pkgver/$_modname-$pkgver.tar.gz
)

sha256sums=('c7206858d7f832b8ef73a45c9b8f8e436bcb1ee88db2bc85b8e438ecec9d5460'
            '4e280d1dcb8b312bc7875604c1e35b17879279126d3d5fbf482aa9cc7c11276d')

build() {
	cd "$srcdir"/nginx-$_nginxver
	./configure --with-compat --add-dynamic-module=../$_modname-nginx-module-$pkgver
	make modules
}

package() {
	cd "$srcdir"/nginx-$_nginxver/objs
	for mod in *.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
	done
}
