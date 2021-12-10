# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# from: github
# what: openresty/lua-nginx-module

pkgname=nginx-mainline-mod-lua
pkgver=0.10.21rc1
pkgrel=1

_modname="${pkgname#nginx-mainline-mod-}"

pkgdesc='Lua script engine module for mainline nginx'
arch=('i686' 'x86_64')
depends=('nginx-mainline' 'nginx-mainline-mod-ndk' 'luajit' 'lua-resty-core')
makedepends=('nginx-mainline-src')
url="https://github.com/openresty/lua-nginx-module"
license=('BSD')

source=(https://github.com/openresty/$_modname-nginx-module/archive/v$pkgver/$_modname-$pkgver.tar.gz)
sha256sums=('45001dbce64d4aff44ab52c238cd30febfa0367a8a5c09fb8a83e202c52dcaa1')

prepare() {
	mkdir -p build
	cd build
	ln -sf /usr/src/nginx/auto
	ln -sf /usr/src/nginx/src
}

build() {
	cd build
	LUAJIT_INC=/usr/include/luajit-2.0 \
	LUAJIT_LIB=/usr/lib \
	/usr/src/nginx/configure \
		--with-compat \
		--add-dynamic-module=../$_modname-nginx-module-$pkgver
	make modules
}

package() {
	cd build/objs
	for mod in *.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
	done
}
