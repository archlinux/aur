# Maintainer: Jakob (XDjackieXD) <aur at chaosfield dot at>
# Contributor: Trevor Bergeron <aur at sec dot gd>

pkgname=nginx-mod-rtmp
pkgver=1.2.1
pkgrel=1

_modname="nginx-rtmp-module"
_nginxver="$(/bin/nginx -v 2>&1 | grep -Eo '([[:digit:]]|\.)+')"

pkgdesc="Module for nginx that adds RTMP support"
arch=('i686' 'x86_64')
depends=('nginx')
url="https://github.com/arut/nginx-rtmp-module"
license=('BSD')

source=(
    http://nginx.org/download/nginx-$_nginxver.tar.gz
    http://nginx.org/download/nginx-$_nginxver.tar.gz.asc
    https://github.com/arut/$_modname/archive/v$pkgver.tar.gz
)
sha256sums=('SKIP'
            'SKIP'
            '87aa597400b0b5a05274ee2d23d8cb8224e12686227a0abe31d783b3a645ea37')
validpgpkeys=('B0F4253373F8F6F510D42178520A9993A1C052F8')

build() {
    cd "$srcdir"/nginx-$_nginxver

    ./configure --with-compat --add-dynamic-module=../$_modname-$pkgver

    make modules
}

package() {
    cd "$srcdir"/nginx-$_nginxver/objs
    for mod in *.so; do
        install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
    done
}
