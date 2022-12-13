# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-vts
pkgver=0.2.1
pkgrel=3

_modname="nginx-module-${pkgname#nginx-mainline-mod-}"

pkgdesc='Nginx virtual host traffic status module (module for mainline nginx)'
arch=('i686' 'x86_64')
depends=()  # the build process doesn't require or use installed nginx, so add the dependency in package() to break the cycle
makedepends=('nginx-mainline-src')
url="https://github.com/vozlt/nginx-module-vts"
license=('BSD')

source=(
	$_modname-$pkgver.tar.gz::https://github.com/vozlt/nginx-module-vts/archive/v$pkgver.tar.gz
)

sha256sums=('1a63d78d3ae4df18b3a57a616eeee006cdc0bd71aa7ea2947046004b123704f4')

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
	depends=("nginx-mainline")
	install -Dm644 "$srcdir"/$_modname-$pkgver/LICENSE \
	               "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

	cd build/objs
	for mod in *.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
	done
}
