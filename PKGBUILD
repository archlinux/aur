# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-brotli
epoch=1
pkgver=1.0.0rc
pkgrel=1

_modname="ngx_${pkgname#nginx-mainline-mod-}"
_nginxver=1.19.0

pkgdesc="Brotli compression filter module for mainline nginx"
arch=('i686' 'x86_64')
depends=('nginx-mainline' 'brotli')
url="https://github.com/google/ngx_brotli"
license=('CUSTOM')

source=(
	https://nginx.org/download/nginx-$_nginxver.tar.gz{,.asc}
	https://github.com/google/$_modname/archive/v$pkgver/$_modname-$pkgver.tar.gz
)

validpgpkeys=(
	'B0F4253373F8F6F510D42178520A9993A1C052F8' # Maxim Dounin <mdounin@mdounin.ru>
)

sha256sums=('44a616171fcd7d7ad7c6af3e6f3ad0879b54db5a5d21be874cd458b5691e36c8'
            'SKIP'
            'c85cdcfd76703c95aa4204ee4c2e619aa5b075cac18f428202f65552104add3b')

prepare() {
	cd "$srcdir"/$_modname-$pkgver
	sed 's@/usr/local@/usr@' -i config
}

build() {
	cd "$srcdir"/nginx-$_nginxver
	./configure --with-compat --add-dynamic-module=../$_modname-$pkgver
	make modules
}

package() {
	install -Dm644 "$srcdir"/$_modname-$pkgver/LICENSE \
	               "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

	cd "$srcdir"/nginx-$_nginxver/objs
	for mod in ngx_*.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
	done
}
