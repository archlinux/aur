# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-echo
pkgver=0.60
pkgrel=2

_modname="${pkgname#nginx-mainline-mod-}"
_nginxver=1.12.0

pkgdesc='Directives "echo", "sleep", "time" and more (module for mainline nginx)'
arch=('i686' 'x86_64')
depends=('nginx-mainline')
url="https://github.com/openresty/echo-nginx-module"
license=('BSD')

source=(
	http://nginx.org/download/nginx-$_nginxver.tar.gz
	https://github.com/openresty/$_modname-nginx-module/archive/v$pkgver/$_modname-$pkgver.tar.gz
	$pkgname-nginx-1.12.patch::https://patch-diff.githubusercontent.com/raw/openresty/echo-nginx-module/pull/65.patch
)

sha256sums=('b4222e26fdb620a8d3c3a3a8b955e08b713672e1bc5198d1e4f462308a795b30'
            '1077da2229ac7d0a0215e9e6817e297c10697e095010d88f1adbd1add1ce9f4e'
            'cab48c257748e5576a5a6c86965f8ff36d6a36b845d1e9c81f3d2cc0151737c4')

prepare() {
	cd $_modname-nginx-module-$pkgver
	patch -p1 -i "$srcdir"/$pkgname-nginx-1.12.patch
}

build() {
	cd "$srcdir"/nginx-$_nginxver
	./configure $(nginx -V 2>&1 | grep 'configure arguments' | sed -r 's@^[^:]+: @@') --add-dynamic-module=../$_modname-nginx-module-$pkgver
	make modules
}

package() {
	install -Dm644 "$srcdir/"$_modname-nginx-module-$pkgver/LICENSE \
	               "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

	cd "$srcdir"/nginx-$_nginxver/objs
	for mod in *.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
	done
}
