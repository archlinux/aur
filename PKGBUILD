# Maintainer: Frank Tang <roadtang@gmail.com>

pkgname=nginx-mod-vod
pkgver=1.27
pkgrel=1

_modname="nginx-vod-module"
_nginxver="$(/bin/nginx -v 2>&1 | grep -Eo '([[:digit:]]|\.)+')"

pkgdesc="Module for nginx that adds VOD packager/support"
arch=('i686' 'x86_64')
depends=('nginx')
url="https://github.com/kaltura/nginx-vod-module"
license=('BSD')

source=(
    http://nginx.org/download/nginx-$_nginxver.tar.gz
    http://nginx.org/download/nginx-$_nginxver.tar.gz.asc
    https://github.com/kaltura/$_modname/archive/$pkgver.tar.gz
)
sha256sums=('SKIP'
            'SKIP'
            'b7f0e2eecbcdb8ed1f8c90eb86c756f563fc5d21768a351abe4de63f3ddf01d6'            
            )
validpgpkeys=("B0F4253373F8F6F510D42178520A9993A1C052F8")

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
