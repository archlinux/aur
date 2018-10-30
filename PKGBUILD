# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-passenger
pkgver=5.3.5
pkgrel=1

_modname="${pkgname#nginx-mainline-mod-}"
_nginxver=1.15.5

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

sha256sums=('1a3a889a8f14998286de3b14cc1dd5b2747178e012d6d480a18aa413985dae6f'
            'SKIP'
            '63cbff2a60769e1f20f000afa5232afda2ac888a37bfe080a84ff97714895a18')

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
