# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-modsecurity-git
pkgver=3de175b
pkgrel=1

_modname=ModSecurity-nginx
_nginxver=1.13.0

pkgdesc='ModSecurity v3 Nginx Connector (module for mainline nginx)'
arch=('i686' 'x86_64')
depends=('nginx-mainline' 'libmodsecurity-git')
makedepends=('git')
url="https://github.com/SpiderLabs/ModSecurity-nginx"
license=('GPL3')

source=(
	http://nginx.org/download/nginx-$_nginxver.tar.gz
	git+https://github.com/SpiderLabs/ModSecurity-nginx.git
)

sha256sums=('79f52ab6550f854e14439369808105b5780079769d7b8db3856be03c683605d7'
            'SKIP')

pkgver() {
	cd "$srcdir"/$_modname
	git describe --tags --always | sed 's|-|.|g'
}


build() {
	cd "$srcdir"/nginx-$_nginxver
	./configure $(nginx -V 2>&1 | grep 'configure arguments' | sed -r 's@^[^:]+: @@') --add-dynamic-module=../$_modname
	make modules
}

package() {
	cd "$srcdir"/nginx-$_nginxver/objs
	for mod in *.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
	done
}
