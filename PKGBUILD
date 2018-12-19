# Maintainer: Oliver Paschke <oli.paschke@gmail.com>

pkgname=nginx-mainline-mod-auth-ldap-git
pkgver=r139.22d1e84
pkgrel=3

_modname=nginx-auth-ldap
_nginxver=1.15.7

pkgdesc='LDAP Authentication module for nginx'
arch=('i686' 'x86_64')
depends=('nginx-mainline' 'libldap')
makedepends=('git')
url="https://github.com/kvspb/nginx-auth-ldap"
license=('BSD')

source=(
    https://nginx.org/download/nginx-$_nginxver.tar.gz
    git+https://github.com/kvspb/nginx-auth-ldap.git
)

sha256sums=('8f22ea2f6c0e0a221b6ddc02b6428a3ff708e2ad55f9361102b1c9f4142bdf93'
            'SKIP')

pkgver() {
    cd "$srcdir"/$_modname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

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
