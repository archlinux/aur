# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-cache_purge
pkgver=2.3.1
pkgrel=2

_modname="${pkgname#nginx-mainline-mod-}"
_nginxver=1.12.0

pkgdesc='Nginx mainline module with ability to purge content from FastCGI, proxy, SCGI and uWSGI caches'
arch=('i686' 'x86_64')
depends=('nginx-mainline')
url="https://github.com/mtorromeo/ngx_cache_purge"
license=('CUSTOM')

source=(
	http://nginx.org/download/nginx-$_nginxver.tar.gz
	https://github.com/mtorromeo/ngx_cache_purge/archive/$pkgver/ngx_cache_purge-$pkgver.tar.gz
)

sha256sums=('b4222e26fdb620a8d3c3a3a8b955e08b713672e1bc5198d1e4f462308a795b30'
            '1ca6347c7c817254594cd6be47d5890dd089f880482cce08971b8a137073de43')

build() {
	cd "$srcdir"/nginx-$_nginxver
	./configure $(nginx -V 2>&1 | grep 'configure arguments' | sed -r 's@^[^:]+: @@') --add-dynamic-module=../ngx_cache_purge-$pkgver
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
