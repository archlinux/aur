# Maintainer: Daniil Gentili <daniil@daniil.it>

pkgname=nginx-mod-zstd
pkgver=0.1.1
pkgrel=1
_modname="zstd-nginx-module"

pkgdesc="Nginx modules for the Zstandard compression"
arch=('x86_64')
url="https://github.com/tokers/zstd-nginx-module"
license=('BSD-2-Clause')
depends=('zstd>=1.4.0' 'glibc')
makedepends=('git' 'nginx-src')
provides=('nginx-mod-zstd')
conflicts=('nginx-mod-zstd' 'nginx-mainline-mod-zstd')
source=(https://github.com/tokers/zstd-nginx-module/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('707d534f8ca4263ff043066db15eac284632aea875f9fe98c96cea9529e15f41')

prepare() {
	mkdir -p build
	cd build
	ln -sf /usr/src/nginx/auto
	ln -sf /usr/src/nginx/src

	cd "$srcdir"/zstd-nginx-module-$pkgver
	sed 's@/usr/local@/usr@' -i config
}

build() {
	cd build
	/usr/src/nginx/configure --with-compat --add-dynamic-module=../$_modname-$pkgver
	make modules
}

package() {
	install -Dm644 "$srcdir"/$_modname-$pkgver/LICENSE \
	               "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

	cd "$srcdir"/build/objs
	for mod in ngx_*.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
	done
}
