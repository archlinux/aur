# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-dav-ext
pkgver=0.1.0
pkgrel=2

_modname="${pkgname#nginx-mainline-mod-}"
_nginxver=1.13.4

pkgdesc='Nginx mainline module with support for missing PROPFIND and OPTIONS WebDAV methods'
arch=('i686' 'x86_64')
depends=('nginx-mainline')
url="https://github.com/arut/nginx-dav-ext-module"
license=('CUSTOM')

source=(
	https://nginx.org/download/nginx-$_nginxver.tar.gz
	https://github.com/arut/nginx-dav-ext-module/archive/v$pkgver/nginx-dav-ext-module-$pkgver.tar.gz
)

sha256sums=('de21f3c49ba65c611329d8759a63d72e5fcf719bc6f2a3270e2541348ef1fbba'
            '6b004eed8ea16ad8de4d304027bf0413cc323a95914e58625a7dc066481aae3a')

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
