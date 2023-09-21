# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=angie-mod-njs
pkgver=0.8.1
pkgrel=1
pkgdesc='nginScript module for angie'
arch=('x86_64')
depends=('angie' 'libxslt')
makedepends=('angie-src')
url="https://nginx.org/en/docs/njs_about.html"
license=('CUSTOM')
source=(njs-$pkgver.tar.gz::http://hg.nginx.org/njs/archive/$pkgver.tar.gz)
sha256sums=('a8f63305a7a03a84ba0c0228b405ab77d4643d9626f1eb17464c5365ba4b334c')

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
