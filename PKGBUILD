# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=angie-mod-njs
pkgver=0.8.3
pkgrel=1
pkgdesc='nginScript module for angie'
arch=('x86_64')
depends=('angie' 'libxslt')
makedepends=('angie-src')
url="https://nginx.org/en/docs/njs_about.html"
license=('CUSTOM')
source=(njs-$pkgver.tar.gz::http://hg.nginx.org/njs/archive/$pkgver.tar.gz)
sha256sums=('b7afc0e67cf1be8f9ea4b1e6133026e7fb6b8953fafc947d0778ca48a0aa1e64')

prepare() {
	mkdir -p build
	cd build
	ln -sf /usr/src/angie/auto
	ln -sf /usr/src/angie/src
}

build() {
	cd build
	/usr/src/angie/configure --with-compat --with-stream --add-dynamic-module=../njs-$pkgver/nginx
	make modules
}

package() {
	install -Dm644 "$srcdir"/njs-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	cd build/objs
	for mod in *.so; do
		install -Dm755 $mod "$pkgdir/usr/lib/nginx/modules/$mod"
	done
}
