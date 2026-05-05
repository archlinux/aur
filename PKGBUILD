# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-cache_purge
pkgver=3.0.2
pkgrel=1

_modname="${pkgname#nginx-mainline-mod-}"

pkgdesc='Nginx mainline module with ability to purge content from FastCGI, proxy, SCGI and uWSGI caches'
arch=('i686' 'x86_64')
depends=('nginx-mainline')
makedepends=('nginx-mainline-src')
url="https://github.com/nginx-modules/ngx_cache_purge"
license=('CUSTOM')

source=(https://github.com/nginx-modules/ngx_cache_purge/archive/$pkgver/ngx_cache_purge-$pkgver.tar.gz)
sha256sums=('627f60bfd514bbe6de7af1bfcb4c69271d4588348d5e359cbd26679adf0f2fb0')

prepare() {
	mkdir -p build
	cd build
	ln -sf /usr/src/nginx/auto
	ln -sf /usr/src/nginx/src
}

build() {
	cd build
	/usr/src/nginx/configure --with-compat --add-dynamic-module=../ngx_cache_purge-$pkgver
	make modules
}

package() {
	install -Dm644 "$srcdir"/ngx_cache_purge-$pkgver/LICENSE \
	               "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

	cd "$srcdir"/build/objs
	for mod in *.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
	done
}
