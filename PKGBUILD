# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-cache_purge
pkgver=2.5.6
pkgrel=1

_modname="${pkgname#nginx-mainline-mod-}"

pkgdesc='Nginx mainline module with ability to purge content from FastCGI, proxy, SCGI and uWSGI caches'
arch=('i686' 'x86_64')
depends=('nginx-mainline')
makedepends=('nginx-mainline-src')
url="https://github.com/nginx-modules/ngx_cache_purge"
license=('CUSTOM')

source=(https://github.com/nginx-modules/ngx_cache_purge/archive/$pkgver/ngx_cache_purge-$pkgver.tar.gz)
sha256sums=('bbad4277b8b70a98ba04ba9a1af78d1363266da56683da55a2d46ba97880206d')

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
