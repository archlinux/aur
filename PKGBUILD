# Maintainer: Guillaume Clément <gclement@baobob.org>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# from: github
# what: openresty/lua-nginx-module
# match! rc[0-9]*$

# This PKGBUILD is just an adaptation of the nginx-mod-lua from 

pkgname=nginx-mod-lua
pkgver=0.10.28
pkgrel=1
epoch=1

_modname="${pkgname#nginx-mod-}"

pkgdesc='Lua script engine module for nginx'
arch=('i686' 'x86_64')
depends=('nginx' 'nginx-mod-ndk' 'luajit' 'lua-resty-core' 'pcre2' 'glibc')
makedepends=('nginx-src')
url="https://github.com/openresty/lua-nginx-module"
license=('LicenseRef-openresty')

source=(https://github.com/openresty/$_modname-nginx-module/archive/v$pkgver/$_modname-$pkgver.tar.gz
        ${license}.txt
	cookie.patch)
sha256sums=('634827d54de6216cb0502d14f76610788b3a3e33160e91d5578d6db0d9a34a20'
            'db9cc61814b06cffc464af6137a1640f8402f863659e19686b2e93900d2b9614'
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
	nginx -V 2>&1 |
		grep -o -- '--prefix=.*$' |
		xargs printf '%s\0' |
		sed -z \
			-e'/^--with-.*=dynamic$/d' |
		xargs -t0 /usr/src/nginx/configure \
			--add-dynamic-module=../$_modname-nginx-module-$pkgver
	make modules
}

package() {
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "../${license}.txt"
	cd build/objs
	for mod in *.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
	done
}
