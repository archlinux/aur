# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Manuel Hüsers <aur@huesers.de>

pkgname=nginx-mod-form-input
pkgver=0.12
pkgrel=1

_modname="${pkgname#nginx-mod-}"
_ndkver='0.3.1'

pkgdesc='Nginx module that reads HTTP POST and PUT request body encoded in "application/x-www-form-urlencoded", and parse the arguments in request body into nginx variables.'
arch=('x86_64')
depends=('nginx' 'nginx-mod-ndk')
makedepends=('nginx-src')
url="https://github.com/calio/$_modname-nginx-module"
license=('BSD')

source=(
	https://github.com/vision5/ngx_devel_kit/archive/v$_ndkver/ngx_devel_kit-$_ndkver.tar.gz
	https://github.com/calio/$_modname-nginx-module/archive/v$pkgver/$_modname-$pkgver.tar.gz
)
sha512sums=('de1e3349d8dd08e5982279b2219dc8a8006739f0409b8e0f5c50d93434beff1fbafba43e9c5ac85a5fab90afc5c0a7244a340610339c36f82f2cba7233e72de9'
            '1c5c5ab74156cac09da44a2dcdd84f7c03c9919a23a847e63613e00e3781ecd73d5ad12446174b4fdef9d064257a31570a8dbcccc00d8266f7048e3dcde0362e')

build() {
	cp -r /usr/src/nginx .
	cd "$srcdir"/nginx
	./configure --with-compat \
	  --add-module=../ngx_devel_kit-$_ndkver \
	  --add-dynamic-module=../$_modname-nginx-module-$pkgver
	make modules
}

package() {
	cd "$srcdir"/nginx/objs
	for mod in *.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
	done

	install -Dm644 "$srcdir"/$_modname-nginx-module-$pkgver/README.md \
	               "$pkgdir"/usr/share/licenses/$pkgname/README.md
}
