# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-dav-ext
pkgver=0.0.3
pkgrel=3

_modname="${pkgname#nginx-mainline-mod-}"
_nginxver=1.13.0

pkgdesc='Nginx mainline module with support for missing PROPFIND and OPTIONS WebDAV methods'
arch=('i686' 'x86_64')
depends=('nginx-mainline')
url="https://github.com/arut/nginx-dav-ext-module"
license=('CUSTOM')

source=(
	http://nginx.org/download/nginx-$_nginxver.tar.gz
	https://github.com/arut/nginx-dav-ext-module/archive/v$pkgver/nginx-dav-ext-module-$pkgver.tar.gz
	nginx-dav-ext-dynamin-module.patch::https://patch-diff.githubusercontent.com/raw/arut/nginx-dav-ext-module/pull/26.patch
)

sha256sums=('79f52ab6550f854e14439369808105b5780079769d7b8db3856be03c683605d7'
            'd428a0236c933779cb40ac8c91afb19d5c25a376dc3caab825bfd543e1ee530d'
            '722e12ff18ded5266f9ca29f5d9db79205d8247f82981c928663fbbe39d20833')

prepare() {
	cd "$srcdir"/nginx-dav-ext-module-$pkgver
	patch -p1 -i "$srcdir"/nginx-dav-ext-dynamin-module.patch
}

build() {
	cd "$srcdir"/nginx-$_nginxver
	./configure $(nginx -V 2>&1 | grep 'configure arguments' | sed -r 's@^[^:]+: @@') --add-dynamic-module=../nginx-dav-ext-module-$pkgver
	make modules
}

package() {
	cd "$srcdir"/nginx-$_nginxver/objs
	for mod in *.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
	done
}
