# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-modsecurity-git
pkgver=abbf2c4
pkgrel=2

_modname=ModSecurity-nginx
_nginxver=1.13.3

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

sha256sums=('5b73f98004c302fb8e4a172abf046d9ce77739a82487e4873b39f9b0dcbb0d72'
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
