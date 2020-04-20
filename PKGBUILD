# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-njs
pkgver=0.3.9 # http://hg.nginx.org/njs/tags
pkgrel=2

_modname="${pkgname#nginx-mainline-mod-}"
_nginxver=1.17.10

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

sha256sums=('a9aa73f19c352a6b166d78e2a664bb3ef1295bbe6d3cc5aa7404bd4664ab4b83'
            'SKIP'
            '83861f2612137dc7c44cc673243a16ba7d44f27e6d6785ac2be33777b5ad670f')

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
