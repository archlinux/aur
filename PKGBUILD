# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# from: github
# what: openresty/lua-nginx-module
# match! rc[0-9]*$

pkgname=nginx-mainline-mod-lua
pkgver=0.10.24
pkgrel=1
epoch=1

_modname="${pkgname#nginx-mainline-mod-}"

pkgdesc='Lua script engine module for mainline nginx'
arch=('i686' 'x86_64')
depends=('nginx-mainline' 'nginx-mainline-mod-ndk' 'luajit' 'lua-resty-core' 'pcre')
makedepends=('nginx-mainline-src')
url="https://github.com/openresty/lua-nginx-module"
license=('BSD')

source=(https://github.com/openresty/$_modname-nginx-module/archive/v$pkgver/$_modname-$pkgver.tar.gz
	cookie.patch)
sha256sums=('c5935ff25557031ab34d960d958a210613c9e6369b97db169b946717eca48fdf'
            '774e46d085ca8bd0d7cd84a36946cf1fd31f284ca9ebc90828b758297614975b')

prepare() {
	patch -d $_modname-nginx-module-$pkgver -p1 < cookie.patch
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
		--with-http_ssl_module \
		--add-dynamic-module=../$_modname-nginx-module-$pkgver
	make modules
}

package() {
	cd build/objs
	for mod in *.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
	done
}
