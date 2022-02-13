# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# from: github
# what: openresty/lua-nginx-module
# match! rc[0-9]*$

pkgname=nginx-mainline-mod-lua
pkgver=0.10.20
pkgrel=4
epoch=1

_modname="${pkgname#nginx-mainline-mod-}"

pkgdesc='Lua script engine module for mainline nginx'
arch=('i686' 'x86_64')
depends=('nginx-mainline' 'nginx-mainline-mod-ndk' 'luajit' 'lua-resty-core' 'pcre')
makedepends=('nginx-mainline-src')
url="https://github.com/openresty/lua-nginx-module"
license=('BSD')

source=(https://github.com/openresty/$_modname-nginx-module/archive/v$pkgver/$_modname-$pkgver.tar.gz)
sha256sums=('efeb38afc966dec36a086a99f9b8706b8a343e5e44d75c19bf8f017ea6657313')

prepare() {
	mkdir -p build
	cd build
	ln -sf /usr/src/nginx/auto
	ln -sf /usr/src/nginx/src
}

build() {
	cd build
	export LUAJIT_INC=$(pkg-config luajit --variable=includedir)
	export LUAJIT_LIB=$(pkg-config luajit --variable=libdir)
	/usr/src/nginx/configure \
		--with-compat \
		--with-ld-opt='-lpcre -Wl,-E'  \
		--add-dynamic-module=../$_modname-nginx-module-$pkgver
	make modules
}

package() {
	cd build/objs
	for mod in *.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
	done
}
