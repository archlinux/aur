# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-modsecurity-git
pkgver=a2a5858
pkgrel=3

_modname=ModSecurity-nginx
_nginxver=1.13.6

pkgdesc='ModSecurity v3 Nginx Connector (module for mainline nginx)'
arch=('i686' 'x86_64')
depends=('nginx-mainline' 'libmodsecurity')
makedepends=('git')
url="https://github.com/SpiderLabs/ModSecurity-nginx"
license=('GPL3')

source=(
	https://nginx.org/download/nginx-$_nginxver.tar.gz
	git+https://github.com/SpiderLabs/ModSecurity-nginx.git
)

sha256sums=('8512fc6f986a20af293b61f33b0e72f64a72ea5b1acbcc790c4c4e2d6f63f8f8'
            'SKIP')

pkgver() {
	cd "$srcdir"/$_modname
	git describe --tags --always | sed 's|-|.|g'
}


build() {
	cd "$srcdir"/nginx-$_nginxver
	./configure --with-compat --add-dynamic-module=../$_modname
	make modules
}

package() {
	cd "$srcdir"/nginx-$_nginxver/objs
	for mod in *.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
	done
}
