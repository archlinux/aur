# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-geoip2
pkgver=3.3
pkgrel=2

_modname="ngx_http_geoip2_module"
_nginxver=1.17.4

pkgdesc="GeoIP2 module for mainline nginx"
arch=('i686' 'x86_64')
depends=('nginx-mainline' 'libmaxminddb')
url="https://github.com/leev/ngx_http_geoip2_module"
license=('BSD')

source=(
	https://nginx.org/download/nginx-$_nginxver.tar.gz{,.asc}
	https://github.com/leev/ngx_http_geoip2_module/archive/$pkgver/$_modname-$pkgver.tar.gz
)

validpgpkeys=(
	'B0F4253373F8F6F510D42178520A9993A1C052F8' # Maxim Dounin <mdounin@mdounin.ru>
)

sha256sums=('62854b365e66670ef4f1f8cc79124f914551444da974207cd5fe22d85710e555'
            'SKIP'
            '41378438c833e313a18869d0c4a72704b4835c30acaf7fd68013ab6732ff78a7')

build() {
	cd "$srcdir"/nginx-$_nginxver
	./configure --with-compat --add-dynamic-module=../$_modname-$pkgver
	make modules
}

package() {
	install -Dm644 "$srcdir"/$_modname-$pkgver/LICENSE \
	               "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

	cd "$srcdir"/nginx-$_nginxver/objs
	for mod in ngx_*.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
	done
}
