# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-modsecurity-git
pkgver=37b76e8
pkgrel=3

_modname=ModSecurity-nginx
_nginxver=1.15.2

pkgdesc='ModSecurity v3 Nginx Connector (module for mainline nginx)'
arch=('i686' 'x86_64')
depends=('nginx-mainline' 'libmodsecurity')
makedepends=('git')
conflicts=('nginx-mainline-mod-security')
provides=('nginx-mainline-mod-security')
url="https://github.com/SpiderLabs/ModSecurity-nginx"
license=('GPL3')

source=(
	https://nginx.org/download/nginx-$_nginxver.tar.gz
	git+https://github.com/SpiderLabs/ModSecurity-nginx.git
)

sha256sums=('eeba09aecfbe8277ac33a5a2486ec2d6731739f3c1c701b42a0c3784af67ad90'
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
