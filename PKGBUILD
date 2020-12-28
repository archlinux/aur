# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-auth_pam
pkgver=1.5.1
pkgrel=41

_modname=ngx_http_auth_pam_module

pkgdesc='Nginx mainline module to use PAM for simple http authentication'
arch=('i686' 'x86_64')
depends=('nginx-mainline' 'pam')
makedepends=('nginx-mainline-src')
url="https://github.com/sto/ngx_http_auth_pam_module"
license=('BSD')

source=(
	https://github.com/sto/$_modname/archive/v$pkgver/$_modname-$pkgver.tar.gz
	$_modname-critlog.patch::https://patch-diff.githubusercontent.com/raw/sto/ngx_http_auth_pam_module/pull/11.patch
)

sha256sums=('77676842919134af88a7b4bfca4470223e3a00d287d17c0dbdc9a114a685b6e7'
            '1a59787672cf9c6768cb77c31f19a870eaf556c7b28c8c22a22cf8a7013b93af')

prepare() {
	mkdir -p build
	cd build
	ln -sf /usr/src/nginx/auto
	ln -sf /usr/src/nginx/src

	cd "$srcdir"/$_modname-$pkgver
	patch -p1 -i "$srcdir"/$_modname-critlog.patch
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
