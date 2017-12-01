# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-redis
pkgver=0.3.8
pkgrel=10

_modname="${pkgname#nginx-mainline-mod-}"
_nginxver=1.13.7

pkgdesc='Redis caching module for mainline nginx'
arch=('i686' 'x86_64')
depends=('nginx-mainline')
url="https://www.nginx.com/resources/wiki/modules/redis/"
license=('CUSTOM')

source=(
	https://nginx.org/download/nginx-$_nginxver.tar.gz
	http://people.freebsd.org/~osa/ngx_http_redis-$pkgver.tar.gz
)

sha256sums=('beb732bc7da80948c43fd0bf94940a21a21b1c1ddfba0bd99a4b88e026220f5c'
            '95d0ed7be40da2efc88883d72e52e5e272d2c34463583b7078e8fd6d55004934')

build() {
	cd "$srcdir"/nginx-$_nginxver
	./configure --with-compat --add-dynamic-module=../ngx_http_redis-$pkgver
	make modules
}

package() {
	install -Dm644 "$srcdir"/ngx_http_redis-$pkgver/LICENSE \
	               "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

	cd "$srcdir"/nginx-$_nginxver/objs
	for mod in *.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
	done
}
