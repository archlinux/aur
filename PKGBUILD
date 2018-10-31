# Maintainer: Frank Tang <roadtang@gmail.com>

pkgname=nginx-mod-vod
pkgver=1.24
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
            'b3cad8e3047556955fa028bcc68e7af46d19343942cb7984ad25e6f44d614ddf')
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
