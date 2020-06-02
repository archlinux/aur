# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-modsecurity
pkgver=1.0.1
pkgrel=7
_nginxver=1.19.0

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
sha256sums=('44a616171fcd7d7ad7c6af3e6f3ad0879b54db5a5d21be874cd458b5691e36c8'
            'SKIP'
            'def45a8db5bc9da14765eda75363457209a86c89538ccf5bfbd3aa02fa10833c'
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
