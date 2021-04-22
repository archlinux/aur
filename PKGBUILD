# Maintainer: zotan <aur@zotan.email>
# Contributor: wobbol <no@spam.com>
# Contributor: Jakob Riepler <aur@chaosfield.at>
# Contributor: Trevor Bergeron <aur@sec.gd>

pkgname=nginx-mod-rtmp-lhaus-git
pkgver=1207.8aa8f06
pkgrel=2

_modname="nginx-rtmp-module"
_nginxver="$(/bin/nginx -v 2>&1 | grep -Eo '([[:digit:]]|\.)+')"

pkgdesc='Module for nginx that adds RTMP, HLS, and MPEG-DASH support. lhaus fork.'
arch=('i686' 'x86_64')
depends=('nginx' 'openssl')
provides=("$_modname")
url='https://github.com/lhaus/nginx-rtmp-module'
license=('BSD')

source=(
	"http://nginx.org/download/nginx-$_nginxver.tar.gz"
	"http://nginx.org/download/nginx-$_nginxver.tar.gz.asc"
	"$_modname::git+https://github.com/lhaus/nginx-rtmp-module.git#branch=dev"
)
sha256sums=(
	'SKIP'
	'SKIP'
	'SKIP'
)
# Maxim Dounin <mdounin@mdounin.ru>
validpgpkeys=('B0F4253373F8F6F510D42178520A9993A1C052F8')

pkgver() {
	cd "$_modname"
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "nginx-$_nginxver"
	./configure --with-compat "--add-dynamic-module=../$_modname"
	make modules
}

package() {
	cd "$_modname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	cd "../nginx-$_nginxver/objs"
	install -Dm755 ngx_rtmp_module.so "$pkgdir/usr/lib/nginx/modules/ngx_rtmp_module.so"
}
