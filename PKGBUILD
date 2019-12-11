# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-cache_purge
pkgver=2.5
pkgrel=15

_modname="${pkgname#nginx-mainline-mod-}"
_nginxver=1.17.6

pkgdesc='Nginx mainline module with ability to purge content from FastCGI, proxy, SCGI and uWSGI caches'
arch=('i686' 'x86_64')
depends=('nginx-mainline')
url="https://github.com/nginx-modules/ngx_cache_purge"
license=('CUSTOM')

source=(
	https://nginx.org/download/nginx-$_nginxver.tar.gz{,.asc}
	https://github.com/nginx-modules/ngx_cache_purge/archive/$pkgver/ngx_cache_purge-$pkgver.tar.gz
)

validpgpkeys=(
	'B0F4253373F8F6F510D42178520A9993A1C052F8' # Maxim Dounin <mdounin@mdounin.ru>
)

sha256sums=('3cb4a5314dc0ab0a4e8a7b51ae17c027133417a45cc6c5a96e3dd80141c237b6'
            'SKIP'
            '2df8501c7ffcac44d4932939faa686fc3cc56e05cfc05bc411bda3313b05dbdd')

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
