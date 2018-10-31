# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

_setmiscver=0.31
_ndkver=0.3.0

pkgname=nginx-mainline-mod-ndk-set-misc
pkgver=$_setmiscver+$_ndkver
pkgrel=20

_modname=set-misc
_nginxver=1.15.5

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

sha256sums=('1a3a889a8f14998286de3b14cc1dd5b2747178e012d6d480a18aa413985dae6f'
            'SKIP'
            '97946a68937b50ab8637e1a90a13198fe376d801dc3e7447052e43c28e9ee7de'
            '88e05a99a8a7419066f5ae75966fb1efc409bad4522d14986da074554ae61619')

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
