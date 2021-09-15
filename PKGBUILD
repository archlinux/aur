# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-vts
pkgver=0.1.18
pkgrel=33

_modname="${pkgname#nginx-mainline-mod-}"
_nginxver=1.21.3

pkgdesc='Nginx virtual host traffic status module (module for mainline nginx)'
arch=('i686' 'x86_64')
depends=()  # the build process doesn't require or use installed nginx, so add the dependency in package() to break the cycle
url="https://github.com/vozlt/nginx-module-vts"
license=('BSD')

source=(
	https://nginx.org/download/nginx-$_nginxver.tar.gz
	$pkgname-$pkgver.tar.gz::https://github.com/vozlt/nginx-module-vts/archive/v$pkgver.tar.gz
)

sha256sums=('31771c560e46d73650568e8193cb94d981081f83dd62d1ba43af1a1e0ba25185'
            '17ea41d4083f6d1ab1ab83dad9160eeca66867abe16c5a0421f85a39d7c84b65')

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
