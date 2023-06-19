# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-auth_pam
pkgver=1.5.4
pkgrel=1
_modname=ngx_http_auth_pam_module
pkgdesc='Nginx mainline module to use PAM for simple http authentication'
arch=('i686' 'x86_64')
depends=('nginx-mainline' 'pam')
makedepends=('nginx-mainline-src')
url="https://github.com/sto/ngx_http_auth_pam_module"
license=('BSD')
source=(https://github.com/sto/$_modname/archive/v$pkgver/$_modname-$pkgver.tar.gz)
sha256sums=('2721f6bc47f27406dfdc7e59e0c1d12c9338d99d20e01457e8bcc6e7e3cd0643')

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
