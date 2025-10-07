# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=angie-mod-njs
pkgver=0.9.3
pkgrel=1
pkgdesc='nginScript module for angie'
arch=('x86_64')
depends=('angie' 'libxslt')
makedepends=('angie-src')
url="https://github.com/nginx/njs"
license=('CUSTOM')
source=(njs-$pkgver.tar.gz::https://github.com/nginx/njs/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('a1ad089a52ebd295489443faea3089d12df414f5da624446d6c2bf7d99ec36cb')

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
