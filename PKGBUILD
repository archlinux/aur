# Maintainer: Gregor Reitzenstein <dequbed@paranoidlabs.org>

pkgname=nginx-mainline-mod-auth_spnego
pkgver=1.1.0
pkgrel=1

_modname=spnego-http-auth-nginx-module
_nginxver=1.13.3

pkgdesc='Nginx module to use SPNEGO for http authentication'
arch=('i686' 'x86_64')
depends=('nginx-mainline' 'krb5')
url="https://github.com/stnoonan/spnego-http-auth-nginx-module"
license=('BSD')

source=(
    https://nginx.org/download/nginx-$_nginxver.tar.gz
    git+https://github.com/stnoonan/spnego-http-auth-nginx-module.git
)

sha256sums=('5b73f98004c302fb8e4a172abf046d9ce77739a82487e4873b39f9b0dcbb0d72'
            'SKIP')

build() {
    cd "$srcdir"/nginx-$_nginxver
    #./configure --with-cc-opts=-Wno-error --with-compat --add-dynamic-module=../$_modname-$pkgver
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
