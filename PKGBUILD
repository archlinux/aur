# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-njs
pkgver=0.8.0 # http://hg.nginx.org/njs/tags
pkgrel=1

_modname="${pkgname#nginx-mainline-mod-}"

pkgdesc='nginScript module for mainline nginx'
arch=('i686' 'x86_64')
depends=('nginx-mainline' 'libxslt')
makedepends=('nginx-mainline-src')
url="https://nginx.org/en/docs/njs_about.html"
license=('CUSTOM')

source=(njs-$pkgver.tar.gz::http://hg.nginx.org/njs/archive/$pkgver.tar.gz)
sha256sums=('c6645f07f89b52d8169492f1101a767ce93d46554f48d3330cae343bee4c1695')

prepare() {
	mkdir -p build
	cd build
	ln -sf /usr/src/nginx/auto
	ln -sf /usr/src/nginx/src
}

build() {
	cd build
	/usr/src/nginx/configure --with-compat --with-stream --add-dynamic-module=../njs-$pkgver/nginx
	make modules
}

package() {
	install -Dm644 "$srcdir"/njs-$pkgver/LICENSE \
	               "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

	cd build/objs
	for mod in *.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
	done
}
