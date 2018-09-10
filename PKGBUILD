# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-lua
pkgver=0.10.13
pkgrel=3

_modname="${pkgname#nginx-mainline-mod-}"
_nginxver=1.15.3

pkgdesc='Lua script engine module for mainline nginx'
arch=('i686' 'x86_64')
depends=('nginx-mainline' 'nginx-mainline-mod-ndk' 'luajit')
url="https://github.com/openresty/lua-nginx-module"
license=('BSD')

source=(
	https://nginx.org/download/nginx-$_nginxver.tar.gz
	https://github.com/openresty/$_modname-nginx-module/archive/v$pkgver/$_modname-$pkgver.tar.gz
)

sha256sums=('9391fb91c3e2ebd040a4e3ac2b2f0893deb6232edc30a8e16fcc9c3fa9d6be85'
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
