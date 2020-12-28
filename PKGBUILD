# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-cache_purge
pkgver=2.5.1
pkgrel=4

_modname="${pkgname#nginx-mainline-mod-}"

pkgdesc='Nginx mainline module with ability to purge content from FastCGI, proxy, SCGI and uWSGI caches'
arch=('i686' 'x86_64')
depends=('nginx-mainline')
makedepends=('nginx-mainline-src')
url="https://github.com/nginx-modules/ngx_cache_purge"
license=('CUSTOM')

source=(https://github.com/nginx-modules/ngx_cache_purge/archive/$pkgver/ngx_cache_purge-$pkgver.tar.gz)
sha256sums=('9db968170c301168c4a623bce3fefe8bfd93d676c2006d1a8b2d5eec668cc22c')

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
