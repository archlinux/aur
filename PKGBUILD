
pkgname=nginx-mod-rtmpt-proxy
pkgver=1.0.0
pkgrel=1

_modname="nginx-rtmpt-proxy-module"
_nginxver="$(/bin/nginx -v 2>&1 | grep -Eo '([[:digit:]]|\.)+')"

pkgdesc="Module for nginx that adds RTMP support"
arch=('i686' 'x86_64')
depends=('nginx')
url="https://github.com/kwojtek/nginx-rtmpt-proxy-module.git"
license=('BSD')

source=(
    http://nginx.org/download/nginx-$_nginxver.tar.gz
    http://nginx.org/download/nginx-$_nginxver.tar.gz.asc
    https://github.com/kwojtek/$_modname/archive/master.zip
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP')
validpgpkeys=('B0F4253373F8F6F510D42178520A9993A1C052F8')

build() {
    cd "$srcdir"/nginx-$_nginxver
    ./configure --with-compat --add-dynamic-module=../$_modname-master
    make modules
}

package() {
    cd "$srcdir"/nginx-$_nginxver/objs
    for mod in *.so; do
        install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
    done
}
