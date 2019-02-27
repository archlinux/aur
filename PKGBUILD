# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-lua
pkgver=0.10.13
pkgrel=1

_modname="${pkgname#nginx-mainline-mod-}"
_nginxver=1.15.9

pkgdesc='Lua script engine module for mainline nginx'
arch=('i686' 'x86_64')
depends=('nginx-mainline' 'nginx-mainline-mod-ndk' 'luajit')
url="https://github.com/openresty/lua-nginx-module"
license=('BSD')

source=(
	https://nginx.org/download/nginx-$_nginxver.tar.gz{,.asc}
	https://github.com/openresty/$_modname-nginx-module/archive/v$pkgver/$_modname-$pkgver.tar.gz
)

validpgpkeys=(
	'B0F4253373F8F6F510D42178520A9993A1C052F8' # Maxim Dounin <mdounin@mdounin.ru>
)

sha256sums=('e4cfba989bba614cd53f3f406ac6da9f05977d6b1296e5d20a299f10c2d7ae43'
            'SKIP'
            'ecea8c3d7f69dd48c6132498ddefb5d83ba9f387fa3d4da14e2abeacdfc8a3ee')

build() {
	cd "$srcdir"/nginx-$_nginxver
	./configure --with-compat --add-dynamic-module=../$_modname-nginx-module-$pkgver
	make modules
}

package() {
	cd "$srcdir"/nginx-$_nginxver/objs
	for mod in *.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
	done
}
