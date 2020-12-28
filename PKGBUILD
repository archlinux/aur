# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-modsecurity
pkgver=1.0.1
pkgrel=11

pkgdesc='ModSecurity v3 Nginx Connector (module for mainline nginx)'
arch=('i686' 'x86_64')
depends=('nginx-mainline' 'libmodsecurity')
makedepends=('nginx-mainline-src')
url="https://github.com/SpiderLabs/ModSecurity-nginx"
license=('GPL3')

source=(https://github.com/SpiderLabs/ModSecurity-nginx/releases/download/v$pkgver/modsecurity-nginx-v$pkgver.tar.gz{,.asc})
validpgpkeys=(
	'190EFACCA1E9FA466A8ECD9CE6DFB08CE8B11277' # Felipe Zimmerle
)
sha256sums=('def45a8db5bc9da14765eda75363457209a86c89538ccf5bfbd3aa02fa10833c'
            'SKIP')

prepare() {
	mkdir -p build
	cd build
	ln -sf /usr/src/nginx/auto
	ln -sf /usr/src/nginx/src
}

build() {
	cd build
	/usr/src/nginx/configure --with-compat --add-dynamic-module=../modsecurity-nginx-v$pkgver
	make modules
}

package() {
	cd build/objs
	for mod in *.so; do
		install -Dm755 $mod "$pkgdir/usr/lib/nginx/modules/$mod"
	done
}
