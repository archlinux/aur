# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-redis2
pkgver=0.14
pkgrel=1

_modname="${pkgname#nginx-mainline-mod-}"
_nginxver=1.13.1

pkgdesc='Redis 2.0 protocol module for mainline nginx'
arch=('i686' 'x86_64')
depends=('nginx-mainline')
url="https://github.com/openresty/redis2-nginx-module"
license=('BSD')

source=(
	https://nginx.org/download/nginx-$_nginxver.tar.gz
	https://github.com/openresty/$_modname-nginx-module/archive/v$pkgver/$_modname-$pkgver.tar.gz
	$pkgname-$pkgver-default_port.patch::https://github.com/openresty/redis2-nginx-module/commit/8cc7304787ae9542db4feb50d9e27beb485caa0f.patch
)

sha256sums=('a5856c72a6609a4dc68c88a7f3c33b79e6693343b62952e021e043fe347b6776'
            'd830e072fcb4acee8490ba3e38eee6034fd884a954d17ad4efeb397032c58a71'
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
