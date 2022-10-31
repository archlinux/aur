# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-vts
pkgver=0.2.1
pkgrel=2

_modname="${pkgname#nginx-mainline-mod-}"
_nginxver=1.23.2

pkgdesc='Nginx virtual host traffic status module (module for mainline nginx)'
arch=('i686' 'x86_64')
depends=()  # the build process doesn't require or use installed nginx, so add the dependency in package() to break the cycle
url="https://github.com/vozlt/nginx-module-vts"
license=('BSD')

source=(
	https://nginx.org/download/nginx-$_nginxver.tar.gz
	$pkgname-$pkgver.tar.gz::https://github.com/vozlt/nginx-module-vts/archive/v$pkgver.tar.gz
)

sha256sums=('a80cc272d3d72aaee70aa8b517b4862a635c0256790434dbfc4d618a999b0b46'
            '1a63d78d3ae4df18b3a57a616eeee006cdc0bd71aa7ea2947046004b123704f4')

build() {
	cd "$srcdir"/nginx-$_nginxver
	./configure --with-compat --add-dynamic-module=../nginx-module-vts-$pkgver
	make modules
}

package() {
	depends=("nginx-mainline=$_nginxver")
	install -Dm644 "$srcdir"/nginx-module-vts-$pkgver/LICENSE \
	               "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

	cd "$srcdir"/nginx-$_nginxver/objs
	for mod in *.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
	done
}
