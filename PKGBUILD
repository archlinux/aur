# Maintainer: Gregor Reitzenstein <dequbed@paranoidlabs.org>

pkgname=nginx-mainline-mod-auth_spnego
pkgver=1.1.0
pkgrel=2

_modname=spnego-http-auth-nginx-module
_nginxver=1.13.4

pkgdesc='Nginx module to use SPNEGO for http authentication'
arch=('i686' 'x86_64')
depends=('nginx-mainline' 'krb5')
url="https://github.com/stnoonan/spnego-http-auth-nginx-module"
license=('BSD')

source=(
    https://nginx.org/download/nginx-$_nginxver.tar.gz
    git+https://github.com/stnoonan/spnego-http-auth-nginx-module.git
)

sha256sums=('de21f3c49ba65c611329d8759a63d72e5fcf719bc6f2a3270e2541348ef1fbba'
            'SKIP')

build() {
    cd "$srcdir"/nginx-$_nginxver
    ./configure --with-compat --add-dynamic-module=../$_modname
    make modules
}

package() {
    install -Dm644 "$srcdir"/$_modname/LICENSE \
                   "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

    cd "$srcdir"/nginx-$_nginxver/objs
    for mod in *.so; do
        install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
    done
}
