# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-cache_purge
pkgver=2.4.2
pkgrel=11

_modname="${pkgname#nginx-mainline-mod-}"
_nginxver=1.15.4

pkgdesc='Nginx mainline module with ability to purge content from FastCGI, proxy, SCGI and uWSGI caches'
arch=('i686' 'x86_64')
depends=('nginx-mainline')
url="https://github.com/nginx-modules/ngx_cache_purge"
license=('CUSTOM')

source=(
	https://nginx.org/download/nginx-$_nginxver.tar.gz
	https://github.com/nginx-modules/ngx_cache_purge/archive/$pkgver/ngx_cache_purge-$pkgver.tar.gz
)

sha256sums=('3324776c800d974ceae8797ab9102ca26a8c3656f5c6fb3f31f2cb1e719458e7'
            '067a10ae2a6d623deed5614d9fc55ec9b380d3b6060fd1e32e71c6f955d11cfc')

build() {
	cd "$srcdir"/nginx-$_nginxver
	./configure --with-compat --add-dynamic-module=../ngx_cache_purge-$pkgver
	make modules
}

package() {
	install -Dm644 "$srcdir"/ngx_cache_purge-$pkgver/LICENSE \
	               "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

	cd "$srcdir"/nginx-$_nginxver/objs
	for mod in *.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
	done
}
