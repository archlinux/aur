# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-naxsi
pkgver=1.3
pkgrel=1

_modname=naxsi

pkgdesc='Nginx Anti XSS & SQL Injection (module for mainline nginx)'
arch=('i686' 'x86_64')
depends=('nginx-mainline')
makedepends=('nginx-mainline-src')
url="https://github.com/nbs-system/naxsi"
license=('GPL3')
backup=('etc/nginx/naxsi_core.rules')

source=(https://github.com/nbs-system/$_modname/archive/$pkgver/$_modname-$pkgver.tar.gz
        https://github.com/nbs-system/$_modname/releases/download/$pkgver/$_modname-$pkgver.tar.gz.asc)
sha256sums=('439c8677372d2597b4360bbcc10bc86490de1fc75695b193ad5df154a214d628'
            'SKIP')
validpgpkeys=(
    '498C46FF087EDC36E7EAF9D445414A82A9B22D78' # Maxim Dounin <mdounin@mdounin.ru>
)


prepare() {
	mkdir -p build
	cd build
	ln -sf /usr/src/nginx/auto
	ln -sf /usr/src/nginx/src
}

build() {
	cd build
	/usr/src/nginx/configure --with-compat --add-dynamic-module=../$_modname-$pkgver/naxsi_src
	make modules
}

package() {
	cd build/objs
	for mod in *.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
	done

	cd "$srcdir"/$_modname-$pkgver
	install -Dm644 naxsi_config/naxsi_core.rules "$pkgdir"/etc/nginx/naxsi_core.rules
}
