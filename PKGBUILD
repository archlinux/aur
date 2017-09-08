# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-cache_purge
pkgver=2.3.1
pkgrel=7

_modname="${pkgname#nginx-mainline-mod-}"
_nginxver=1.13.4

pkgdesc='Nginx mainline module with ability to purge content from FastCGI, proxy, SCGI and uWSGI caches'
arch=('i686' 'x86_64')
depends=('nginx-mainline')
url="https://github.com/mtorromeo/ngx_cache_purge"
license=('CUSTOM')

source=(
	https://nginx.org/download/nginx-$_nginxver.tar.gz
	https://github.com/mtorromeo/ngx_cache_purge/archive/$pkgver/ngx_cache_purge-$pkgver.tar.gz
)

sha256sums=('de21f3c49ba65c611329d8759a63d72e5fcf719bc6f2a3270e2541348ef1fbba'
            '1ca6347c7c817254594cd6be47d5890dd089f880482cce08971b8a137073de43')

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
