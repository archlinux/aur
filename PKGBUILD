# Maintainer: Ricardo Constantino <wiiaboo@gmail.com>

pkgname=nginx-mainline-mod-zip
pkgver=1.3.0
pkgrel=1

_modname=mod_zip

pkgdesc='Streaming ZIP archiver for nginx (module for mainline nginx)'
arch=('i686' 'x86_64')
depends=('nginx-mainline')
makedepends=('nginx-mainline-src')
url="https://github.com/evanmiller/mod_zip"
license=('BSD')

source=(https://github.com/evanmiller/$_modname/archive/$pkgver/$pkgver.tar.gz)
sha256sums=('5e7f24b6b4efb8258d92ec921ade9df69e4bad36f833a39b47ee947b3d637f22')

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
	install -Dm644 "$srcdir/"$_modname-$pkgver/LICENSE \
	               "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

	cd build/objs
	for mod in *.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
	done
}
