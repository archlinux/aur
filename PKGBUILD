# Maintainer: Gregor Reitzenstein <dequbed@paranoidlabs.org>

pkgname=nginx-mainline-mod-auth_spnego
pkgver=1.1.0
pkgrel=3

_modname=spnego-http-auth-nginx-module
_nginxver=1.17.9

pkgdesc='Nginx module to use SPNEGO for http authentication'
arch=('i686' 'x86_64')
depends=('nginx-mainline' 'krb5')
url="https://github.com/stnoonan/spnego-http-auth-nginx-module"
license=('BSD')

source=(
    https://nginx.org/download/nginx-$_nginxver.tar.gz{,.asc}
    git+https://github.com/stnoonan/spnego-http-auth-nginx-module.git
)

validpgpkeys=(
	'B0F4253373F8F6F510D42178520A9993A1C052F8' # Maxim Dounin <mdounin@mdounin.ru>
)

sha256sums=('7dd65d405c753c41b7fdab9415cfb4bdbaf093ec6d9f7432072d52cb7bcbb689'
            'SKIP'
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
