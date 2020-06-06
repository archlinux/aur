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
sha256sums=('0e971105e210d272a497567fa2e2c256f4e39b845a5ba80d373e26ba1abfbd85'
            '5c1869d55897075adb3fdf840b21060dc54669a1f840a36d1539acc7e59dd106')

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