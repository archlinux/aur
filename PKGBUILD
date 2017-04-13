# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-redis2
pkgver=0.13
pkgrel=2

_modname="${pkgname#nginx-mainline-mod-}"
_nginxver=1.12.0

pkgdesc='Redis 2.0 protocol module for mainline nginx'
arch=('i686' 'x86_64')
depends=('nginx-mainline')
url="https://github.com/openresty/redis2-nginx-module"
license=('BSD')

source=(
	http://nginx.org/download/nginx-$_nginxver.tar.gz
	https://github.com/openresty/$_modname-nginx-module/archive/v$pkgver/$_modname-$pkgver.tar.gz
	$pkgname-$pkgver-default_port.patch::https://github.com/openresty/redis2-nginx-module/commit/8cc7304787ae9542db4feb50d9e27beb485caa0f.patch
)

sha256sums=('b4222e26fdb620a8d3c3a3a8b955e08b713672e1bc5198d1e4f462308a795b30'
            '1d2486e38cf10390961d507e0e1252e898c8cbc89bbef618f7439d6c23708523'
            'a3d26087eabe17708ab0a9b32026d80eb7004a7539768602a0c4aaa55988217c')

prepare() {
	cd "$srcdir"/$_modname-nginx-module-$pkgver
	patch -p1 -i "$srcdir"/$pkgname-$pkgver-default_port.patch
}

build() {
	cd "$srcdir"/nginx-$_nginxver
	./configure $(nginx -V 2>&1 | grep 'configure arguments' | sed -r 's@^[^:]+: @@') --add-dynamic-module=../$_modname-nginx-module-$pkgver
	make modules
}

package() {
	cd "$srcdir"/nginx-$_nginxver/objs
	for mod in *.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
	done
}
