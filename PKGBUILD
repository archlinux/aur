# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-njs
pkgver=0.1.9 # http://hg.nginx.org/njs/tags
pkgrel=3

_modname="${pkgname#nginx-mainline-mod-}"
_nginxver=1.13.0

pkgdesc='nginScript module for mainline nginx'
arch=('i686' 'x86_64')
depends=('nginx-mainline')
url="http://nginx.org/en/docs/njs_about.html"
license=('CUSTOM')

source=(
	http://nginx.org/download/nginx-$_nginxver.tar.gz
	njs-$pkgver.tar.gz::http://hg.nginx.org/njs/archive/$pkgver.tar.gz
)

sha256sums=('79f52ab6550f854e14439369808105b5780079769d7b8db3856be03c683605d7'
            '2caf900cab71addde7d9aa64aa53adee7c7c02798e44a28ba9cc014391d998a5')

build() {
	cd "$srcdir"/nginx-$_nginxver
	./configure $(nginx -V 2>&1 | grep 'configure arguments' | sed -r 's@^[^:]+: @@') --add-dynamic-module=../njs-$pkgver/nginx
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
