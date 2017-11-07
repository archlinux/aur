# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-passenger
pkgver=5.1.11
pkgrel=2

_modname="${pkgname#nginx-mainline-mod-}"
_nginxver=1.13.6

pkgdesc="Fast and robust web server and application server for Ruby, Python and Node.js (module for mainline nginx)"
arch=('i686' 'x86_64')
depends=('nginx-mainline' 'ruby')
url="https://www.phusionpassenger.com"
license=('MIT')

source=(
	https://nginx.org/download/nginx-$_nginxver.tar.gz
	https://github.com/phusion/passenger/archive/release-$pkgver/$_modname-$pkgver.tar.gz
)

sha256sums=('8512fc6f986a20af293b61f33b0e72f64a72ea5b1acbcc790c4c4e2d6f63f8f8'
            '88909e11eec02ff23115ab6d7c3e14ad4d84af6eee13ae6ebb4ceaa2827e6b4c')

build() {
	cd "$srcdir"/nginx-$_nginxver
	./configure --with-compat --add-dynamic-module=../$_modname-release-$pkgver/src/nginx_module
	make modules
}

package() {
	install -Dm644 "$srcdir"/$_modname-release-$pkgver/LICENSE \
	               "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

	cd "$srcdir"/nginx-$_nginxver/objs
	for mod in ngx_*.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
	done
}
