# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-passenger
pkgver=6.0.0
pkgrel=2

_modname="${pkgname#nginx-mainline-mod-}"
_nginxver=1.15.7

pkgdesc="Fast and robust web server and application server for Ruby, Python and Node.js (module for mainline nginx)"
arch=('i686' 'x86_64')
depends=('nginx-mainline' 'ruby')
makedepends=('ruby-rake')
url="https://www.phusionpassenger.com"
license=('MIT')

source=(
	https://nginx.org/download/nginx-$_nginxver.tar.gz{,.asc}
	https://github.com/phusion/passenger/archive/release-$pkgver/$_modname-$pkgver.tar.gz
)

validpgpkeys=(
	'B0F4253373F8F6F510D42178520A9993A1C052F8' # Maxim Dounin <mdounin@mdounin.ru>
)

sha256sums=('8f22ea2f6c0e0a221b6ddc02b6428a3ff708e2ad55f9361102b1c9f4142bdf93'
            'SKIP'
            'b36e71a42e6ddd3f9dd0596c78a8a04e56720da4bf70b54b746a3e3f016ec5fe')

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
