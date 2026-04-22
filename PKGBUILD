# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Maintainer: Vladislav Minakov <v@minakov.pro>

_setmiscver=0.33
_ndkver=0.3.4

pkgbase=angie-mod-ndk
pkgname=(angie-mod-ndk angie-mod-set-misc)
pkgver=$_setmiscver+$_ndkver
pkgrel=1

pkgdesc="Angie module that adds additional generic tools that module developers can use in their own modules"
arch=('x86_64')
makedepends=('angie' 'angie-src')
url="https://github.com/openresty/set-misc-nginx-module"
license=('BSD-2-Clause')

source=(
	https://github.com/openresty/set-misc-nginx-module/archive/v$_setmiscver/set-misc-$_setmiscver.tar.gz
	https://github.com/simpl/ngx_devel_kit/archive/v$_ndkver/ngx_devel_kit-$_ndkver.tar.gz
)
sha256sums=('cd5e2cc834bcfa30149e7511f2b5a2183baf0b70dc091af717a89a64e44a2985'
            '14a28063294f645d457b1eb10e3c23bbba44398f1c5f021421b58b6f8ab31662')

prepare() {
	mkdir -p build
	cd build
	ln -sf /usr/src/angie/auto
	ln -sf /usr/src/angie/src
}

build() {
	cd build
	/usr/src/angie/configure \
		--with-ld-opt="$LDFLAGS" \
		--with-compat \
	  --add-dynamic-module=../ngx_devel_kit-$_ndkver \
	  --add-dynamic-module=../set-misc-nginx-module-$_setmiscver
	make modules
}

package_angie-mod-ndk() {
	pkgdesc="Angie module that adds additional generic tools that module developers can use in their own modules"
	backup=('etc/nginx/modules.d/20-ndk.conf')
	if [[ "$BUILDTOOL" == devtools ]]; then
		local nginx_dep="nginx=$(nginx -v 2>&1 | sed 's|.*/||')"
		depends+=($nginx_dep)
	else
		depends+=(nginx)
	fi

	install -dm0755 "$pkgdir"/etc/nginx/modules.d

	cd build/objs
	install -Dm755 ndk_http_module.so "$pkgdir"/usr/lib/nginx/modules/ndk_http_module.so
	echo 'load_module "/usr/lib/nginx/modules/ndk_http_module.so";' >> "$pkgdir/etc/nginx/modules.d/20-ndk.conf"

	cd "$srcdir"/ngx_devel_kit-$_ndkver
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_angie-mod-set-misc() {
	pkgdesc="Angie module that adds various set_xxx directives"
	backup=('etc/nginx/modules.d/20-set-misc.conf')
	depends=('angie-mod-ndk')
	if [[ "$BUILDTOOL" == devtools ]]; then
		local nginx_dep="nginx=$(nginx -v 2>&1 | sed 's|.*/||')"
		depends+=($nginx_dep)
	else
		depends+=(nginx)
	fi

	install -dm0755 "$pkgdir"/etc/nginx/modules.d

	cd build/objs
	install -Dm755 ngx_http_set_misc_module.so "$pkgdir"/usr/lib/nginx/modules/ngx_http_set_misc_module.so
	echo 'load_module "/usr/lib/nginx/modules/ngx_http_set_misc_module.so";' >> "$pkgdir/etc/nginx/modules.d/20-set-misc.conf"

	install -Dm644 "$srcdir"/set-misc-nginx-module-$_setmiscver/README.markdown \
	               "$pkgdir"/usr/share/licenses/$pkgname/README.markdown
}
