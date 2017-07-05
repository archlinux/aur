# Maintainer: Trevor Bergeron <aur@sec.gd>

pkgname=nginx-mainline-mod-rtmp
pkgver=1.1.11
pkgrel=2

_modname="nginx-rtmp-module"
_nginxver="$(/bin/nginx -v 2>&1 | grep -Eo '([[:digit:]]|\.)+')"

pkgdesc="Module for mainline nginx that adds RTMP support"
arch=('i686' 'x86_64')
depends=('nginx-mainline')
url="https://github.com/arut/nginx-rtmp-module"
license=('BSD')

source=(
    http://nginx.org/download/nginx-$_nginxver.tar.gz
    http://nginx.org/download/nginx-$_nginxver.tar.gz.asc
    https://github.com/arut/$_modname/archive/v$pkgver.tar.gz
)
sha256sums=('SKIP'
            'SKIP'
            '71e8a0b42a41d1cb5ab1b9a8793f0e479e31fa9b59c4c6f5665df41cebf09e2b')
validpgpkeys=('B0F4253373F8F6F510D42178520A9993A1C052F8')

build() {
    cd "$srcdir"/nginx-$_nginxver
    ./configure $(nginx -V 2>&1 | grep 'configure arguments' | sed -r 's@^[^:]+: @@') --add-dynamic-module=../$_modname-$pkgver
    make modules
}

package() {
    cd "$srcdir"/nginx-$_nginxver/objs
    for mod in *.so; do
        install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
    done
}
