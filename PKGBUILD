# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-njs
pkgver=0.1.12 # http://hg.nginx.org/njs/tags
pkgrel=2

_modname="${pkgname#nginx-mainline-mod-}"
_nginxver=1.13.4

pkgdesc='nginScript module for mainline nginx'
arch=('i686' 'x86_64')
depends=('nginx-mainline')
url="https://nginx.org/en/docs/njs_about.html"
license=('CUSTOM')

source=(
	https://nginx.org/download/nginx-$_nginxver.tar.gz
	njs-$pkgver.tar.gz::http://hg.nginx.org/njs/archive/$pkgver.tar.gz
)

sha256sums=('de21f3c49ba65c611329d8759a63d72e5fcf719bc6f2a3270e2541348ef1fbba'
            '8884507ef789ee36ee2635224df60b09746a37b20274b13b971dd306fe01bec0')

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
