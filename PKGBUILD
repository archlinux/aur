# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-modsecurity-git
pkgver=v1.0.1.12.g22e53ab
pkgrel=2

_modname=ModSecurity-nginx

pkgdesc='ModSecurity v3 Nginx Connector (module for mainline nginx)'
arch=('i686' 'x86_64')
depends=('nginx-mainline' 'libmodsecurity')
makedepends=('nginx-mainline-src' 'git')
conflicts=('nginx-mainline-mod-security')
provides=('nginx-mainline-mod-security')
url="https://github.com/SpiderLabs/ModSecurity-nginx"
license=('GPL3')

source=(git+https://github.com/SpiderLabs/ModSecurity-nginx.git)
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir"/$_modname
	git describe --tags --always | sed 's|-|.|g'
}

prepare() {
	mkdir -p build
	cd build
	ln -sf /usr/src/nginx/auto
	ln -sf /usr/src/nginx/src
}

build() {
	cd build
	/usr/src/nginx/configure --with-compat --add-dynamic-module=../$_modname
	make modules
}

package() {
	cd build/objs
	for mod in *.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
	done
}
