# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-ndk
pkgver=0.3.1
pkgrel=4

_modname="ngx_devel_kit"

pkgdesc="Module for mainline nginx that adds generic tools that module developers can use"
arch=('i686' 'x86_64')
depends=('nginx-mainline')
makedepends=('nginx-mainline-src')
url="https://github.com/vision5/ngx_devel_kit"
license=('BSD')

source=(https://github.com/vision5/$_modname/archive/v$pkgver/$_modname-$pkgver.tar.gz)
sha256sums=('0e971105e210d272a497567fa2e2c256f4e39b845a5ba80d373e26ba1abfbd85')

prepare() {
	mkdir -p build
	cd build
	ln -sf /usr/src/nginx/auto
	ln -sf /usr/src/nginx/src
}

build() {
	cd build
	/usr/src/nginx/configure --with-compat --add-dynamic-module=../$_modname-$pkgver
	make modules
}

package() {
	install -Dm644 "$srcdir"/$_modname-$pkgver/LICENSE \
	               "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

	cd build/objs
	for mod in *.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
	done
}
