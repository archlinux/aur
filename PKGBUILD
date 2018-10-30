# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-njs
pkgver=0.2.5 # http://hg.nginx.org/njs/tags
pkgrel=1

_modname="${pkgname#nginx-mainline-mod-}"
_nginxver=1.15.5

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

sha256sums=('1a3a889a8f14998286de3b14cc1dd5b2747178e012d6d480a18aa413985dae6f'
            'SKIP'
            '7db275a27c07b04ce81fc6fcdecfd6a9066af57cc4ed2137471fc8b768437506')

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
