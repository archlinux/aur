# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-auth_pam
pkgver=1.5.5
pkgrel=1
_modname=ngx_http_auth_pam_module
pkgdesc='Nginx mainline module to use PAM for simple http authentication'
arch=('i686' 'x86_64')
depends=('nginx-mainline' 'pam')
makedepends=('nginx-mainline-src')
url="https://github.com/sto/ngx_http_auth_pam_module"
license=('BSD')
source=(https://github.com/sto/$_modname/archive/v$pkgver/$_modname-$pkgver.tar.gz)
sha256sums=('98a71617d9119ae784993e3789ce8766fdf2ff2479691f3dc6cf8d8763f8d364')

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
	install -Dm644 "$srcdir"/$_modname-$pkgver/LICENSE \
	               "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

	cd "$srcdir"/build/objs
	for mod in *.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
	done
}
