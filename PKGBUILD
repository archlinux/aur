# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-njs
pkgver=0.1.14 # http://hg.nginx.org/njs/tags
pkgrel=7

_modname="${pkgname#nginx-mainline-mod-}"
_nginxver=1.13.10

pkgdesc='nginScript module for mainline nginx'
arch=('i686' 'x86_64')
depends=('nginx-mainline')
url="https://nginx.org/en/docs/njs_about.html"
license=('CUSTOM')

source=(
	https://nginx.org/download/nginx-$_nginxver.tar.gz
	njs-$pkgver.tar.gz::http://hg.nginx.org/njs/archive/$pkgver.tar.gz
)

sha256sums=('336182104d90be3c40c874f7f06f87dbb357da1dc74ea573ad081a0f29a94885'
            'aa0e15ee27d193f0b4990438c9886b4d17ca39058136e759547a86fd2be4cc27')

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
