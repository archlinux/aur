# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-ndk
pkgver=0.3.0
pkgrel=40

_modname="ngx_devel_kit"
_nginxver=1.19.0

pkgdesc="Module for mainline nginx that adds generic tools that module developers can use"
arch=('i686' 'x86_64')
depends=('nginx-mainline')
url="https://github.com/simpl/ngx_devel_kit"
license=('BSD')

source=(
	https://nginx.org/download/nginx-$_nginxver.tar.gz{,.asc}
	https://github.com/simpl/$_modname/archive/v$pkgver/$_modname-$pkgver.tar.gz
)

validpgpkeys=(
	'B0F4253373F8F6F510D42178520A9993A1C052F8' # Maxim Dounin <mdounin@mdounin.ru>
)

sha256sums=('44a616171fcd7d7ad7c6af3e6f3ad0879b54db5a5d21be874cd458b5691e36c8'
            'SKIP'
            '88e05a99a8a7419066f5ae75966fb1efc409bad4522d14986da074554ae61619')

build() {
	cd "$srcdir"/nginx-$_nginxver
	./configure --with-compat --add-dynamic-module=../$_modname-$pkgver
	make modules
}

package() {
	install -Dm644 "$srcdir"/$_modname-$pkgver/LICENSE \
	               "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

	cd "$srcdir"/nginx-$_nginxver/objs
	for mod in *.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
	done
}
