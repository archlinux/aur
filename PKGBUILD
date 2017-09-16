# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-lua
pkgver=0.10.10
pkgrel=1

_modname="${pkgname#nginx-mainline-mod-}"
_nginxver=1.13.4

pkgdesc='Lua script engine module for mainline nginx'
arch=('i686' 'x86_64')
depends=('nginx-mainline' 'nginx-mainline-mod-ndk' 'luajit')
url="https://github.com/openresty/lua-nginx-module"
license=('BSD')

source=(
	https://nginx.org/download/nginx-$_nginxver.tar.gz
	https://github.com/openresty/$_modname-nginx-module/archive/v$pkgver/$_modname-$pkgver.tar.gz
	openssl-1.1.patch
)

sha256sums=('de21f3c49ba65c611329d8759a63d72e5fcf719bc6f2a3270e2541348ef1fbba'
            'b4acb84e2d631035a516d61830c910ef6e6485aba86096221ec745e0dbb3fbc9'
            '60aed346397e06f870c7e17798f6e3ce11f078c5ae6e573098d53132c1afdb58')

prepare() {
	cd "$srcdir"/$_modname-nginx-module-$pkgver
	patch -p1 -i "$srcdir"/openssl-1.1.patch
}
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
