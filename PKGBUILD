# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-dav-ext
pkgver=3.0.0
pkgrel=17

_modname="${pkgname#nginx-mainline-mod-}"
_nginxver=1.19.0

pkgdesc='Nginx mainline module with support for missing PROPFIND and OPTIONS WebDAV methods'
arch=('i686' 'x86_64')
depends=('nginx-mainline' 'libxslt')
url="https://github.com/arut/nginx-dav-ext-module"
license=('CUSTOM')

source=(
	https://nginx.org/download/nginx-$_nginxver.tar.gz{,.asc}
	https://github.com/arut/nginx-dav-ext-module/archive/v$pkgver/nginx-dav-ext-module-$pkgver.tar.gz
)

validpgpkeys=(
	'B0F4253373F8F6F510D42178520A9993A1C052F8' # Maxim Dounin <mdounin@mdounin.ru>
)

sha256sums=('44a616171fcd7d7ad7c6af3e6f3ad0879b54db5a5d21be874cd458b5691e36c8'
            'SKIP'
            'd2499d94d82d4e4eac8425d799e52883131ae86a956524040ff2fd230ef9f859')

build() {
	cd "$srcdir"/nginx-$_nginxver
	./configure --with-compat --add-dynamic-module=../nginx-dav-ext-module-$pkgver
	make modules
}

package() {
	cd "$srcdir"/nginx-$_nginxver/objs
	for mod in *.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
	done
}
