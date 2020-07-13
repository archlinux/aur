# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-lua
pkgver=0.10.17
pkgrel=1

_modname="${pkgname#nginx-mainline-mod-}"
_nginxver=1.19.1

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

sha256sums=('a004776c64ed3c5c7bc9b6116ba99efab3265e6b81d49a57ca4471ff90655492'
            'SKIP'
            '1ebdcb041ca3bd238813ef6de352285e7418e6001c41a0a260b447260e37716e')

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
