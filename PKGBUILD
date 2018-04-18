# Maintainer: Oliver Paschke <oli.paschke@gmail.com>

pkgname=nginx-mainline-mod-auth-ldap-git
pkgver=r137.42d195d
pkgrel=8

_modname=nginx-auth-ldap
_nginxver=1.13.12

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

sha256sums=('fb92f5602cdb8d3ab1ad47dbeca151b185d62eedb67d347bbe9d79c1438c85de'
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
