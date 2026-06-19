# Maintainer: Guillaume Clément <gclement@baobob.org>
# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=angie-mod-lua
pkgver=0.10.31
pkgrel=1
epoch=1

_modname="${pkgname#angie-mod-}"

pkgdesc='Lua script engine module for Angie'
arch=('i686' 'x86_64')
depends=('angie' 'angie-mod-ndk' 'luajit' 'lua-resty-core' 'pcre2' 'glibc')
makedepends=('angie-src')
url="https://github.com/openresty/lua-nginx-module"
license=('LicenseRef-openresty')

source=(https://github.com/openresty/$_modname-nginx-module/archive/v$pkgver/$_modname-$pkgver.tar.gz
        ${license}.txt
	cookie.patch)
sha256sums=('123d8203e74bf66f71437c7b3fa070bf8d24e6d332981bc18dc2db43303cc741'
            'db9cc61814b06cffc464af6137a1640f8402f863659e19686b2e93900d2b9614'
            '774e46d085ca8bd0d7cd84a36946cf1fd31f284ca9ebc90828b758297614975b')

prepare() {
	patch -d $_modname-nginx-module-$pkgver -p1 < cookie.patch
	mkdir -p build
	cd build
	ln -sf /usr/src/angie/auto
	ln -sf /usr/src/angie/src
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
		xargs -t0 /usr/src/angie/configure \
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
