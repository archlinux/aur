# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-lua
pkgver=0.10.19
pkgrel=1

_modname="${pkgname#nginx-mainline-mod-}"
_nginxver=1.19.3

pkgdesc='Lua script engine module for mainline nginx'
arch=('i686' 'x86_64')
depends=('nginx-mainline' 'nginx-mainline-mod-ndk' 'luajit' 'lua-resty-core')
url="https://github.com/openresty/lua-nginx-module"
license=('BSD')

source=(
	https://nginx.org/download/nginx-$_nginxver.tar.gz{,.asc}
	https://github.com/openresty/$_modname-nginx-module/archive/v$pkgver/$_modname-$pkgver.tar.gz
)

validpgpkeys=(
	'B0F4253373F8F6F510D42178520A9993A1C052F8' # Maxim Dounin <mdounin@mdounin.ru>
)

sha256sums=('91e5b74fa17879d2463294e93ad8f6ffc066696ae32ad0478ffe15ba0e9e8df0'
            'SKIP'
            '242d60b97eb7459cd0c0d58083cf7f3195d46181829da45ab8b09a857bb0ed01')

build() {
	cd "$srcdir"/nginx-$_nginxver
	LUAJIT_INC=/usr/include/luajit-2.0 \
	LUAJIT_LIB=/usr/lib \
	./configure \
		--with-compat \
		--add-dynamic-module=../$_modname-nginx-module-$pkgver
	make modules
}

package() {
	cd "$srcdir"/nginx-$_nginxver/objs
	for mod in *.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
	done
}
