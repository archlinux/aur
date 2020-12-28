# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-passenger
pkgver=6.0.7
pkgrel=1

_modname="${pkgname#nginx-mainline-mod-}"

pkgdesc="Fast and robust web server and application server for Ruby, Python and Node.js (module for mainline nginx)"
arch=('i686' 'x86_64')
depends=('nginx-mainline' 'ruby')
makedepends=('nginx-mainline-src' 'ruby-rake')
url="https://www.phusionpassenger.com"
license=('MIT')

source=(https://github.com/phusion/passenger/archive/release-$pkgver/$_modname-$pkgver.tar.gz)
sha256sums=('b53defde728995c444c6b648984b38b9f4d911baf37dfff59bf3dbf37dda4774')

prepare() {
	mkdir -p build
	cd build
	ln -sf /usr/src/nginx/auto
	ln -sf /usr/src/nginx/src
}

build() {
	cd build
	/usr/src/nginx/configure --with-compat --add-dynamic-module=../$_modname-release-$pkgver/src/nginx_module
	make modules
}

package() {
	install -Dm644 "$srcdir"/$_modname-release-$pkgver/LICENSE \
	               "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

	cd build/objs
	for mod in ngx_*.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
	done
}
