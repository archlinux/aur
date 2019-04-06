# Maintainer: wobbol <no@spam.com>
# Contributor: Jakob Riepler <aur@chaosfield.at>
# Contributor: Trevor Bergeron <aur@sec.gd>

pkgname=nginx-mod-rtmp-git
pkgver=1196.a5ac72c
pkgrel=1

_modname="nginx-rtmp-module"
_nginxver="$(/bin/nginx -v 2>&1 | grep -Eo '([[:digit:]]|\.)+')"

pkgdesc="Module for nginx that adds RTMP support"
arch=('i686' 'x86_64')
depends=('nginx')
url="https://github.com/sergey-dryabzhinsky/nginx-rtmp-module"
license=('BSD')

source=(
	"http://nginx.org/download/nginx-$_nginxver.tar.gz"
	"http://nginx.org/download/nginx-$_nginxver.tar.gz.asc"
	"$_modname::git+https://github.com/sergey-dryabzhinsky/nginx-rtmp-module.git"
)
sha256sums=(
	'SKIP'
	'SKIP'
	'SKIP'
)

validpgpkeys=('B0F4253373F8F6F510D42178520A9993A1C052F8')

pkgver() {
	cd "$_modname"
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "nginx-$_nginxver"
    ./configure --with-compat --add-dynamic-module="../$_modname"
}

build() {
    cd "nginx-$_nginxver"
    make modules
}

package() {
    cd "nginx-$_nginxver/objs"
    for mod in *.so; do
        install -Dm755 "$mod" "$pkgdir/usr/lib/nginx/modules/$mod"
    done
}
