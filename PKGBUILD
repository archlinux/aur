# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-geoip2
pkgver=3.4
pkgrel=1

_modname="ngx_http_geoip2_module"

pkgdesc="GeoIP2 module for mainline nginx"
arch=('i686' 'x86_64')
depends=('nginx-mainline' 'libmaxminddb')
makedepends=('nginx-mainline-src')
url="https://github.com/leev/ngx_http_geoip2_module"
license=('BSD')

source=(https://github.com/leev/ngx_http_geoip2_module/archive/$pkgver/$_modname-$pkgver.tar.gz)
sha256sums=('ad72fc23348d715a330994984531fab9b3606e160483236737f9a4a6957d9452')

prepare() {
	mkdir -p build
	cd build
	ln -sf /usr/src/nginx/auto
	ln -sf /usr/src/nginx/src
}

build() {
	cd build
	/usr/src/nginx/configure --with-compat --add-dynamic-module=../$_modname-$pkgver
	make modules
}

package() {
	install -Dm644 "$srcdir"/$_modname-$pkgver/LICENSE \
	               "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

	cd build/objs
	for mod in ngx_*.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
	done
}
