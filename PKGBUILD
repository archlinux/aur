# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

_setmiscver=0.32
_ndkver=0.3.1

pkgname=nginx-mainline-mod-ndk-set-misc
pkgver=$_setmiscver+$_ndkver
pkgrel=3

_modname=set-misc
_nginxver=1.19.3

pkgdesc="Various set_xxx directives added to nginx's rewrite + ngx_devel_kit (module for mainline nginx)"
arch=('i686' 'x86_64')
depends=('nginx-mainline')
conflicts=('nginx-mainline-mod-ndk')
provides=('nginx-mainline-mod-ndk')
url="https://github.com/openresty/set-misc-nginx-module"
license=('BSD')

source=(
	https://nginx.org/download/nginx-$_nginxver.tar.gz{,.asc}
	https://github.com/openresty/$_modname-nginx-module/archive/v$_setmiscver/$_modname-$_setmiscver.tar.gz
	https://github.com/simpl/ngx_devel_kit/archive/v$_ndkver/ngx_devel_kit-$_ndkver.tar.gz
)

validpgpkeys=(
	'B0F4253373F8F6F510D42178520A9993A1C052F8' # Maxim Dounin <mdounin@mdounin.ru>
)

sha256sums=('91e5b74fa17879d2463294e93ad8f6ffc066696ae32ad0478ffe15ba0e9e8df0'
            'SKIP'
            'f1ad2459c4ee6a61771aa84f77871f4bfe42943a4aa4c30c62ba3f981f52c201'
            '0e971105e210d272a497567fa2e2c256f4e39b845a5ba80d373e26ba1abfbd85')

build() {
	cd "$srcdir"/nginx-$_nginxver
	./configure --with-compat \
	  --add-dynamic-module=../ngx_devel_kit-$_ndkver \
	  --add-dynamic-module=../$_modname-nginx-module-$_setmiscver
	make modules
}

package() {
	cd "$srcdir"/nginx-$_nginxver/objs
	for mod in *.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
	done
}
