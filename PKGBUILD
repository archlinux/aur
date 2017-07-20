# Maintainer: Trevor Bergeron <aur@sec.gd>

pkgname=nginx-mainline-mod-rtmp
pkgver=1.2.0
pkgrel=1

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
sha256sums=('5b73f98004c302fb8e4a172abf046d9ce77739a82487e4873b39f9b0dcbb0d72'
            'SKIP'
            'a8026f5ade30b178a06f12c46dff053cfe12256016ad465a46646183086b16b0')
validpgpkeys=('B0F4253373F8F6F510D42178520A9993A1C052F8')

build() {
    cd "$srcdir"/nginx-$_nginxver
    #./configure $(nginx -V 2>&1 | grep 'configure arguments' | sed -r 's@^[^:]+: @@') --add-dynamic-module=../$_modname-$pkgver
    # Cribbed from aur/nginx-mainline-mod-http-xslt-filter by Sergey Shatunov
    opts=$(nginx -V 2>&1 | grep 'configure arguments' | sed -r 's@^[^:]+: @@')
    IFS=$'\n' opts=( $(xargs -n1 <<< "$opts") )
    ./configure "${opts[@]}" --add-dynamic-module=../$_modname-$pkgver
    make modules
}

package() {
    cd "$srcdir"/nginx-$_nginxver/objs
    for mod in *.so; do
        install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
    done
}
