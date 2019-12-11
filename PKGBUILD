# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-memc
pkgver=0.19
pkgrel=14

_modname="${pkgname#nginx-mainline-mod-}"
_nginxver=1.17.4

pkgdesc='Extended version of the standard memcached module for mainline nginx'
arch=('i686' 'x86_64')
depends=('nginx-mainline')
url="https://github.com/openresty/memc-nginx-module"
license=('BSD')

source=(
	https://nginx.org/download/nginx-$_nginxver.tar.gz{,.asc}
	https://github.com/openresty/$_modname-nginx-module/archive/v$pkgver/$_modname-$pkgver.tar.gz
)

validpgpkeys=(
	'B0F4253373F8F6F510D42178520A9993A1C052F8' # Maxim Dounin <mdounin@mdounin.ru>
)

sha256sums=('62854b365e66670ef4f1f8cc79124f914551444da974207cd5fe22d85710e555'
            'SKIP'
            '8c2bdbe875e4f5225d0778bfb09a2668f9281d7de6218c7b462a7ba2cee06fe8')

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
