# Maintainer: zotan <aur@zotan.email>
# Contributor: wobbol <no@spam.com>
# Contributor: Jakob Riepler <aur@chaosfield.at>
# Contributor: Trevor Bergeron <aur@sec.gd>

pkgname=nginx-mod-rtmp-zotanmew-git
pkgver=1246.a5f44b6
pkgrel=1

_modname="nginx-rtmp-module"
_nginxver="$(/bin/nginx -v 2>&1 | grep -Eo '([[:digit:]]|\.)+')"

pkgdesc='Module for nginx that adds RTMP, HLS, and MPEG-DASH support. zotanmew fork.'
arch=('i686' 'x86_64')
depends=('nginx' 'openssl')
provides=("$_modname")
conflicts=('nginx-mod-rtmp' 'nginx-mod-rtmp-git')
url='https://github.com/zotanmew/nginx-rtmp-module'
license=('BSD')

source=(
	"http://nginx.org/download/nginx-$_nginxver.tar.gz"
	"http://nginx.org/download/nginx-$_nginxver.tar.gz.asc"
	"$_modname::git+https://github.com/zotanmew/nginx-rtmp-module.git#branch=rebase"
)
sha256sums=('77a2541637b92a621e3ee76776c8b7b40cf6d707e69ba53a940283e30ff2f55d'
            'SKIP'
            'SKIP')

# Maxim Dounin <mdounin@mdounin.ru>
# Konstantin Pavlov <thresh@nginx.com>
validpgpkeys=('B0F4253373F8F6F510D42178520A9993A1C052F8' '13C82A63B603576156E30A4EA0EA981B66B0D967')

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
