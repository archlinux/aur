# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-naxsi
pkgver=0.55.3
pkgrel=17

_modname=naxsi
_nginxver=1.15.3

pkgdesc='Nginx Anti XSS & SQL Injection (module for mainline nginx)'
arch=('i686' 'x86_64')
depends=('nginx-mainline')
url="https://github.com/nbs-system/naxsi"
license=('GPL3')
backup=('etc/nginx/naxsi_core.rules')

source=(
	https://nginx.org/download/nginx-$_nginxver.tar.gz
	https://github.com/nbs-system/$_modname/archive/$pkgver/$_modname-$pkgver.tar.gz
)

sha256sums=('9391fb91c3e2ebd040a4e3ac2b2f0893deb6232edc30a8e16fcc9c3fa9d6be85'
            '0b3c95d250772dc89ad8b49e47c1e024c5ae2c76c0cffa445e9fe05c4dd13495')

build() {
	cd "$srcdir"/nginx-$_nginxver
	./configure --with-compat --add-dynamic-module=../$_modname-$pkgver/naxsi_src
	make modules
}

package() {
	cd "$srcdir"/nginx-$_nginxver/objs
	for mod in *.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
	done

	cd "$srcdir"/$_modname-$pkgver
	install -Dm644 naxsi_config/naxsi_core.rules "$pkgdir"/etc/nginx/naxsi_core.rules
}
