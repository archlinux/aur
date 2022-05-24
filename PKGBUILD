# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-modsecurity
pkgver=1.0.3
pkgrel=1

pkgdesc='ModSecurity v3 Nginx Connector (module for mainline nginx)'
arch=('i686' 'x86_64')
depends=('nginx-mainline' 'libmodsecurity')
makedepends=('nginx-mainline-src')
url="https://github.com/SpiderLabs/ModSecurity-nginx"
license=('GPL3')

source=(https://github.com/SpiderLabs/ModSecurity-nginx/releases/download/v$pkgver/modsecurity-nginx-v$pkgver.tar.gz{,.asc})
validpgpkeys=('B0F4253373F8F6F510D42178520A9993A1C052F8'  # Maxim Dounin <mdounin@mdounin.ru>
              '190EFACCA1E9FA466A8ECD9CE6DFB08CE8B11277' # Felipe Zimmerle
              'F126692E9BA86B3958E73ED2F2FC4E45883BCBA4') # Martin Vierula
sha256sums=('ae811c7208ac029cb7a99d6f63e03d3971797607517187f47620df39c1f78add'
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
