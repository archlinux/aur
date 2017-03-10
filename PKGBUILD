# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-addon-cache_purge
pkgver=2.3.1
pkgrel=1

_modname="${pkgname#nginx-mainline-addon-}"
_nginxver=1.11.10

pkgdesc='Nginx mainline module with ability to purge content from FastCGI, proxy, SCGI and uWSGI caches'
arch=('i686' 'x86_64')
depends=('nginx-mainline')
url="https://github.com/mtorromeo/ngx_cache_purge"
license=('CUSTOM')

source=(
	http://nginx.org/download/nginx-$_nginxver.tar.gz
	https://github.com/mtorromeo/ngx_cache_purge/archive/$pkgver/ngx_cache_purge-$pkgver.tar.gz
)

sha256sums=('778b3cabb07633f754cd9dee32fc8e22582bce22bfa407be76a806abd935533d'
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
