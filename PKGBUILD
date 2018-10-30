# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-modsecurity
pkgver=1.0.0
pkgrel=11
_nginxver=1.15.5

pkgdesc='ModSecurity v3 Nginx Connector (module for mainline nginx)'
arch=('i686' 'x86_64')
depends=('nginx-mainline' 'libmodsecurity')
url="https://github.com/SpiderLabs/ModSecurity-nginx"
license=('GPL3')

source=(
	https://nginx.org/download/nginx-$_nginxver.tar.gz{,.asc}
	https://github.com/SpiderLabs/ModSecurity-nginx/releases/download/v$pkgver/modsecurity-nginx-v$pkgver.tar.gz{,.asc}
)
validpgpkeys=(
	'B0F4253373F8F6F510D42178520A9993A1C052F8' # Maxim Dounin <mdounin@mdounin.ru>
	'190EFACCA1E9FA466A8ECD9CE6DFB08CE8B11277' # Felipe Zimmerle
)
sha256sums=('1a3a889a8f14998286de3b14cc1dd5b2747178e012d6d480a18aa413985dae6f'
            'SKIP'
            '06f78eb6d33833cc247257c4095c0ee528e80a61f1f52e1da5fdca5e464975a0'
            'SKIP')


build() {
	cd "$srcdir"/nginx-$_nginxver
	./configure --with-compat --add-dynamic-module=../modsecurity-nginx-v$pkgver
	make modules
}

package() {
	cd "$srcdir"/nginx-$_nginxver/objs
	for mod in *.so; do
		install -Dm755 $mod "$pkgdir/usr/lib/nginx/modules/$mod"
	done
}
