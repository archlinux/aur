# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-njs
pkgver=0.2.8 # http://hg.nginx.org/njs/tags
pkgrel=6

_modname="${pkgname#nginx-mainline-mod-}"
_nginxver=1.15.9

pkgdesc='nginScript module for mainline nginx'
arch=('i686' 'x86_64')
depends=('nginx-mainline')
url="https://nginx.org/en/docs/njs_about.html"
license=('CUSTOM')

source=(
	https://nginx.org/download/nginx-$_nginxver.tar.gz{,.asc}
	njs-$pkgver.tar.gz::http://hg.nginx.org/njs/archive/$pkgver.tar.gz
)

validpgpkeys=(
	'B0F4253373F8F6F510D42178520A9993A1C052F8' # Maxim Dounin <mdounin@mdounin.ru>
)

sha256sums=('e4cfba989bba614cd53f3f406ac6da9f05977d6b1296e5d20a299f10c2d7ae43'
            'SKIP'
            '8f0c9ab2a635079496d87b3dd15a25de9c27f18632fd8fccf7612f41da115e5f')

build() {
	cd "$srcdir"/nginx-$_nginxver
	./configure --with-compat --with-stream --add-dynamic-module=../njs-$pkgver/nginx
	make modules
}

package() {
	install -Dm644 "$srcdir"/njs-$pkgver/LICENSE \
	               "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

	cd "$srcdir"/nginx-$_nginxver/objs
	for mod in *.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
	done
}
